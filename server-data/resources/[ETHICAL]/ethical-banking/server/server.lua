
print('[^3ethical-banking^7] ^2Successfully Started.^7')

RegisterServerEvent('ethical-banking:updateIdentifier')
AddEventHandler('ethical-banking:updateIdentifier', function(login, identifier)
	exports.ghmattimysql:execute('SELECT * FROM ethical_banking WHERE identifier = @identifier', {['@identifier'] = identifier}, function(result)
		if result[1] ~= nil then
			exports.ghmattimysql:execute("UPDATE ethical_banking SET identifier = @identifier2 WHERE identifier = @identifier", {
				['@identifier'] = identifier,
				['@identifier2'] = nil
			})
			exports.ghmattimysql:execute("UPDATE ethical_banking SET identifier = @identifier WHERE login = @login", {
				['@login'] = login,
				['@identifier'] = identifier
			})
		end
	end)
	exports.ghmattimysql:execute("UPDATE ethical_banking SET identifier = @identifier WHERE login = @login", {
		['@login'] = login,
		['@identifier'] = identifier
	})
end)

RegisterServerEvent('ethical-:updateLoggedTrue')
AddEventHandler('ethical-:updateLoggedTrue', function(login)
	MySQL.Async.execute("UPDATE ethical_banking SET isLogged = @isLogged WHERE login = @login", {
		['@login'] = login,
		['@isLogged'] = 1
	})
end)

RegisterServerEvent('ethical-banking:updateLoggedFalse')
AddEventHandler('ethical-banking:updateLoggedFalse', function()
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	
	exports.ghmattimysql:execute("UPDATE ethical_banking SET isLogged = @isLogged WHERE identifier = @identifier", {
		['@identifier'] = char.owner,
		['@isLogged'] = 0
	})
	TriggerClientEvent('focusoff', src)
end)

AddEventHandler('playerDropped', function()
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	MySQL.Async.execute("UPDATE ethical_banking SET isLogged = @isLogged WHERE identifier = @identifier", {
		['@identifier'] = char.owner,
		['@isLogged'] = 0
	})
end)  

function checking(login)
    local result = MySQL.Sync.fetchAll("SELECT ethical_banking.isLogged FROM ethical_banking WHERE ethical_banking.login = @login", {
        ['@login'] = login
    })
    if result[1] ~= nil then
        return result[1].isLogged
    end
    return nil
end


RegisterServerEvent('bank:login')
AddEventHandler('bank:login', function(login, password)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	exports.ghmattimysql:execute("SELECT * FROM ethical_banking WHERE ethical_banking.login = @login AND ethical_banking.password = @password",{
		['@login'] = login,
		['@password'] = password
	},function(result)
		if result[1].password == password then
					TriggerEvent('ethical-banking:updateIdentifier', login, char.owner)
					TriggerClientEvent('successlogin', src, result[1].login, result[1].name, result[1].debitcard, result[1].dc_pin, result[1].accountNumber)
					TriggerClientEvent('DoShortHudText', src, 'Logged in')
		else
				TriggerClientEvent('DoShortHudText', src, 'Check Over Your infomation!',2)
		end
	end)
end)

RegisterServerEvent('bank:loginatm')
AddEventHandler('bank:loginatm', function(login, password)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local passwordS = loginInto(login)
	local imie = getOwnersName(login)
	local karta = getOwnersDebit(login)
	local pindo = getOwnersDcPIN(login)
	local numerek = getOwnersAccNum(login)

--	local checkIfLogged = checking(login)

	if passwordS == password then
	--	if checkIfLogged == 0 then
			TriggerEvent('ethical-banking:updateIdentifier', login, char.owner)
			TriggerClientEvent('successloginatm', src, login, imie, karta, pindo, numerek)
		--	TriggerEvent('ethical-banking:updateLoggedTrue', login)
		TriggerClientEvent('DoShortHudText', src, 'Logged in')
	--	else
	--		TriggerClientEvent('bank:result', src, "error", Config.CurrentlyLogged)
	--	end
	else
		TriggerClientEvent('DoShortHudText', src, 'Check Over Your infomation!',2)
	end

end)




