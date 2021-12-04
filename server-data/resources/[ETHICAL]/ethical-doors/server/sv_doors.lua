local steamIds = {
    ["steam:11000010aa15521"] = true --kevin
}



RegisterServerEvent('ethical-doors:alterlockstate2')
AddEventHandler('ethical-doors:alterlockstate2', function()
    --URP.DoorCoords[10]["lock"] = 0

    TriggerClientEvent('ethical-doors:alterlockstateclient', source, URP.DoorCoords)

end)

RegisterServerEvent('ethical-doors:alterlockstate')
AddEventHandler('ethical-doors:alterlockstate', function(alterNum)
    print('lockstate:', alterNum)
    URP.alterState(alterNum)
end)

RegisterServerEvent('ethical-doors:ForceLockState')
AddEventHandler('ethical-doors:ForceLockState', function(alterNum, state)
    URP.DoorCoords[alterNum]["lock"] = state
    TriggerClientEvent('URP:Door:alterState', -1,alterNum,state)
end)

function isDoorLocked(door)
    if URP.DoorCoords[door].lock == 1 then
        return true
    else
        return false
    end
end