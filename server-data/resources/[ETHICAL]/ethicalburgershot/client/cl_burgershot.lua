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

function showInteraction(text , type)
    SendNUIMessage({
        type = "open",
        text = text,
        color = type,
    })
end

function hideInteraction()
    SendNUIMessage({
        type = "close",
    })
end

part1 = false
part2 = false
part3 = false
part4 = false
part5 = false
Temperature = 20
Temperature2 = 20

RegisterNetEvent('ethicalburgershot:dutymenu')
AddEventHandler('ethicalburgershot:dutymenu', function()
        exports['menu']:SetTitle("Don't do murder... make a burger!")
        exports['menu']:AddButton("Clock On" , "Come flip some burgers yo!" ,'ethicalburgershot:duty' , false)
        exports['menu']:AddButton("Clock Off" , "Go home and go to bed!" ,'ethicalburgershot:duty' , true)
end)

RegisterNetEvent('ethicalburgershot:ordermenu')
AddEventHandler('ethicalburgershot:ordermenu', function()
        exports['menu']:SetTitle("Order Menu")
        exports['menu']:AddButton("Order Items" , "Order some new ingredients!" ,'ethicalburgershot:order' , false)
        exports['menu']:AddButton("Open Fridge" , "See what goodies you have!" ,'open:burgerstorage' , true)
end)

RegisterNetEvent('ethicalburgershot:cookmenu')
AddEventHandler('ethicalburgershot:cookmenu', function()
        exports['menu']:SetTitle("Cook Menu")
        exports['menu']:AddButton("Cook Burger" , "Cook some meat!" ,'ethical-ethicalburgershot:startprocess3' , false)
end)

RegisterNetEvent('ethicalburgershot:duty')
AddEventHandler('ethicalburgershot:duty', function(a)
    local job = exports["isPed"]:isPed("myjob")
	if job == 'OffBurgerShot' or job == 'BurgerShot' then
    if(a == "true") then
            TriggerEvent("ethical-jobmanager:playerBecameJob", "OffBurgerShot", "OffBurgerShot", true)	

    elseif(a == "false") then
            TriggerEvent("ethical-jobmanager:playerBecameJob", "BurgerShot", "BurgerShot", false)
        end
    end
end)

RegisterNetEvent('ethicalburgershot:shelf')
AddEventHandler('ethicalburgershot:shelf', function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
	    TriggerEvent("ethical-ac:triggeredItemSpawn", "1", "ethical-jobmanager_shelf")
    end
end)

RegisterNetEvent('ethicalburgershot:drinks')
AddEventHandler('ethicalburgershot:drinks', function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
        FreezeEntityPosition(PlayerPedId(), true)
        exports["ethical-taskbar"]:taskBar(10000,"Preparing Drinks")
        FreezeEntityPosition(PlayerPedId(), false)
	    TriggerEvent("ethical-ac:triggeredItemSpawn", "1234", "Craft")
    end
end)

RegisterNetEvent('ethicalburgershot:food')
AddEventHandler('ethicalburgershot:food', function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
        ExecuteCommand('e handshake')
        FreezeEntityPosition(PlayerPedId(), true)
        exports["ethical-taskbar"]:taskBar(10000,"Preparing Food")
        FreezeEntityPosition(PlayerPedId(), false)
	    TriggerEvent("ethical-ac:triggeredItemSpawn", "31", "Craft")
    end
end)

RegisterNetEvent('ethicalburgershot:storage')
AddEventHandler('ethicalburgershot:storage', function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
	    TriggerEvent("ethical-ac:triggeredItemSpawn", "1", "Stolen-Goods")
    end
end)

RegisterNetEvent('ethicalburgershot:fries')
AddEventHandler('ethicalburgershot:fries', function()
    local job = exports['isPed']:isPed('job')
    if job == 'BurgerShot' then
        FreezeEntityPosition(PlayerPedId(), true)
        exports["ethical-taskbar"]:taskBar(8000,"Frying The Fries")
        FreezeEntityPosition(PlayerPedId(), false)
        if exports['ethical-inventory']:hasEnoughOfItem('potato', 1) then
            TriggerEvent('inventory:removeItem', 'potato', 1)
	        TriggerEvent('ethical-banned:getID', 'fries', 1)
        end
    end
end)

RegisterNetEvent("ethical-ethicalburgershot:startprocess3")
AddEventHandler("ethical-ethicalburgershot:startprocess3", function()
    local job = exports["isPed"]:isPed("myjob")
	if job == 'BurgerShot' then   
        if exports["ethical-inventory"]:hasEnoughOfItem("rawpatty", 1) then 
            local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['ethical-taskbar']:taskBar(25000, 'Cooking the Patty')
            if (finished == 100) then
                TriggerEvent("inventory:removeItem", "rawpatty", 1)
                TriggerEvent('player:receiveItem', 'patty', 2)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You need some Raw Patty to Make some Cooked Pattys! (Required Amount: 2)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a ethicalburgershot worker!', 2)
    end
end)

RegisterNetEvent("ethical-ethicalburgershot:startfryer")
AddEventHandler("ethical-ethicalburgershot:startfryer", function()
    local job = exports["isPed"]:isPed("myjob")
	if job == 'BurgerShot' then
        if exports["ethical-inventory"]:hasEnoughOfItem("potato", 1) then
            local dict = 'missfinale_c2ig_11'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "pushcar_offcliff_f", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['ethical-taskbar']:taskBar(20000, 'Dropping Fries')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'fries', 2)
                TriggerEvent("inventory:removeItem", "potato", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You Havent Got Any Cut Potatoes! (Required Amount: 2)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a ethicalburgershot worker!', 2)
    end
end)

RegisterNetEvent("ethical-ethicalburgershot:makeshake")
AddEventHandler("ethical-ethicalburgershot:makeshake", function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
        if exports["ethical-inventory"]:hasEnoughOfItem("milkshakeformula", 1) then
            local dict = 'mp_ped_interaction'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "handshake_guy_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['ethical-taskbar']:taskBar(10000, 'Making Milk Shake')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'mshake', 2)
                TriggerEvent("inventory:removeItem", "milkshakeformula", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You Havent got any Milk Shake Formula! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a ethicalburgershot worker!', 2)
    end
end)

RegisterNetEvent("ethical-ethicalburgershot:getcola")
AddEventHandler("ethical-ethicalburgershot:getcola", function()
    local rank = exports["isPed"]:GroupRank("BurgerShot")
    if rank > 0 then
        if exports["ethical-inventory"]:hasEnoughOfItem("hfcs", 1) then   
            local dict = 'mp_ped_interaction'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "handshake_guy_a", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
            local finished = exports['ethical-taskbar']:taskBar(5000, 'Getting Coke')
            if (finished == 100) then
                TriggerEvent('player:receiveItem', 'softdrink', 2)
                TriggerEvent("inventory:removeItem", "hfcs", 1)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
            end
        else
            TriggerEvent('DoLongHudText', 'You do not have enough Syrup! (Required Amount: 1)', 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You are not a ethicalburgershot worker!', 2)
    end
end)

RegisterNetEvent("ethicalburgershot:bill")
AddEventHandler("ethicalburgershot:bill", function()
    local bill = exports["ethical-applications"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill then
        TriggerServerEvent("ethicalburgershot:bill:player", bill[1].input, bill[2].input)
    end
end)

RegisterCommand('bill', function(source)
	local job = exports["isPed"]:isPed("myjob")
	if job == 'BurgerShot' then
		TriggerEvent('ethicalburgershot:bill')
	end
end)


function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
end

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
