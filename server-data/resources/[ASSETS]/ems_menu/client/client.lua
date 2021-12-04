

inMenu			= true

local player = exports["ethical-base"]:getModule("Player")

RegisterNetEvent('ems:carmenu')
AddEventHandler('ems:carmenu', function()

    exports['menu']:SetTitle("EMS Garage")

    exports['menu']:AddButton("EMS Vehicle" , "Hurry! Go save lives!" ,'ems:car1' ,'Lets duty now' , 'menuone')
    exports['menu']:SubMenu("EMS Garage Menu" , "Get ready to go active duty" , "menuone")
end)

RegisterNetEvent('ems:airmenu')
AddEventHandler('ems:airmenu', function()

    exports['menu']:SetTitle("EMS Air Garage")

    exports['menu']:AddButton("EMS Air" , "Hurry! Go save lives!" ,'ems:heil1' ,'Lets duty now' , 'menuone')
    exports['menu']:SubMenu("EMS Air Garage Menu" , "Get ready to go active duty" , "menuone")
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


function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
	

        
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            


            
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
            
            end 
        end 
    
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




RegisterNetEvent("ems:car1")
AddEventHandler("ems:car1", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "emsnspeedo"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
          
        end
        lastcar = CreateVehicle(vehiclehash, 330.16, -588.74, 28.58, GetEntityHeading(PlayerPedId())+90, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        print(vehname)
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "emsnspeedo"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
      
    end)
end)


    RegisterNetEvent("ems:heil1")
AddEventHandler("ems:heil1", function (source, args, rawCommand)

    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = "emsair"
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
          
        end
        lastcar = CreateVehicle(vehiclehash, 351.63, -587.96, 74.16, GetEntityHeading(PlayerPedId())+259, 1, 0)
        SetPedIntoVehicle(PlayerPedId(),lastcar,-1)
        local vehname = GetDisplayNameFromVehicleModel(model)
        print(vehname)
        local plate = GetVehicleNumberPlateText(lastcar)
        local vehicle = "emsair"
        
        TriggerEvent("keys:addNew",lastcar,plate)
        TriggerServerEvent('BuyForVeh', plate, vehname, vehicle, price, financed)
      
    end)

    


end)

















 












 












 












 












 












 












 