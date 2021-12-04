---------------------------------- VAR ----------------------------------
isCop = false
curJob = nil

local changeYourJob = {
  {name="Job Center", colour=17, id=351, x=-1081.8293457031, y=-248.12872314453, z=37.763294219971},
}

local jobs = {
  {name="Unemployed", id="unemployed"},
  {name="Tow Truck Driver", id="towtruck"},  
  {name="Taxi Driver", id="taxi"},
  {name="Delivery Job", id="trucker"},
  {name="Entertainer", id = "entertainer"},
  {name="News Reporter", id = "news"},
  {name="Food Truck", id = "foodtruck"},
    --{name="EMS", id="ems"},
}

---------------------------------- FUNCTIONS ----------------------------------

local PaycheckSpot, called = false, false

Citizen.CreateThread(function()
  exports["ethical-polyzone"]:AddBoxZone("exit_job_center", vector3(-1389.412, -475.6651, 72.04217), 1.8, 2.4, {
      heading=315,
      minZ=65.44,
      maxZ=75.04
    })
    exports["ethical-polyzone"]:AddBoxZone("enter_job_center", vector3(-1082.48, -248.09, 37.76), 1.8, 2.4, {
      heading=315,
      minZ=36.76,
      maxZ=38.76
    })
end)

-- function menuJobs()
--   MenuTitle = "Jobs"
--   ClearMenu()
--   for _, item in pairs(jobs) do
--     local nameJob = item.name
--     local idJob = item.id
--     Menu.addButton(nameJob,"changeJob",idJob)
--   end
-- end

function changeJob(id)
  TriggerServerEvent("jobssystem:jobs", id)
end

RegisterNetEvent("jobsystem:changeJob")
AddEventHandler("jobsystem:changeJob", function()
  exports['menu']:SetTitle("Job Center")
  exports['menu']:AddButton("Unemployed" , "You are homeless" ,'jobsystem:change' ,'unemployed' , 'job')
  exports['menu']:AddButton("Tow Truck Driver" , "Ofcourse you are truck driver" ,'jobsystem:change' ,'towtruck' , "job" )
  exports['menu']:AddButton("Taxi Driver" , "You fetch people lol" ,'jobsystem:change' ,'taxi' , "job" )
  exports['menu']:AddButton("Delivery Job" , "You delivered a package" ,'jobsystem:change' ,'trucker' , "job" )
  exports['menu']:AddButton("Entertainer" , "You are going to entertain people" ,'jobsystem:change' ,'entertainer' , "job" )
  exports['menu']:AddButton("News Reporter" , "You broadcast an accident" ,'jobsystem:change' ,'news' , "job" )
  exports['menu']:AddButton("Food Truck" , "You make and delivered food" ,'jobsystem:change' ,'foodtruck' , "job" )
  exports['menu']:SubMenu("Change Job" , "Choose your desire job" , "job" )
end)

RegisterNetEvent('jobsystem:change')
AddEventHandler('jobsystem:change', function(id)
  TriggerServerEvent("jobssystem:jobs", id)
end)

---------------------------------- CITIZEN ----------------------------------
local inGurgle = false
RegisterNetEvent('event:control:jobSystem')
AddEventHandler('event:control:jobSystem', function(useID)
  if useID == 1 then
    TriggerServerEvent("server:paySlipPickup")
    Citizen.Wait(1000)

  elseif useID == 2 and not inGurgle then
    TriggerEvent("Gurgle:open")
    inGurgle = true

  elseif useID == 3 then
    menuJobs()
    Menu.hidden = not Menu.hidden 

  end
end)

RegisterNetEvent('payJob:System:target')
AddEventHandler('payJob:System:target', function()
  TriggerEvent('event:control:jobSystem',1)
end)
-- #MarkedForMarker
-- Citizen.CreateThread(function()
--   while true do
--     Citizen.Wait(0)
--     local ply = PlayerPedId()
--     local plyCoords = GetEntityCoords(ply, 0)

--     local jobDst = #(vector3(-1381.527,-477.8708,72.04207) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
--     local gurDst = #(vector3(-1062.96, -248.24, 44.03) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
--     local payDst = #(vector3(-1082.81, -248.19, 37.77) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))

--     if jobDst > 30 and gurDst > 30 and payDst > 30 then
--       Citizen.Wait(1000)
--     else

--       DrawMarker(27,-1082.81, -248.19, 36.77, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0) 
--       DrawMarker(27,-1062.96, -248.24, 43.03, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0) 
--       DrawMarker(27,-1381.527,-477.8708,72.04207, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

--       if payDst < 1 then
--           drawTxt('Push ~b~E~s~ to pick up your paycheck!',0,1,0.5,0.8,0.35,255,255,255,255)
--       end

--       if gurDst < 1 then
--           drawTxt('Push ~b~E~s~ to create a Gurgle.cum website.',0,1,0.5,0.8,0.35,255,255,255,255)
--       else
--         inGurgle = false
--       end

--       if jobDst < 1 then
          
--         if Menu.hidden then
--           drawTxt('Push ~b~E~s~ to access jobs (Tow / Taxi / News require your own specific vehicle)',0,1,0.5,0.8,0.35,255,255,255,255)
          
--         else
--           drawTxt('Push ~b~Arrows~s~ to change selection, ~b~Enter~s~ to select, ~b~Backspace~s~ to quit. ',0,1,0.5,0.8,0.35,255,255,255,255)
--         end
--       end
--       Menu.renderGUI()
--     end

    
--   end
-- end)




RegisterNetEvent('enableGurgleText')
AddEventHandler('enableGurgleText', function()
  inGurgle = false
end)
RegisterNetEvent('jobssystem:getJob')
AddEventHandler('jobssystem:getJob', function(cb)
  cb(curJob)
end)

RegisterNetEvent('jobssystem:updateJob')
AddEventHandler('jobssystem:updateJob', function(nameJob)
  if nameJob ~= curJob then
    TriggerEvent('clearJobBlips')
  end

  local id = PlayerId()
  local playerName = GetPlayerName(id)

  SendNUIMessage({
    updateJob = true,
    job = nameJob,
    player = playerName
  })

  curJob = nameJob

  if nameJob == "unemployed" then
    TriggerEvent('nowUnemployed')
  end

  if nameJob == "news" then
    TriggerEvent("DoLongHudText", "Press H to pull item news items.")
    TriggerEvent("DoLongHudText", "Press H to pull item news items.")
  end
  
end)

RegisterNetEvent('jobssystem:current')
AddEventHandler('jobssystem:current', function(cb)
  LocalPlayer = exports["ethical-base"]:getModule("LocalPlayer")
  cb(LocalPlayer:getVar("job"))
end)


AddEventHandler("ethical-polyzone:enter", function(zone, data)
    
 
end)

AddEventHandler("ethical-polyzone:exit", function(zone)
  if zone == "exit_job_center" or zone == "enter_job_center" then
      listening = false
      NearShopClothes = false
      exports["ethical-interaction"]:hideInteraction()
  end
end)

AddEventHandler("ethical-polyzone:enter", function(zone, data)
  if zone == "enter_job_center" then
    PaycheckSpot = true
    exports["ethical-interaction"]:showInteraction("[E] Collect Paycheck", "information")
    PaycheckFunction()
  end
 
end)

function PaycheckFunction()
  Citizen.CreateThread(function()
    while PaycheckSpot do
      Citizen.Wait(5)
      if IsControlJustReleased(0, 38) then
        if called == false then
          called = true
          TriggerServerEvent("paycheck:collect", exports["isPed"]:isPed("cid"))
          Citizen.Wait(500)
          called = false
        end
      end
    end
  end)
end
