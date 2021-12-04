

RegisterServerEvent('ethicalburgershot:bill:player')
AddEventHandler("ethicalburgershot:bill:player", function(TargetID, amount)
	local src = source
	local target = tonumber(TargetID)
	local fine = tonumber(amount)
	local user = exports["ethical-base"]:getModule("Player"):GetUser(target)
	local characterId = user:getCurrentCharacter().id
	if user ~= false then
			TriggerEvent("cash:remove", target, fine)
			TriggerClientEvent('DoLongHudText', target, "You have been billed $"..fine, 1)
			TriggerClientEvent('DoLongHudText', src, "You have successfully wrote a bill for $"..fine, 1)
			TriggerEvent("bank:addlog", characterId, fine, "Fine", false)
	end
end)

