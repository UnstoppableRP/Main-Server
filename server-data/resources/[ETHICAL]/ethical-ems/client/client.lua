local IsBusy = false

RegisterNetEvent('ems:duty')
AddEventHandler('ems:duty', function()
    exports['menu']:SetTitle("EMS Duty")
    exports['menu']:AddButton("On Duty" , "On Duty Paramedic" ,'ems:onduty' ,'Lets duty now' , 'menuone')
    exports['menu']:AddButton("Off Duty" , "Off Duty Paramedic" ,'ems:offduty' ,'Lets duty now' , 'menuone')
    exports['menu']:SubMenu("Duty Form" , "You can sign in and out here" , "menuone" )
   
end)

RegisterNetEvent('ems:onduty')
AddEventHandler('ems:onduty', function()
    TriggerEvent('event:control:hospitalGarage', 1)
end)

RegisterNetEvent('ems:offduty')
AddEventHandler('ems:offduty', function()
    TriggerEvent('event:control:hospitalGarage', 3)
end)

RegisterNetEvent("ethical-ems:smallheal")
AddEventHandler("ethical-ems:smallheal", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 2.0 then
        TriggerEvent('DoLongHudText', 'There is no player(s) nearby!', 2)
	else
					
    	IsBusy = true
 
		local closestPlayerPed = GetPlayerPed(closestPlayer)
		local health = GetEntityHealth(closestPlayerPed)

		if health > 0 then
			local playerPed = PlayerPedId()
	
			IsBusy = true
			TriggerEvent('DoLongHudText', 'Small Healing In Progress', 1)
			TriggerEvent("animation:PlayAnimation","layspike")
			Citizen.Wait(2000)
			ClearPedTasks(playerPed)
	
			TriggerServerEvent('ethical-ems:heal', GetPlayerServerId(closestPlayer))

			TriggerEvent('DoLongHudText', 'You have successfully healed player', 1)
			IsBusy = false
		else
			TriggerEvent('DoLongHudText', 'Player is conscious please take them to pillbox to get further treatment!', 2)
		end
	end
end)

RegisterNetEvent("ethical-ems:bigheal")
AddEventHandler("ethical-ems:bigheal", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 2.0 then
        TriggerEvent('DoLongHudText', 'There is no player(s) nearby!', 2)
    else
        
        IsBusy = true
 
		local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)
        
		if health > 0 then
			local playerPed = PlayerPedId()
	
			IsBusy = true
			TriggerEvent('DoLongHudText', 'Big Healing In Progress', 1)
			TriggerEvent("animation:PlayAnimation","layspike")
			Citizen.Wait(2000)
			ClearPedTasks(playerPed)
	
			TriggerServerEvent('ethical-ems:heal2', GetPlayerServerId(closestPlayer))
	
			TriggerEvent('DoLongHudText', 'You have successfully healed player', 1)
			IsBusy = false
		else
			TriggerEvent('DoLongHudtext', 'Player is unconscious please take them to pillbox to get further treatment!', 2)
		end
	end
end)


RegisterNetEvent("ethical-ems:emsRevive")
AddEventHandler("ethical-ems:emsRevive", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()
    local cid = exports["isPed"]:isPed("cid")
    if closestPlayer == -1 or closestDistance > 2.0 then
		TriggerEvent('DoLongHudText', 'There is no player(s) nearby!',2)
    else
                    
		local closestPlayerPed = GetPlayerPed(closestPlayer)
	
		if IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_a", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_b", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_c", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_d", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_e", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_f", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_g", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_h", 3)then
			local playerPed = PlayerPedId()

				IsBusy = true
			    TriggerEvent('DoLongHudText', 'Revive In Progress')
	
				TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				ClearPedTasks(playerPed)
				TriggerServerEvent('admin:revivePlayer', GetPlayerServerId(closestPlayer))
				TriggerEvent('DoLongHudText', 'You have revived '.. GetPlayerName(closestPlayer)..' and earned $50')
				TriggerServerEvent("payslip:add", cid, 50)
				TriggerServerEvent("server:givepayJob", 'EMS Paycheck', 50)
				TriggerEvent('DoLongHudText', 'You have successfully revived player')
				IsBusy = false
			else
			TriggerEvent('DoLongHudText', 'Player is conscious please take them to pillbox to get further treatment!', 2)
		end
    end
end)


RegisterNetEvent('ethical-ems:heal')
AddEventHandler('ethical-ems:heal', function(target)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
    local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 10))
    SetEntityHealth(playerPed, newHealth)
    TriggerEvent('ethical-hospital:client:RemoveBleed')
	TriggerEvent('DoLongHudText', 'You have been healed!', 1)
end)


RegisterNetEvent('ethical-ems:big')
AddEventHandler('ethical-ems:big', function(target)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
    local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 10))
    SetEntityHealth(playerPed, newHealth)
    TriggerEvent('ethical-hospital:client:RemoveBleed')
    TriggerEvent('ethical-hospital:client:ResetLimbs')
end)

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
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