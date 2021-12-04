ETHICAL.Player = ETHICAL.Player or {}
ETHICAL.LocalPlayer = ETHICAL.LocalPlayer or {}

local function GetUser()
    return ETHICAL.LocalPlayer
end

function ETHICAL.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function ETHICAL.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function ETHICAL.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function ETHICAL.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("ethical-base:networkVar")
AddEventHandler("ethical-base:networkVar", function(var, val)
    ETHICAL.LocalPlayer:setVar(var, val)
end)

RegisterNetEvent("ethical-base:startup")
AddEventHandler("ethical-base:startup", function()
    TriggerServerEvent('ethical-scoreboard:AddPlayer')
    TriggerServerEvent('ethical-admin:AddPlayer')
    TriggerServerEvent("police:getAnimData")
    TriggerServerEvent("police:getEmoteData")
    TriggerServerEvent("police:getMeta")
    TriggerServerEvent("stocks:retrieveclientstocks")
    TriggerServerEvent("ethical-weapons:getAmmo")
    TriggerServerEvent("trucker:returnCurrentJobs")
    TriggerEvent("reviveFunction")
    TriggerServerEvent("kGetWeather")
end)