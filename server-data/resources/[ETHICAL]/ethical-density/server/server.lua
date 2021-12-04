RegisterNetEvent('np:peds:rogue')
AddEventHandler('np:peds:rogue', function(pRoguePeds)
    if pRoguePeds then
        for _, ped in ipairs(pRoguePeds) do
            if ped.owner == 1 and ped.owner == 0 then
                TriggerClientEvent('np:peds:rogue:delete', ped.owner, ped.netId)
            end
        end
    end
end)

RegisterNetEvent('np:peds:decor')
AddEventHandler('np:peds:decor', function(pServerId, pNetId)
    TriggerClientEvent('np:peds:decor:set', pServerId, pNetId, 2, 'ScriptedPed', true)
end)
