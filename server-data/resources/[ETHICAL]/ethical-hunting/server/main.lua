RegisterServerEvent('lrp:huntingreturnree')
AddEventHandler('lrp:huntingreturnree', function()
    local user = exports["ethical-base"]:getModule("Player"):GetUser(source)
    local money = tonumber(user:getCash())
    user:addMoney(100)
end)

RegisterServerEvent('ethical-hunting:sell')
AddEventHandler('ethical-hunting:sell', function()
local source = source
local player = exports['ethical-base']:GetCurrentCharacterInfo(source)
local randompayout = math.random(85, 110)
    TriggerClientEvent("payslip:call", source, player.id, randompayout)
end)


RegisterServerEvent('ethical-hunting:starthoe')
AddEventHandler('ethical-hunting:starthoe', function()
    local user = exports["ethical-base"]:getModule("Player"):GetUser(source)
    local money = tonumber(user:getCash())
    if money >= 100 then
        user:removeMoney(100)
        TriggerClientEvent('ethical-hunting:start2', source)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money on you!', 2)
    end
end)

RegisterServerEvent('ethical-hunting:giveloadout')
AddEventHandler('ethical-hunting:giveloadout', function()
    TriggerClientEvent('player:receiveItem', source, '100416529', 1)
    TriggerClientEvent('player:receiveItem', source, '2578778090', 1)
end)

RegisterServerEvent('ethical-hunting:removeloadout')
AddEventHandler('ethical-hunting:removeloadout', function()
    TriggerClientEvent('inventory:removeItem', source, '100416529', 1)
    TriggerClientEvent('inventory:removeItem', source, '2578778090', 1)
end)