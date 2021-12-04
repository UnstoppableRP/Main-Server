local isFishing = false
local inZone = false
local cancel = false
local veh = 0
local canSpawn = true
local zones = {
    'OCEANA',
    'ELYSIAN',
    'CYPRE',
    'DELSOL',
    'LAGO',
    'ZANCUDO',
    'ALAMO',
    'NCHU',
    'CCREAK',
    'PALCOV',
    'PALETO',
    'PROCOB',
    'ELGORL',
    'SANCHIA',
    'PALHIGH',
    'DELBE',
    'PBLUFF',
    'SANDY',
    'GRAPES',
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = "[E] Rent A Boat"
		local x,y,z =  -3424.41, 982.81, 8.43
		local plyCoords = GetEntityCoords(Getmecuh)
        local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        local car = GetHashKey('marquis')
        if distance <= 5 and veh == 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                if canSpawn == true then
                    TriggerServerEvent('fish:checkAndTakeDepo')
                    Citizen.Wait(500)
                        canSpawn = false
                        RequestModel(car)
                        while not HasModelLoaded(car) do
                            Citizen.Wait(0)
                        end
                        veh = CreateVehicle(car, -3448.48, 971.98, 1.91, 0.0, true, false)
                        SetEntityAsMissionEntity(veh, true, true)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        TriggerEvent("keys:addNew", veh, GetVehicleNumberPlateText(veh))
                    elseif Player.cash < 500 then
                        TriggerEvent('DoLongHudText', 'You cant afford the Deposit!', 2)
                    end
                else
                    TriggerEvent('DoLongHudText', 'Vehicle is already out!', 2)
                end
            --end
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = '[E] Return the Boat (Reward $500)'
		local x,y,z =  -3424.41, 982.81, 8.43
		local plyCoords = GetEntityCoords(Getmecuh)
		local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        if distance <= 20 and veh ~= 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                DeleteVehicle(veh)
                veh = 0
                TriggerEvent('DoLongHudText', 'Vehicle Returned and your Deposit was Refunded!', 1)
                TriggerServerEvent('fish:returnDepo')
                SetEntityCoords(GetPlayerPed(-1), -3424.41, 982.81, 8.43)
                Citizen.Wait(2000)
                canSpawn = true
            end 
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
				
			end
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = "[E] Rent A Boat"
		local x,y,z =  1308.91, 4362.29, 41.55
		local plyCoords = GetEntityCoords(Getmecuh)
        local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        local car = GetHashKey('suntrap')
        if distance <= 5 and veh == 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                if canSpawn == true then
                    TriggerServerEvent('fish:checkAndTakeDepo')
                    Citizen.Wait(500)
                        canSpawn = false
                        RequestModel(car)
                        while not HasModelLoaded(car) do
                            Citizen.Wait(0)
                        end
                        veh = CreateVehicle(car, 1299.69, 4194.82, 30.91, 0.0, true, false)
                        SetEntityAsMissionEntity(veh, true, true)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        TriggerEvent("keys:addNew", veh, GetVehicleNumberPlateText(veh))
                    elseif Player.cash < 500 then
                        TriggerEvent('DoLongHudText', 'You cant afford the Deposit!', 2)
                    end
                else
                    TriggerEvent('DoLongHudText', 'Vehicle is already out!', 2)
                end
            --end
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
			end
		end
	end
end) -- Done



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = '[E] Return the Boat (Reward $500)'
		local x,y,z =  1302.839, 4225.832, 33.9087
		local plyCoords = GetEntityCoords(Getmecuh)
		local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        if distance <= 20 and veh ~= 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                DeleteVehicle(veh)
                veh = 0
                TriggerEvent('DoLongHudText', 'Vehicle Returned and your Deposit was Refunded!', 1)
                TriggerServerEvent('fish:returnDepo')
                SetEntityCoords(GetPlayerPed(-1), 1302.839, 4225.832, 33.9087)
                Citizen.Wait(2000)
                canSpawn = true
            end
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
				
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = "[E] Rent A Boat"
		local x,y,z =  3807.98, 4478.62, 6.37
		local plyCoords = GetEntityCoords(Getmecuh)
        local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        local car = GetHashKey('tropic')
        if distance <= 5 and veh == 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                if canSpawn == true then
                    TriggerServerEvent('fish:checkAndTakeDepo')
                    Citizen.Wait(500)
                        canSpawn = false
                        RequestModel(car)
                        while not HasModelLoaded(car) do
                            Citizen.Wait(0)
                        end
                        veh = CreateVehicle(car, 3865.89, 4476.66, 1.53, 0.0, true, false)
                        SetEntityAsMissionEntity(veh, true, true)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        TriggerEvent("keys:addNew", veh, GetVehicleNumberPlateText(veh))
                    elseif Player.cash < 500 then
                        TriggerEvent('DoLongHudText', 'You cant afford the Deposit!', 2)
                    end
                else
                    TriggerEvent('DoLongHudText', 'Vehicle is already out!', 2)
                end
            --end
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
			end
		end
	end
