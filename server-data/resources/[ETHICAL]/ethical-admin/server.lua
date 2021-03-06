ETHICAL = ETHICAL or {}
ETHICAL.Admin = ETHICAL.Admin or {}
ETHICAL._Admin = ETHICAL._Admin or {}
ETHICAL._Admin.Players = {}
ETHICAL._Admin.DiscPlayers = {}

local Players = {}

RegisterServerEvent('ethical-admin:Disconnect')
AddEventHandler('ethical-admin:Disconnect', function(reason)
    DropPlayer(source, reason)
end)

RegisterServerEvent('admin:noclipFromClient')
AddEventHandler('admin:noclipFromClient', function()

end)

RegisterServerEvent('admin:isFlying')
AddEventHandler('admin:isFlying', function(data)
TriggerEvent('ethical-admin:NoclipState', data)
end)

RegisterServerEvent('admin:bringPlayer')
AddEventHandler('admin:bringPlayer', function(pSrc, target)
    local pTarget = tonumber(target)
    local coords = GetEntityCoords(GetPlayerPed(tonumber(pSrc)))
    TriggerClientEvent('ethical-admin:bringPlayer', pTarget, coords)
    TriggerClientEvent('DoLongHudText', tonumber(pSrc), 'Player Brought!')
end)

RegisterServerEvent("admin:getCoords")
AddEventHandler("admin:getCoords", function(Lsrc, target, toggle)
    local src = source
    local pSrc = tonumber(Lsrc)
    local tSrc = tonumber(target)
    local coords = GetEntityCoords(GetPlayerPed(tSrc))
    TriggerClientEvent("admin:attach", pSrc, tSrc, toggle)
    TriggerClientEvent("admin:sendCoords", pSrc, coords)
end)

RegisterServerEvent("admin:search")
AddEventHandler("admin:search", function(pSrc, tSrc)
    local user = exports["ethical-base"]:getModule("Player"):GetUser(tSrc)
    local cid = user:getCurrentCharacter().id
    TriggerClientEvent("server-inventory-open", pSrc, "1", 'ply-'..cid)
end)

RegisterNetEvent("admin:DropPlayer")
AddEventHandler("admin:DropPlayer", function(target, reason)
    local pReason = reason
    DropPlayer(target, "You were kicked | Reason: " ..pReason)
end)

RegisterServerEvent('ethical-admin:setcloak')
AddEventHandler('ethical-admin:setcloak', function(args)
    TriggerClientEvent('cloak', source, args)
end)

RegisterServerEvent('ethical-admin:kick')
AddEventHandler('ethical-admin:kick', function(kickid, reason)
    DropPlayer(kickid, reason)
end)


RegisterServerEvent('ethical-admin:AddPlayer')
AddEventHandler("ethical-admin:AddPlayer", function()
    local src = source
    local user = exports["ethical-base"]:getModule("Player"):GetUser(src)
    if user ~= false then
        local licenses
        local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                steamIdentifier = v
                break
            end
        end
        for _, v in pairs(identifiers) do
            if string.find(v, "license") then
                licenses = v
                break
            end
        end

        local stid = HexIdToSteamId(steamIdentifier)
        local ply = GetPlayerName(source)
        -- local ip = GetPlayerEndpoint(source)
        local scomid = steamIdentifier:gsub("steam:", "")
        local licenseid = licenses:gsub("license:", "")
        local ping = GetPlayerPing(source)
        local data = { source = source, steamid = stid, comid = scomid, name = ply, hexid = user:getVar("hexid"), rank = ETHICAL.Admin:GetPlayerRank(user), license = licenseid, ping = ping}
        table.insert(Players, source)
        TriggerClientEvent("ethical-admin:AddPlayer", -1, data )
        ETHICAL.Admin.AddAllPlayers()
    end
end)

function ETHICAL.Admin.AddAllPlayers(self)
    --local Players = GetPlayers()

    for i, _PlayerId in pairs(GetPlayers()) do
        
        local licenses
        local identifiers, steamIdentifier = GetPlayerIdentifiers(_PlayerId)
        for _, v in pairs(identifiers) do
            if string.find(v, "steam") then
                steamIdentifier = v
                break
            end
        end
        for _, v in pairs(identifiers) do
            if string.find(v, "license") then
                licenses = v
                break
            end
        end
        local ip = GetPlayerEndpoint(_PlayerId)
        local licenseid = licenses:gsub("license:", "")
        local ping = GetPlayerPing(_PlayerId)
        local stid = HexIdToSteamId(steamIdentifier)
        local ply = GetPlayerName(_PlayerId)
        local scomid = steamIdentifier:gsub("steam:", "")
        local data = { src = tonumber(_PlayerId), steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping }

        TriggerClientEvent("ethical-admin:AddAllPlayers", source, data)

    end
