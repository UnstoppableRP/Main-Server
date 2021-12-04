inMenu  = true


local player = exports["ethical-base"]:getModule("Player")


RegisterNetEvent('police:carmenu')
AddEventHandler('police:carmenu', function()

    exports['menu']:SetTitle("Police Garage")

    exports['menu']:AddButton("2011 Crown Victoria" , "Vroom Vroom!" ,'police:car1' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("2015 Dodge Charger" , "Vrooooom Vroooooom!" ,'police:car3' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("2016 Ford Police Interceptor" , "Vroom Vroom!" ,'police:car2' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("2016 Ford Police Interceptor Stealth" , "Vroom Vroom!" ,'police:car7' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("2016 Ford Police Interceptor K-9" , "Vroom Vroom!" ,'police:car4' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("2013 Chevy Tahoe" , "Vroom Vroom!" ,'police:car5' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("S.W.A.T Bear Cat" , "The Driver Is Not Dying!" ,'police:car6' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("Prison Bus" , "The Driver Is Dying!" ,'police:car8' ,'Lets duty now' , 'menuone')
    exports['menu']:SubMenu("Police Garage Menu" , "Get ready to go active duty" , "menuone")
end)


RegisterNetEvent('police:airmenu')
AddEventHandler('police:airmenu', function()
    exports['menu']:SetTitle("Police Air Garage")
    exports['menu']:AddButton("Police Helicopter" , "Woosh wooosh!" ,'police:heli1' ,'Lets duty now' , 'menuone')
    exports['menu']:SubMenu("Police Air Garage Menu" , "Get ready to go active duty" , "menuone")
end)


function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end




function DrawText2(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.40, 0.10)
end







    RegisterNetEvent("police:return")
    AddEventHandler("police:return" , function()
        deleteVeh(targetVehicle)

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local myJob = exports["isPed"]:isPed("myJob")
        if (GetDistanceBetweenCoords(pos, 463.72 , -1019.55 , 28.1, true) < 3) and isCop then
            DrawText3D(463.72 , -1019.55 , 28.1 + 0.2, "~b~[E]~o~Menu")
            if IsControlJustReleased(1, 38) then        
               
               inMenu = true
               SetNuiFocus(true, true)
               SendNUIMessage({type = 'carmenuopen'})

            end
        end

	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(pos, 463.89 , -1014.66 , 28.07, true) < 2) and job and jobname == "police" then
			DrawText3D(463.89 , -1014.66 , 28.07 + 0.2, "~b~[E]~o~Return Car")
            if IsControlJustReleased(1, 38) then        
               
			   local ped = GetPlayerPed( -1 )

			   if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
				   local pos = GetEntityCoords( ped )
		   
				   if ( IsPedSittingInAnyVehicle( ped ) ) then 
					   local vehicle = GetVehiclePedIsIn( ped, false )
		   
					   if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
						   DeleteGivenVehicle( vehicle, numRetries )
					   else 
						   
					   end 
				   else
					   local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
					   local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )
		   
					   if ( DoesEntityExist( vehicle ) ) then 
						   DeleteGivenVehicle( vehicle, numRetries )
					   else 
						
					   end 
				   end 
			   end 
			end
		end
	end
end)


function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
		

        
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            
            if ( not DoesEntityExist( veh ) ) then 
				
            end 

            
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
            
            end 
        end 
    else 
		
    end 
end 

function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end















RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
end)

RegisterNetEvent('focusoff')
AddEventHandler('focusoff', function()
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)



 

 





  


 



RegisterNetEvent("police:heli1")
AddEventHandler("police:heli1", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "polmav"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 449.41, -981.17, 43.69, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "polmav"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)

RegisterNetEvent("police:car1")
AddEventHandler("police:car1", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "umcvpi"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "umcvpi"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)

RegisterNetEvent("police:car2")
AddEventHandler("police:car2", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "16fpiu"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "16fpiu"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)


RegisterNetEvent("police:car3")
AddEventHandler("police:car3", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "15chgr"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "15chgr"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)



RegisterNetEvent("police:car4")
AddEventHandler("police:car4", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "k9fpiu"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "k9fpiu"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)


RegisterNetEvent("police:car5")
AddEventHandler("police:car5", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "13tahoe"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "13tahoe"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)



RegisterNetEvent("police:car6")
AddEventHandler("police:car6", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "riot"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "riot"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)




RegisterNetEvent("police:car7")
AddEventHandler("police:car7", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "umfpiu"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "umfpiu"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)

    


end)




RegisterNetEvent("police:car8")
AddEventHandler("police:car8", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "pbus2"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 1000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end
        lastcar = CreateVehicle(vehiclehash, 446.75, -985.99, 25.7, GetEntityHeading(PlayerPedId())+87, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "pbus2"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
    end)
end)



