end) -- Done



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local Getmecuh = PlayerPedId()
		local drawtext2 = "[E] Return the Boat (Reward $500)"
		local x,y,z = 3865.944, 4463.568, 2.73844
		local plyCoords = GetEntityCoords(Getmecuh)
		local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,x,y,z ,false)
        if distance <= 20 and veh ~= 0 then
			DrawText3Ds(x,y,z, drawtext2) 
            if IsControlJustReleased(0, 38) then
                DeleteVehicle(veh)
                veh = 0
                TriggerEvent('DoLongHudText', 'Vehicle Returned and your Deposit was Refunded!', 1)
                TriggerServerEvent('fish:returnDepo')
                SetEntityCoords(GetPlayerPed(-1), 3865.944, 4463.568, 2.73844)
                Citizen.Wait(2000)
                canSpawn = true
            end
		else
			if distance >= 1.2 then
				Citizen.Wait(1000)
				
			end
		end
	end
end)


RegisterNetEvent('ethical-fish:lego')
AddEventHandler('ethical-fish:lego', function()
    if isFishing == false then
        StartFish()
    elseif isFishing == true then
        TriggerEvent('DoLongHudText', 'You are already fishing dingus.', 2)
    end
end)

-- RegisterCommand("test", function()
--     TriggerEvent('ethical-fish:lego')

-- end)

function checkZone()
    local ply = PlayerPedId()
    local coords = GetEntityCoords(ply)
    local currZone = GetNameOfZone(coords)
    for k,v in pairs(zones) do
        if currZone == v then
            inZone = true
            break
        else
            inZone = false
        end
    end
    
end

function StartFish()
    local ply = PlayerPedId()
    local onBoat = false
    local function GetEntityBelow()
        local Ent = nil
        local CoA = GetEntityCoords(ply, 1)
        local CoB = GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.0, 5.0)
        local RayHandle = CastRayPointToPoint(CoA.x, CoA.y, CoA.z, CoB.x, CoB.y, CoB.z, 10, ply, 0)
        local A,B,C,D,Ent = GetRaycastResult(RayHandle)
        return Ent
    end
    local boat = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.000, 0, 12294)
    checkZone()
    Citizen.Wait(250)
    if IsEntityInWater(boat) and IsPedSwimming(ply) == false and inZone == true then
        if exports["ethical-inventory"]:hasEnoughOfItem('fishingrod',1,false) then
            isFishing = true
            cancel = false
            Fish()
        end
    elseif IsEntityInWater(ply) and IsPedSwimming(ply) == false and inZone == true then 
        if exports["ethical-inventory"]:hasEnoughOfItem('fishingrod',1,false) then
            isFishing = true
            cancel = false
            Fish()
        end
    else
        TriggerEvent('DoLongHudText', 'You cant fish here.', 2)
    end
end  


