local koil = vehicleBaseRepairCost

RegisterServerEvent('ethical-bennys:attemptPurchase')
AddEventHandler('ethical-bennys:attemptPurchase', function(cheap, type, upgradeLevel)
	local src = source
	local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
    if type == "repair" then
        if user:getCash() >= koil then
            user:removeMoney(koil)
            TriggerClientEvent('ethical-bennys:purchaseSuccessful', source)
        else
            TriggerClientEvent('ethical-bennys:purchaseFailed', source)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('ethical-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('ethical-bennys:purchaseFailed', source)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('ethical-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('ethical-bennys:purchaseFailed', source)
        end
    end
end)

RegisterServerEvent('ethical-bennys:updateRepairCost')
AddEventHandler('ethical-bennys:updateRepairCost', function(cost)
    koil = cost
end)