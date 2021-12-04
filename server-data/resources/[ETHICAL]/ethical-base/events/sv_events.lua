ETHICAL.Events = ETHICAL.Events or {}
ETHICAL.Events.Registered = ETHICAL.Events.Registered or {}

RegisterServerEvent("ethical-events:listenEvent")
AddEventHandler("ethical-events:listenEvent", function(id, name, args)
    local src = source

    if not ETHICAL.Events.Registered[name] then return end

    ETHICAL.Events.Registered[name].f(ETHICAL.Events.Registered[name].mod, args, src, function(data)
        TriggerClientEvent("ethical-events:listenEvent", src, id, data)
    end)
end)

function ETHICAL.Events.AddEvent(self, module, func, name)
    ETHICAL.Events.Registered[name] = {
        mod = module,
        f = func
    }
end