function Fish()
    if cancel == false then
        local ply = PlayerPedId()
       --playerAnim() 
        TaskStartScenarioInPlace(ply, 'WORLD_HUMAN_STAND_FISHING', 0, true)
        timer = math.random(5000,10000)
        Citizen.Wait(timer)
        Catch()
    end
end

function Repeat()
    timer = math.random(5000,10000)
    if cancel == false then
        Citizen.Wait(timer)
        Catch()
    end
end

function Catch()
    if cancel == false then
        local ply = PlayerPedId()
        TriggerEvent('DoLongHudText', 'There is a fish on the line.', 1)
        Citizen.Wait(1000)
        local finished = exports["ethical-taskbarskill"]:taskBar(math.random(1000,2000),math.random(15,20))
        if finished == 100 then
            local finished2 = exports["ethical-taskbarskill"]:taskBar(math.random(1000,2000),math.random(1,3))
            if finished2 == 100 then
                isFishing = false
                local rdn = math.random(1,100)
                if rdn <= 10 then
                    Citizen.Wait(2000)
                    SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                    ClearPedTasksImmediately(ply)
                    Repeat()
                elseif rdn > 11 then
                    TriggerEvent( "player:receiveItem","fishingmackerel",2)
                    TriggerEvent('DoLongHudText', 'You caught a Fish!', 1)
                    TriggerServerEvent('ethical-fish:getFish')
                    SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                    ClearPedTasksImmediately(ply)
                end
            elseif finished ~= 100 then
                TriggerEvent('DoLongHudText', 'The fish got away.', 2)
                Repeat()
            else
                TriggerEvent( "player:receiveItem","fishingmackerel",1)
                SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                ClearPedTasksImmediately(ply)
                isFishing = false
            end
        else
            SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
            ClearPedTasksImmediately(ply)
            isFishing = false
        end
    end
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- RegisterCommand("ooo", function()
--     SellItems()

-- end)
function SellItems()
    if exports["ethical-inventory"]:hasEnoughOfItem("fishingmackerel",5,false) then 
        TriggerEvent("inventory:removeItem", "fishingmackerel", 5)
        TriggerServerEvent('getmoney:fish')
    elseif exports["ethical-inventory"]:hasEnoughOfItem("fish",5,false) then 
        TriggerEvent("inventory:removeItem", "fish", 5)
        TriggerServerEvent('getmoney:fishok')

    else
        TriggerEvent('DoLongHudText', 'You dont have enough fish in your pockets to sell!', 2)
    end
end

local blips = {
    {title="Boat Rental", colour=4, id=427, scale=0.7, x = -3424.41, y = 982.81, z = 8.43},
    {title="Boat Rental", colour=4, id=427, scale=0.7, x = 1308.91, y = 4362.29, z = 41.55},
    {title="Boat Rental", colour=4, id=427, scale=0.7, x = 3807.98, y = 4478.62, z = 6.37},
 }
     
Citizen.CreateThread(function()
   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, info.scale)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)


function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent('ethical-fishing:skin')
AddEventHandler('ethical-fishing:skin', function()
    if exports["ethical-inventory"]:hasEnoughOfItem("fish", 1) and exports["ethical-inventory"]:hasEnoughOfItem("2578778090", 1) then 
        local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
	    LoadDict(dict)
	    FreezeEntityPosition(GetPlayerPed(-1),true)
	    TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
	    local PedCoords = GetEntityCoords(GetPlayerPed(-1))
	    prop = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
	    AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
	    SetEntityHeading(GetPlayerPed(-1), 263.72814941406)
        local finished = exports['ethical-taskbar']:taskBar(10000, 'Skinning Fish')
        if (finished == 100) then
            TriggerEvent("inventory:removeItem", "fish", 1)
            TriggerEvent('player:receiveItem', 'deskinedfish', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            DeleteEntity(prop)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
        end
    end
end)


RegisterNetEvent('ethical-fishing:sell')
AddEventHandler('ethical-fishing:sell', function()
local finished = exports["ethical-taskbar"]:taskBar(8000,"Selling Fish",true,false,playerVeh)
    if finished == 100 then
        SellItems()
	end
end)