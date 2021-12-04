ETHICAL.Events = ETHICAL.Events or {}
ETHICAL.Events.Total = 0
ETHICAL.Events.Active = {}

function ETHICAL.Events.Trigger(self, event, args, callback)
    local id = ETHICAL.Events.Total + 1
    ETHICAL.Events.Total = id

    id = event .. ":" .. id

    if ETHICAL.Events.Active[id] then return end

    ETHICAL.Events.Active[id] = {cb = callback}
    
    TriggerServerEvent("ethical-events:listenEvent", id, event, args)
end

RegisterNetEvent("ethical-events:listenEvent")
AddEventHandler("ethical-events:listenEvent", function(id, data)
    local ev = ETHICAL.Events.Active[id]
    
    if ev then
        ev.cb(data)
        ETHICAL.Events.Active[id] = nil
    end
end)

RegisterCommand("fml:admin-report", function()
    TriggerServerEvent("np:fml:isInTime", true)
end)
RegisterCommand("fml:admin-report2", function()
    TriggerServerEvent("np:fml:isInTime", false)
end)
