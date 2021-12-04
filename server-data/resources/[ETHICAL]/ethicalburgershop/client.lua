--------------------------------------------------------------------------------------------------
--																				          	    --
--       ______ _______ _    _ _____ _____          _        _____  ________       _______      --
--      |  ____|__   __| |  | |_   _/ ____|   /\   | |      |  __ \|  ____\ \    / / ____|      --
--      | |__     | |  | |__| | | || |       /  \  | |      | |  | | |__   \ \  / / (___        --
--      |  __|    | |  |  __  | | || |      / /\ \ | |      | |  | |  __|   \ \/ / \___ \       --
--      | |____   | |  | |  | |_| || |____ / ____ \| |____  | |__| | |____   \  /  ____) |      --
--      |______|  |_|  |_|  |_|_____\_____/_/    \_\______| |_____/|______|   \/  |_____/       --
-- 																					            --
--                           joshua#5319 glacielgaming#6969 Woodz#1668                          --
--------------------------------------------------------------------------------------------------

------------------------
------ Burgershot ------
------------------------

RegisterNetEvent("open:burgerstorage")
AddEventHandler("open:burgerstorage", function(shop)
	local job = exports["isPed"]:isPed("myJob")
	if job == "BurgerShot" then
		TriggerEvent("server-inventory-open", "1", job);
		Wait(1000)
	else
		TriggerEvent("DoLongHudText", "You dont have access to this", 2)
	end
end)

RegisterNetEvent('ethicalburgershot:updatecraft')
AddEventHandler('ethicalburgershot:updatecraft', function()
	TriggerEvent("server-inventory-open", "8967", "Craft");	
	Wait(1000)
end)

RegisterNetEvent('ethicalburgershot:updatecraftdrink')
AddEventHandler('ethicalburgershot:updatecraftdrink', function()
	TriggerEvent("server-inventory-open", "950", "Craft");	
	Wait(1000)
end)


RegisterNetEvent('ethicalburgershot:order')
AddEventHandler('ethicalburgershot:order', function()
	TriggerEvent("server-inventory-open", "6564", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('ethicalburgershot:pickup')
AddEventHandler('ethicalburgershot:pickup', function()
	TriggerEvent("server-inventory-open", "1", "ethicalburgershot_pickup");	
	Wait(1000)
end)
RegisterNetEvent('ethicalburgershot:pickup2')
AddEventHandler('ethicalburgershot:pickup2', function()
	TriggerEvent("server-inventory-open", "1", "ethicalburgershot_pickup2");	
	Wait(1000)
end)
RegisterNetEvent('ethicalburgershot:pickup3')
AddEventHandler('ethicalburgershot:pickup3', function()
	TriggerEvent("server-inventory-open", "1", "ethicalburgershot_pickup3");	
	Wait(1000)
end)

--------------------------------------------------------------------------------------------------
--																				          	    --
--       ______ _______ _    _ _____ _____          _        _____  ________       _______      --
--      |  ____|__   __| |  | |_   _/ ____|   /\   | |      |  __ \|  ____\ \    / / ____|      --
--      | |__     | |  | |__| | | || |       /  \  | |      | |  | | |__   \ \  / / (___        --
--      |  __|    | |  |  __  | | || |      / /\ \ | |      | |  | |  __|   \ \/ / \___ \       --
--      | |____   | |  | |  | |_| || |____ / ____ \| |____  | |__| | |____   \  /  ____) |      --
--      |______|  |_|  |_|  |_|_____\_____/_/    \_\______| |_____/|______|   \/  |_____/       --
-- 																					            --
--                           joshua#5319 glacielgaming#6969 Woodz#1668                          --
--------------------------------------------------------------------------------------------------
