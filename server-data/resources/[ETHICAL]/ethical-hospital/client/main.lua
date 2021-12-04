local hspLocs = {
    [1] = { ["x"] = 307.09, ["y"] = -595.01, ["z"] = 43.28, ["h"] = 192.33229064941, ["name"] = "[E] Check In", ["fnc"] = "DrawText3DTest" },
}
local pillboxTeleports = {
    { x = 325.48892211914, y = -598.75372314453, z = 43.291839599609, h = 64.513374328613, text = 'Press ~INPUT_CONTEXT~ ~s~to go to lower Pillbox Entrance' },
    { x = 355.47183227539, y = -596.26495361328, z = 28.773477554321, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
    { x = 359.57849121094, y = -584.90911865234, z = 28.817169189453, h = 245.85662841797, text = 'Press ~INPUT_CONTEXT~ ~s~to enter Pillbox Hospital' },
}

function DrawText3DTest(x,y,z, text)
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

local bedOccupying = nil
local bedObject = nil
local bedOccupyingData = nil

local cam = nil

local inBedDict = "missfinale_c1@"
local inBedAnim = "lying_dead_player0"
local getOutDict = 'switch@franklin@bed'
local getOutAnim = 'sleep_getup_rubeyes'

function PrintHelpText(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function LeaveBed()
    RequestAnimDict(getOutDict)
    while not HasAnimDictLoaded(getOutDict) do
        Citizen.Wait(0)
    end

    RenderScriptCams(0, true, 200, true, true)
    DestroyCam(cam, false)

    SetEntityInvincible(PlayerPedId(), false)

    SetEntityHeading(PlayerPedId(), bedOccupyingData.h - 90)
    TaskPlayAnim(PlayerPedId(), getOutDict , getOutAnim ,8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent('ethical-hospital:server:LeaveBed', bedOccupying)

    FreezeEntityPosition(bedObject, false)
    
    bedOccupying = nil
    bedObject = nil
    bedOccupyingData = nil
end

RegisterNetEvent('ethical-hospital:client:RPCheckPos')
AddEventHandler('ethical-hospital:client:RPCheckPos', function()
    TriggerServerEvent('ethical-hospital:server:RPRequestBed', GetEntityCoords(PlayerPedId()))
end)

RegisterNetEvent('ethical-hospital:client:RPSendToBed')
AddEventHandler('ethical-hospital:client:RPSendToBed', function(id, data)
    bedOccupying = id
    bedOccupyingData = data

    bedObject = GetClosestObjectOfType(data.x, data.y, data.z, 1.0, data.model, false, false, false)
    FreezeEntityPosition(bedObject, true)

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z)
    
    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end

    TaskPlayAnim(PlayerPedId(), inBedDict , inBedAnim ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(PlayerPedId(), data.h + 180)

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    AttachCamToPedBone(cam, PlayerPedId(), 31085, 0, 0, 1.0 , true)
    SetCamFov(cam, 90.0)
    SetCamRot(cam, -90.0, 0.0, GetEntityHeading(PlayerPedId()) + 180, true)

    SetEntityInvincible(PlayerPedId(), true)
            

    Citizen.CreateThread(function()
        while bedOccupyingData ~= nil do
            Citizen.Wait(1)
            PrintHelpText('Press ~INPUT_VEH_DUCK~ to get up')
            if IsControlJustReleased(0, 56) then
                LeaveBed()
            end
        end
    end)
end)

RegisterNetEvent('ethical-hospital:client:SendToBed')
AddEventHandler('ethical-hospital:client:SendToBed', function(id, data)
    bedOccupying = id
    bedOccupyingData = data

    bedObject = GetClosestObjectOfType(data.x, data.y, data.z, 1.0, data.model, false, false, false)
    FreezeEntityPosition(bedObject, true)

    SetEntityCoords(PlayerPedId(), data.x, data.y, data.z)
    RequestAnimDict(inBedDict)
    while not HasAnimDictLoaded(inBedDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), inBedDict , inBedAnim ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(PlayerPedId(), data.h + 180)
    SetEntityInvincible(PlayerPedId(), true)
    SetEntityHeading(PlayerPedId(), GetEntityHeading(bed))

    Citizen.CreateThread(function ()
        Citizen.Wait(5)
        local player = PlayerPedId()
        
        TriggerEvent('DoLongHudText', 'Doctors Are Treating You')
        Citizen.Wait(Config.AIHealTimer * 1000)
        TriggerServerEvent('ethical-hospital:server:EnteredBed')
    end)
end)

RegisterNetEvent('ethical-hospital:client:FinishServices')
AddEventHandler('ethical-hospital:client:FinishServices', function()
	SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
    TriggerEvent('ethical-hospital:client:RemoveBleed')
    TriggerEvent('ethical-hospital:client:ResetLimbs')
    TriggerEvent('DoLongHudText', 'Treated.')
    LeaveBed()
end)

RegisterNetEvent('ethical-hospital:elevatormainfloor')
AddEventHandler('ethical-hospital:elevatormainfloor', function()
    exports['menu']:SetTitle("Elevator Levels")
    exports['menu']:AddButton("Go Up" , "[ROOF]" ,'ethical-hospital:elevator1' , false)
    exports['menu']:AddButton("Go Down" , "[GARAGE]" ,'ethical-hospital:elevator2' , false)
end)
RegisterNetEvent('ethical-hospital:elevatorroof')
AddEventHandler('ethical-hospital:elevatorroof', function()
    exports['menu']:SetTitle("Elevator Levels")
    exports['menu']:AddButton("Go Down" , "[MAIN FLOOR]" ,'ethical-hospital:elevator3' , false)
end)

RegisterNetEvent('ethical-hospital:elevatorgarage')
AddEventHandler('ethical-hospital:elevatorgarage', function()
    exports['menu']:SetTitle("Elevator Levels")
    exports['menu']:AddButton("Go Up" , "[MAIN FLOOR]" ,'ethical-hospital:elevator3' , false)
end)

RegisterNetEvent('ethical-hospital:elevator2')
AddEventHandler('ethical-hospital:elevator2', function()
    SetEntityCoords(PlayerPedId(), 340.21, -584.67, 28.8)
end)


RegisterNetEvent('ethical-hospital:elevator1')
AddEventHandler('ethical-hospital:elevator1', function()
    SetEntityCoords(PlayerPedId(), 338.9, -583.92, 74.16)
end)

RegisterNetEvent('ethical-hospital:elevator3')
AddEventHandler('ethical-hospital:elevator3', function()
    SetEntityCoords(PlayerPedId(), 332.17, -595.65, 43.28)
end)
