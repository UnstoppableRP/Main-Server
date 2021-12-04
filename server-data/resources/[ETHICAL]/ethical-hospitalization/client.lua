local isTriageEnabled = false
local isdoc = false
local isadded = false
local injurycount = 0

local bedcoords = {
    [1] =  { ['x'] = 310.26,['y'] = -577.63,['z'] = 43.29,['h'] = 53.16 },   
    [2] =  { ['x'] = 321.9,['y'] = -585.86,['z'] = 43.29,['h'] = 193.55 },
    [3] =  { ['x'] = 318.56,['y'] = -580.69,['z'] = 43.29,['h'] = 245.66 },
    [4] =  { ['x'] = 316.87,['y'] = -584.93,['z'] = 43.29,['h'] = 247.1 },
    [5] =  { ['x'] = 313.56,['y'] = -583.83,['z'] = 43.29,['h'] = 250.0 },
    [6] =  { ['x'] = 314.91,['y'] = -579.39,['z'] = 43.29,['h'] = 68.7 },
    [7] =  { ['x'] = 312.01,['y'] = -583.34,['z'] = 43.29,['h'] = 66.16 },
}

RegisterNetEvent("ethical-hospitalization:checkin")
AddEventHandler("ethical-hospitalization:checkin", function()
	--if exports["isPed"]:isPed("countems") <= 0 or exports["isPed"]:isPed("myJob") == 'ems' then
		loadAnimDict('anim@narcotics@trash')
		TaskPlayAnim(PlayerPedId(),'anim@narcotics@trash', 'drop_front',1.0, 1.0, -1, 1, 0, 0, 0, 0)
		local finished = exports["ethical-taskbar"]:taskBar(1700,"Checking Credentials")
		if finished == 100 then
			TriggerEvent("bed:checkin")
		end
	--else
		--TriggerEvent('DoLongHudText', 'There is ems on duty please page them!', 2)
	--end
end)

RegisterNetEvent("ethical-hospitalization:page")
AddEventHandler("ethical-hospitalization:page", function()
	if exports["isPed"]:isPed("countems") >= 1 then 
		loadAnimDict('anim@narcotics@trash')
		TaskPlayAnim(PlayerPedId(),'anim@narcotics@trash', 'drop_front',1.0, 1.0, -1, 1, 0, 0, 0, 0)
		local finished = exports["ethical-taskbar"]:taskBar(1700,"Paging a Doctor")
		if finished == 100 then
			if exports["isPed"]:isPed("countems") >= 1 and not isTriageEnabled then
				TriggerEvent("DoLongHudText","A doctor has been paged. Please take a seat and wait.",2)
				TriggerServerEvent("phone:triggerPager")
			end
		end
	else
		TriggerEvent('DoLongHudText', 'There is no ems on duty please check in!', 2)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

Citizen.CreateThread( function()
	while true do 
		if ICU then
			DrawRect(0,0, 10.0, 10.0, 1, 1, 1, 255)
			DisableControlAction(0, 47, true)
		end
		Citizen.Wait(1)
	end
end)

RegisterNetEvent("doctor:setTriageState")
AddEventHandler("doctor:setTriageState", function(pState)
	isTriageEnabled = pState
end)

local function HealInjuries()
	local count, injury = 0, nil

	if bones ~= nil then
		for i = 1, #bones do
			if bones[i]["timer"] > 0 then
				bones[i]["timer"] = 0
				count = count + bones[i]["hitcount"]
				bones[i]["hitcount"] = 0
				bones[i]["applied"] = false
				Citizen.Wait(1000)

				injury = bones[i]["part"] .. " Injury"
			end
		end
	end

	return count, injury
end

function CheckBeds(x,y,z)
	local players = GetPlayers()
	local ply = PlayerPedId()
	local closestplayers = {}
	local closestdistance = {}
	local closestcoords = {}
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(x,y,z))
			if(distance < 3) then
				return false
			end
		end
	end
	return true
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end