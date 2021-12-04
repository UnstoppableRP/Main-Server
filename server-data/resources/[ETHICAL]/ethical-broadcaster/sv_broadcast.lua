local totalBroadcasts = {}

RegisterServerEvent('attemptBroadcast')
AddEventHandler('attemptBroadcast', function()
    local receivedData = {}
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
    local jobs = exports["ethical-base"]:getModule("JobManager")
    local jobs = exports["ethical-base"]:getModule("JobManager"):CountJob("broadcaster")
    if activeBroadcast >= 5 then TriggerClientEvent("DoLongHudText",src, "There is already too many broadcasters here",2) end
    jobs:SetJob(user, "broadcaster", false, function()
        TriggerClientEvent("broadcast:becomejob",src)
        totalBroadcasts[totalBroadcasts + 1] = receivedData -- we've to pass broadcast to server, so we'll create presets 
    end)
end)
