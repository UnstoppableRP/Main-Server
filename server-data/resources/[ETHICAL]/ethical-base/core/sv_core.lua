
function ETHICAL.Core.ConsoleLog(self, msg, mod, ply)
	if not tostring(msg) then return end
	if not tostring(mod) then mod = "No Module" end

	local pMsg = string.format("^3[ETHICAL LOG - %s]^7 %s", mod, msg)
	if not pMsg then return end
	if ply and tonumber(ply) then
		TriggerClientEvent("ethical-base:consoleLog", ply, msg, mod)
	end
end

AddEventHandler("onResourceStart", function(resource)
	TriggerClientEvent("ethical-base:waitForExports", -1)

	if not ETHICAL.Core.ExportsReady then return end

	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(0)
			if ETHICAL.Core.ExportsReady then
				TriggerEvent("ethical-base:exportsReady")
				return
			else
			end
		end
	end)
end)

RegisterNetEvent("ethical-base:playerSessionStarted")
AddEventHandler("ethical-base:playerSessionStarted", function()

	local src = source
	local name = GetPlayerName(src)
	local user = ETHICAL.Player:GetUser(src)
	if user then exports["ethical-log"]:AddLog("Player Left", user, user:getVar("name").." Has joined the server") end
	print("^0" .. name .. "^7 spawned into the server")
end)

AddEventHandler("ethical-base:characterLoaded", function(user, char)
	local src = source
	local hexId = user:getVar("hexid")

	if char.phone_number == 0 then
		ETHICAL.Core:CreatePhoneNumber(source, function(phonenumber, err)	
			local q = [[UPDATE characters SET phone_number = @phone WHERE owner = @owner and id = @cid]]
			local v = {
				["phone"] = phoneNumber,
				["owner"] = hexId,
				["cid"] = char.id
			}

			exports.ghmattimysql.execute(q, v, function()
				char.phone_number = math.floor(char.phone_number)
				user:setCharacter(char)
			end)
		end)
	end
end)

RegisterServerEvent("paycheck:collect")
AddEventHandler("paycheck:collect", function(cid)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
    exports.ghmattimysql:execute('SELECT `paycheck` FROM characters WHERE `id`= ?', {cid}, function(data)
        local amount = tonumber(data[1].paycheck)
        if amount >= 1 then
            exports.ghmattimysql:execute("UPDATE characters SET `paycheck` = ? WHERE `id` = ?", {"0", cid})
            user:addBank(amount)
        else
            TriggerClientEvent("DoLongHudText", src, "Your broke, go work!")
        end
    end)
end)