RegisterServerEvent('bank:loginbus')
AddEventHandler('bank:loginbus', function(login, password)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local passwordS = loginInto(login)
	local imie = getOwnersNamejob(login)
	local karta = getOwnersDebit(login)
	local pindo = getOwnersDcPIN(login)
	local numerek = getOwnersAccNum(login)

--	local checkIfLogged = checking(login)

	if passwordS == password then
	--	if checkIfLogged == 0 then
			TriggerEvent('ethical-banking:updateIdentifier', login, char.owner)
			TriggerClientEvent('successloginbus', src, login, imie, karta, pindo, numerek)
		--	TriggerEvent('ethical-banking:updateLoggedTrue', login)
		TriggerClientEvent('DoShortHudText', src, 'Logged in')
	--	else
	--		TriggerClientEvent('bank:result', src, "error", Config.CurrentlyLogged)
	--	end
	else
		TriggerClientEvent('DoShortHudText', src, 'Check Over Your infomation!',2)
	end

end)

function loginInto(login)
    exports.ghmattimysql:execute("SELECT ethical_banking.password FROM ethical_banking WHERE ethical_banking.login = @login", {
        ['@login'] = login
    },function(result)
		if result[1] ~= nil then
			return result[1].password
		end
		return nil
	end)

end

function getOwnersName(login)
	exports.ghmattimysql:execute("SELECT name FROM ethical_banking WHERE login = @login",{
		["@login"] = login
	},function(result)
		if result[1] ~= nil then
			return result[1].name
		end
		return nil
	end)
    
end

function getOwnersNamejob(login)
	local result = MySQL.Sync.fetchAll("SELECT jobname FROM ethical_banking WHERE login = @login",{
		["@login"] = login
	})
    if result[1] ~= nil then
        return result[1].jobname
    end
    return nil
end

function getOwnersDebit(login)
	exports.ghmattimysql:execute("SELECT debitcard FROM ethical_banking WHERE login = @login",{
		["@login"] = login
	},function(result)
		if result[1] ~= nil then
			return result[1].debitcard
		end
		return nil
	end)
    
end

function getOwnersAccNum(login)
	exports.ghmattimysql:execute("SELECT accountNumber FROM ethical_banking WHERE login = @login",{
		["@login"] = login
	},function(result)
		if result[1] ~= nil then
			return result[1].accountNumber
		end
		return nil
	end)
   
end



function getOwnersDcPIN(login)
	exports.ghmattimysql:execute("SELECT dc_pin FROM ethical_banking WHERE login = @login",{
		["@login"] = login
	},function(result)
		
		if result[1] ~= nil then
			return result[1].dc_pin
		end
		return nil
	end)

end


RegisterServerEvent('ethical-banking:getDcPIN')
AddEventHandler('ethical-banking:getDcPIN', function(debitnummmm, podanypin, item, value, zone, xPlayer)
	local result = MySQL.Sync.fetchAll("SELECT ethical_banking.dc_pin FROM ethical_banking WHERE ethical_banking.debitcard = @debitcard",{
		["@debitcard"] = debitnummmm
	})
	if result[1] ~= nil then
		if podanypin == result[1].dc_pin then
			TriggerEvent('esx_shops:buyItem', item, value, zone, debitnummmm, xPlayer)
		end
    end
    return nil
end)



-- function GetCharacterName(source)
--     local src = source
--     local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
-- 	local char = user:getCurrentCharacter()
-- 	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
-- 	{
-- 		['@identifier'] = char.owner
-- 	})
-- 	if result[1] ~= nil and result[1].first_name ~= nil and result[1].last_name ~= nil then
-- 		return result[1].firstname .. ' ' .. result[1].lastname
-- 	else
-- 		return GetPlayerName(src)
-- 	end
-- end

RegisterServerEvent('getmycasualname')
AddEventHandler('getmycasualname', function()
	local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local name = char.first_name .. ' ' .. char.last_name

	TriggerClientEvent('myname', src, name)
end)


function isLoginInUse(login)
	exports.ghmattimysql:execute('SELECT * FROM ethical_banking WHERE login = @login',
	{
		['@login'] = login
	}, function(result)
		if result[1] ~= nil then
			return true
		end
		return false
	end)

end

