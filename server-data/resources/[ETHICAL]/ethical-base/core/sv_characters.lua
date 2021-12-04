function ETHICAL.Core.LoginPlayer(self, args, src, callback)
    TriggerEvent("ethical-base:playerAttemptLogin", src)

    local user = ETHICAL.Player:CreatePlayer(src, false)

    if not user then
        user = ETHICAL.Player:CreatePlayer(src, false)

        if not user then DropPlayer(src, "There was an error while creating your player object, if this persists, contact an administrator") return end
    end

    local function fetchData(_err)
        if _err and type(_err) == "string" then
            local errmsg = _err

            _err = {
                err = true,
                msg = errmsg
            }
            
            callback(_err)
            return
        end

        ETHICAL.DB:FetchPlayerData(src, function(data, err)
            if err then
                data = {
                    err = true,
                    msg = "Error fetching player data, there is a problem with the database"
                }
            end

            user:setRank(data.rank)

            callback(data)

            if not err then TriggerEvent("ethical-base:playerLoggedIn", user) TriggerClientEvent("ethical-base:playerLoggedIn", src) end
        end)
    end


	ETHICAL.DB:PlayerExistsDB(src, function(exists, err)
		if err then
			fetchData("Error checking player existence, there is a problem with the database")
			return -- my stepsister stuck
		end -- my mother stuck

		if not exists then
			ETHICAL.DB:CreateNewPlayer(src, function(created)
				if not created then
					fetchData("Error creating new user, there is a problem with the database")
					return
				end

				if created then fetchData() return end
			end)

			return
		end

		fetchData()
	end)
end
ETHICAL.Events:AddEvent(ETHICAL.Core, ETHICAL.Core.LoginPlayer, "ethical-base:loginPlayer")

function ETHICAL.Core.FetchPlayerCharacters(self, args, src, callback)
	local user = ETHICAL.Player:GetUser(src)

	if not user then return end

	ETHICAL.DB:FetchCharacterData(user, function(data, err)
		if err then
			data = {
				err = true,
				msg = "Error fetching player character data, there is a problem with the database"
			}
		else
			--print(json.encode(data))
			user:setCharacters(data)
			user:setVar("charactersLoaded", true)
			TriggerEvent("ethical-base:charactersLoaded", user, data)
			TriggerClientEvent("ethical-base:charactersLoaded", src, data)
		end

		callback(data)
	end)
end
ETHICAL.Events:AddEvent(ETHICAL.Core, ETHICAL.Core.FetchPlayerCharacters, "ethical-base:fetchPlayerCharacters")

function ETHICAL.Core.CreatePhoneNumber(self, src, callback)
	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(1000)
			math.randomseed(GetGameTimer())

			local areaCode = math.random(50) > 25 and 415 or 628
			local phonenumber = {}
			local numBase2 = math.random(100,999)
			local numBase3 = math.random(1000,9999)
			
			--phoneNumber = math.random(0000000000, 9999999999)
			phoneNumber = string.format(areaCode .. "" .. numBase2 .. "" .. numBase3)

			--areaCode = tostring(areaCode)

			local querying = true
			local success = false
		

			if phoneNumber then 
				--print(tostring(phoneNumber))
				--print('we both here')
				phoneNumber = tostring(phoneNumber)
				if phoneNumber then
					ETHICAL.DB:PhoneNumberExists(src, phoneNumber, function(exists, err)
						if err then callback(false, true) success = true querying = false print('phone number does not exist') return end
						if not exists then callback(phoneNumber) success = true print('sucess') end
						querying = false
					end)
				end
			end

			while querying do Citizen.Wait(0) end

			if success then return end
		end 
	end)
end

function ETHICAL.Core.CreateCharacter(self, charData, src, callback)
	local user = ETHICAL.Player:GetUser(src)

	if not user or not user:getVar("charactersLoaded") then return end
	if user:getNumCharacters() >= 8 then return end

	local fn = charData.firstname
	local ln = charData.lastname


	exports.ghmattimysql:execute("SELECT first_name FROM characters WHERE first_name = @fn AND last_name = @ln", 
	{
	["fn"] = fn, 
	["ln"] = ln
	}, function(result)
		if result[1] ~= nil then 
			created = {
				err = true,
				msg = "This name is already in use, pick another."
			}
			callback(created)
			return
		else
			self:CreatePhoneNumber(src, function(phoneNumber, err)
				if err then
					created = {
						err = true,
						msg = "There was an error when trying to create a phone number"
					}

					callback(created)
					return
				end
				local hexId = user:getVar("hexid")
				charData.phonenumber = phoneNumber
				--print('im cumming')
				--print(charData.phonenumber)

				ETHICAL.DB:CreateNewCharacter(user, charData, hexId, phoneNumber, function(created, err)
					if not created or err then
						created = {
							err = true,
							msg = "There was a problem creating your character, contact an administrator if this persists"
						}
					end

					callback(created)
				end)
			end)
		end
	end)
end
ETHICAL.Events:AddEvent(ETHICAL.Core, ETHICAL.Core.CreateCharacter, "ethical-base:createCharacter")

function ETHICAL.Core.DeleteCharacter(self, id, src, callback)
	local user = ETHICAL.Player:GetUser(src)

	if not user or not user:getVar("charactersLoaded") then return end

	local ownsCharacter = false
	for k,v in pairs(user:getCharacters()) do
		if v.id == id then ownsCharacter = true break end
	end

	if not ownsCharacter then return end

	ETHICAL.DB:DeleteCharacter(user, id, function(deleted)
		callback(deleted)
	end)
end
ETHICAL.Events:AddEvent(ETHICAL.Core, ETHICAL.Core.DeleteCharacter, "ethical-base:deleteCharacter")

function ETHICAL.Core.SelectCharacter(self, id, src, callback)
	local user = ETHICAL.Player:GetUser(src)

	--print('lol')

	if not user then callback(false) return end
	if not user:getCharacters() or user:getNumCharacters() <= 0 then callback(false) return end

	if not user:ownsCharacter(id) then callback(false) return end

	local selectedCharacter = user:getCharacter(id)
	selectedCharacter.phone_number = selectedCharacter.phone_number
	--print('selecting char')

	user:setCharacter(selectedCharacter)
	user:setVar("characterLoaded", true)

	callback({loggedin = true, chardata = selectedCharacter})
	
	local cid = selectedCharacter.id
	TriggerClientEvent('updatecid', src, cid)
	TriggerClientEvent('updatecids', src, cid)
	TriggerClientEvent('updateNameClient', src, tostring(selectedCharacter.first_name), tostring(selectedCharacter.last_name))
	TriggerClientEvent('banking:updateBalance', src, selectedCharacter.bank, true)
	TriggerClientEvent('banking:updateCash', src, selectedCharacter.cash, true)
	TriggerClientEvent('ethical-base:setcontrols', src)
	TriggerClientEvent('updatepasses', src)

	TriggerEvent("ethical-base:characterLoaded", user, selectedCharacter)
	TriggerClientEvent("ethical-base:characterLoaded", src, selectedCharacter)
end
ETHICAL.Events:AddEvent(ETHICAL.Core, ETHICAL.Core.SelectCharacter, "ethical-base:selectCharacter")