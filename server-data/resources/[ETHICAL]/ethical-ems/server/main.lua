RegisterServerEvent('ethical-ems:revive')
AddEventHandler('ethical-ems:revive', function(data, target)
	local src = source
	TriggerClientEvent('admin:revivePlayerClient', target)
end)

RegisterServerEvent('admin:revivePlayer')
AddEventHandler('admin:revivePlayer', function(target)
	if target ~= nil then
		TriggerClientEvent('admin:revivePlayerClient', target)
		TriggerClientEvent('ethical-hospital:client:RemoveBleed', target) 
        TriggerClientEvent('ethical-hospital:client:ResetLimbs', target)
	end
end)

RegisterServerEvent('ethical-ems:heal')
AddEventHandler('ethical-ems:heal', function(target)
	TriggerClientEvent('ethical-ems:heal', target)
	TriggerClientEvent('ethical-hospital:client:RemoveBleed', target) 	
end)

RegisterServerEvent('ethical-ems:heal2')
AddEventHandler('ethical-ems:heal2', function(target)
	TriggerClientEvent('ethical-ems:big', target)
	TriggerClientEvent('ethical-hospital:client:RemoveBleed', target) 	
end)