RegisterServerEvent('ethical-banking:createnewdcpin')
AddEventHandler('ethical-banking:createnewdcpin', function()
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local dc_pin = math.random(1000, 9999)
	MySQL.Async.execute("UPDATE ethical_banking SET dc_pin = @dc_pin WHERE identifier = @identifier", {
		['@identifier'] = char.owner,
		['@dc_pin'] = dc_pin
	})
	Wait(200)
end)


RegisterServerEvent('ethical-banking:deleteaccount')
AddEventHandler('ethical-banking:deleteaccount', function(kodusuniecia, kodzapasowy)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local kod = 0
	kod = getBackup(char.owner)
	if kodzapasowy == kod then
		MySQL.Async.execute("UPDATE ethical_banking SET password = @password WHERE identifier = @identifier", {
			['@identifier'] = char.owner,
			['@password'] = kodusuniecia
		})
		Wait(200)
		TriggerClientEvent('DoShortHudText', src, 'Password Change')
		TriggerClientEvent('accountdeleted', src)
	else
		TriggerClientEvent('DoShortHudText', src, 'Wrong Code',2)
		TriggerClientEvent('deletefail', src)
	end
end)

function getBackup(identifier)
    local result = MySQL.Sync.fetchAll("SELECT ethical_banking.pin FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].pin
    end
    return nil
end


RegisterServerEvent('ethical-banking:createnewaccount')
AddEventHandler('ethical-banking:createnewaccount', function(login, password, pin)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local name = char.first_name .. ' ' .. char.last_name
	local dc_pin = math.random(1000, 9999)
	local debitcard = '54' .. math.random(10, 99) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999)

	local accountnumber = math.random(10000000, 99999999)

	if login ~= '' and password ~= '' and pin ~= '' then
		local checkingLogin = isLoginInUse(login)
		if string.len(pin) == 4 then
					if checkingLogin then
					else
						exports.ghmattimysql:execute('INSERT INTO ethical_banking (name, login, password, pin, debitcard, dc_pin, isLogged, mainAccount, accountNumber) VALUES (@name, @login, @password, @pin, @debitcard, @dc_pin, @isLogged, @mainAccount, @accountNumber)',
						{
							['@name']   = name,
							['@login']	= login,
							['@password']	= password,
							['@pin']	= pin,
							['@debitcard'] = debitcard,
							['@dc_pin']	= dc_pin,
							['@isLogged'] = 0,
							['@mainAccount'] = 0,
							['@accountNumber'] = accountnumber
						})
		
						TriggerClientEvent('DoLongHudText', source, 'Account Created')
					end
		else
			TriggerClientEvent('DoLongHudText', source, 'Backup code needs to be 4 digit length')
		end
	else
		TriggerClientEvent('DoLongHudText', source, 'Login/Password/Backup code cannot be empty')
	end
end)




RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = char.owner
    }, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('currentbalance1', src, result[1].balance)
		end
	end)
	
end)




function getAccountBalance(identifier)
    exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = identifier
    }, function(result)
		if result[1] ~= nil then
			return result[1].balance
		end
		return nil
	end)
end

function getAccountJob(identifier)
    local result = MySQL.Sync.fetchAll("SELECT ethical_banking.jobname FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].jobname
    end
    return nil
end




function addAccountBalance(money)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = char.owner
    }, function(result)
		exports.ghmattimysql:execute("UPDATE ethical_banking SET balance = @balance WHERE identifier = @identifier", {
			['@identifier'] = char.owner,
			['@balance'] = result[1].balance + money
		})
	end)
end

function removeAccountBalance(src, identifier, money)
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	-- local balance = getAccountBalance(char.owner)
	exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = identifier
    }, function(result)
		exports.ghmattimysql:execute("UPDATE ethical_banking SET balance = @balance WHERE identifier = @identifier", {
			['@identifier'] = identifier,
			['@balance'] = result[1].balance - money
		})
	end)
end


function getAccountBalanceShop(cardnumber)
    exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.debitcard = @debitcard", {
        ['@debitcard'] = cardnumber
    },function(result)
		if result[1] ~= nil then
			return result[1].balance
		end
		return nil
	end)

end


RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	if amount == nil or amount <= 0 or amount > char.cash then
		TriggerClientEvent('DoShortHudText', src, "You Don't have that much Money",2)
		
	else
		user:removeMoney(amount)
		addAccountBalance(amount)
	--	Wait(500)
		TriggerClientEvent('DoShortHudText', src, "You Deposit $" .. amount .. "")
		TriggerClientEvent('depositDONE', src)
	end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = char.owner
    }, function(result)
		if amount == nil or amount <= 0 or amount > result[1].balance then
			TriggerClientEvent('DoShortHudText', src, "You Don't have that much Money in your Bank Account")
		else
			removeAccountBalance(src,char.owner, amount)
			user:addMoney(amount) 
		--	Wait(500)
			TriggerClientEvent('DoShortHudText', src, "You Withdraw $" .. amount .. "")
			TriggerClientEvent('withdrawDONE', src)
		end
	end)
end)

RegisterServerEvent('bank:withdrawatm')
AddEventHandler('bank:withdrawatm', function(amount)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local base = 0

	base = getAccountBalance(char.owner)

	if amount == nil or amount <= 0 or amount > base then
		TriggerClientEvent('DoShortHudText', src, "You Don't have that much Money in your Bank Account")
	else
		removeAccountBalance(char.owner, amount)
		user:addMoney(amount)
	--	Wait(500)
		TriggerClientEvent('DoShortHudText', src, "You Withdraw $" .. amount .. "")
		TriggerClientEvent('withdrawDONE', src)
	end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(to, amountt)
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local amount = tonumber(amountt)
	exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.identifier = @identifier", {
        ['@identifier'] = char.owner
    }, function(mybalances)
		mybalance = mybalances[1].balance	
			exports.ghmattimysql:execute("SELECT * FROM ethical_banking WHERE accountNumber = @accountNumber", {
				['@accountNumber'] = tonumber(to)
			}, function(result)
				hisbalance = result[1].balance
					if result ~= nil then
					--	Wait(300)
						if to == result[1].accountNumber then
							TriggerClientEvent('DoShortHudText', src, "You cannot transfer money to yourself",2)
						else
							if tonumber(mybalance) <= 0 or tonumber(mybalance) < tonumber(amountt) or tonumber(amountt) <= 0 then
								TriggerClientEvent('DoShortHudText', src, "You Don't have that much Money",2)
							else
								removeAccountBalance(src,char.owner, amount)
								addAccountBalanceSomeone(to, amount, hisbalance)
							--	Wait(300)
								TriggerClientEvent('DoShortHudText', src, "You Transfer $" .. amount .. "")
								TriggerClientEvent('transferDONE', src)
							end
						end
					else
						TriggerClientEvent('DoShortHudText', src, "This account number is not existing.",2)
					end
			end)
	end)
end)

function isAccMine(identifier)
	local result = exports.ghmattimysql:execute("SELECT accountNumber FROM ethical_banking WHERE identifier = @identifier",{
		["@identifier"] = identifier
	})
    if result[1] ~= nil then
        return result[1].accountNumber
    end
    return nil
end

function ifAccounttExists(accountNumber)
	local result = exports.ghmattimysql:execute("SELECT * FROM ethical_banking WHERE accountNumber = @accountNumber",
	{
		["@accountNumber"] = tostring(accountNumber)
	})
    if result[1] ~= nil then
        return true
    end
    return false
end

function getAccountBalanceFromNumber(accNummmmmerm)
    exports.ghmattimysql:execute("SELECT ethical_banking.balance FROM ethical_banking WHERE ethical_banking.accountNumber = @accountNumber", {
        ['@accountNumber'] = accNummmmmerm
    },function(result)
		if result[1] ~= nil then
			return result[1].balance
		end
		return nil
	end)

end

function addAccountBalanceSomeone(accNummmmmerm, money, zbalance)
	exports.ghmattimysql:execute("UPDATE ethical_banking SET balance = @balance WHERE accountNumber = @accountNumber", {
		['@accountNumber'] = accNummmmmerm,
		['@balance'] = zbalance + money
	})
end

RegisterCommand('cash', function(source, args)
    local user = exports["ethical-base"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()
    local cash = char.cash
    TriggerClientEvent('banking:updateCash', source, cash, true)
end)



