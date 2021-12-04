ETHICAL.Core.hasLoaded = false


function ETHICAL.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("ethical-base:playerSessionStarted")
                TriggerServerEvent("ethical-base:playerSessionStarted")
                break
            end
        end
    end)
end
ETHICAL.Core:Initialize()

AddEventHandler("ethical-base:playerSessionStarted", function()
    while not ETHICAL.Core.hasLoaded do
        --print("waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    ETHICAL.SpawnManager:Initialize()
end)

RegisterNetEvent("ethical-base:waitForExports")
AddEventHandler("ethical-base:waitForExports", function()
    if not ETHICAL.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["ethical-base"] then
            TriggerEvent("ethical-base:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    print("player has spawned ")
    if not ETHICAL.Core.hasLoaded then
         ETHICAL.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)