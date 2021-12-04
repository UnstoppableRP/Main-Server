ETHICAL.SpawnManager = {}

RegisterServerEvent('ethical-base:spawnInitialized')
AddEventHandler('ethical-base:spawnInitialized', function()
    local src = source
    TriggerClientEvent('ethical-base:spawnInitialized', src)
end)