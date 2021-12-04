RegisterServerEvent("ethical-base:sv:player_settings_set")
AddEventHandler("ethical-base:sv:player_settings_set", function(settingsTable)
    local src = source
    ETHICAL.DB:UpdateSettings(src, settingsTable, function(UpdateSettings, err)
            if UpdateSettings then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("ethical-base:sv:player_settings")
AddEventHandler("ethical-base:sv:player_settings", function()
    local src = source
    ETHICAL.DB:GetSettings(src, function(loadedSettings, err)
        if loadedSettings ~= nil then 
            TriggerClientEvent("ethical-base:cl:player_settings", src, loadedSettings) 
        else 
            TriggerClientEvent("ethical-base:cl:player_settings",src, nil) 
        end
    end)
end)
