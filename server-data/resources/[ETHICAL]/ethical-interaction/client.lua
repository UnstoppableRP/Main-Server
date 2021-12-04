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


exports("hideInteraction", function()
    SendNUIMessage({
        type = "close",
    })
end)

exports("showInteraction", function(text,type)
    showInteraction(text,type)
end)

RegisterCommand('cinter', function(source, args)
    hideInteraction()
end)

local color = ""
local doors_state = ""

RegisterNetEvent('bl:interaction:door-state')
AddEventHandler('bl:interaction:door-state', function(colors,state)
    color = colors
    doors_state = state
end)

RegisterNetEvent('bl:interaction:door-states')
AddEventHandler('bl:interaction:door-states', function(colors,state)
    color = colors
    doors_state = state
    showInteraction(state,colors)
end)

RegisterNetEvent('bl:interaction:open')
AddEventHandler('bl:interaction:open', function(pzone, colors,state)
    print("COMING HERE",pzone)

    if pzone == "lspd_doors_1" then
        showInteraction(doors_state,color)
    elseif pzone == "officer_sign_in" then 
        showInteraction("[E] Sign In / [G] Out")
    end
end)

RegisterNetEvent('bl:interaction:close')
AddEventHandler('bl:interaction:close', function()
        hideInteraction()
end)

-- Citizen.CreateThread(function()

--     while true do
        
--         Citizen.Wait(5)
--         if  IsControlJustReleased(0,  137) then
--             print("PRESSSS")
--             showInteraction("TEST","success")
--         end
--     end
-- end)