end

function ETHICAL.Admin.AddPlayerS(self, data)
    ETHICAL._Admin.Players[data.src] = data
end

AddEventHandler("playerDropped", function()
	local licenses
    local identifiers, steamIdentifier = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenses = v
            break
        end
    end

    local stid = HexIdToSteamId(steamIdentifier)
    local ply = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local scomid = steamIdentifier:gsub("steam:", "")
    local licenseid = licenses:gsub("license:", "")
    local ping = GetPlayerPing(source)
    local data = { src = source, steamid = stid, comid = scomid, name = ply, ip = ip, license = licenseid, ping = ping}

    TriggerClientEvent("ethical-admin:RemovePlayer", -1, data )
    Wait(600000)
    TriggerClientEvent("ethical-admin:RemoveRecent", -1, data)
end)

function HexIdToSteamId(hexId)
    local cid = math.floor(tonumber(string.sub(hexId, 7), 16))
	local steam64 = math.floor(tonumber(string.sub( cid, 2)))
	local a = steam64 % 2 == 0 and 0 or 1
	local b = math.floor(math.abs(6561197960265728 - steam64 - a) / 2)
	local sid = "STEAM_0:"..a..":"..(a == 1 and b -1 or b)
    return sid
end

RegisterServerEvent('admin:setGroup')
AddEventHandler('admin:setGroup', function(pSrc, target, rank)
    local user = exports["ethical-base"]:getModule("Player"):GetUser(target)
    local hexId = user:getVar("hexid")
    exports.ghmattimysql:execute("UPDATE users SET `rank` = @rank WHERE `hex_id` = @hex_id", {
        ['rank'] = rank, 
        ['hex_id'] = hexId
    })
    TriggerClientEvent('DoLongHudText', pSrc, "Set " .. target .. "'s rank to " .. rank .. "!")
    TriggerClientEvent('admin:RegetGroup', target)
end)


RegisterServerEvent("server:enablehuddebug")
AddEventHandler("server:enablehuddebug", function(enable)
    debug = not debug
    local src = source
    if debug then
        exports["ethical-log"]:AddLog("Admin", GetPlayerName(src), "Dev Debug", {item = tostring("Enabled")}) 
        TriggerClientEvent('hud:enabledebug', src)
    else
        exports["ethical-log"]:AddLog("Admin", GetPlayerName(src), "Dev Debug", {item = tostring("Disabled")}) 
        TriggerClientEvent('hud:enabledebug', src)
    end
end)


RegisterServerEvent('ethical-admin:runCommand')
AddEventHandler('ethical-admin:runCommand', function(data)
    local src = source
    TriggerClientEvent('ethical-admin:RunClCommand', src, data.command, data)
    if ETHICAL._Admin.Commands[data.command].runcommand then
        local caller = {
            source = src,
            name = GetPlayerName(src),
            steamid = GetPlayerIdentifiers(src)[1],
            getVar = function(self, key) return self[key] end,
        }
        ETHICAL._Admin.Commands[data.command].runcommand(caller, data)
    end
end)

RegisterServerEvent('admin:dumpCurrentPlayers')
AddEventHandler('admin:dumpCurrentPlayers', function()

end)

RegisterServerEvent('admin:teleportToPlayer')
AddEventHandler('admin:teleportToPlayer', function(target)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(target))
    TriggerClientEvent('ethical-admin:bringPlayer', src, coords)
    TriggerClientEvent('DoLongHudText', src, 'You teleported to this player.')
end)



RegisterServerEvent("ethical-admin:update:vehicle")
AddEventHandler("ethical-admin:update:vehicle", function(pSrc, vPlate)
    exports.ghmattimysql:execute("SELECT * FROM characters_cars WHERE license_plate = @id", {['id'] = vPlate}, function(data)
        if data[1] then
            if data[1].vehicle_state == "In" then
                exports.ghmattimysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state WHERE `license_plate` = @id", { ['id'] = vPlate, ['vehicle_state'] = "Out"})
                TriggerClientEvent("DoLongHudText", pSrc, "Vehicle State: Out")
            elseif data[1].vehicle_state == "Out" then
                exports.ghmattimysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state WHERE `license_plate` = @id", { ['id'] = vPlate, ['vehicle_state'] = "In"})
                TriggerClientEvent("DoLongHudText", pSrc, "Vehicle State: In")
            end
        end
    end)
end)