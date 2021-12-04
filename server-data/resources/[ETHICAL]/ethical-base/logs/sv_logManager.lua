ETHICAL.Logs = ETHICAL.Logs or {}
ETHICAL.Logs.Webhooks = {
    ['Connection'] = 'https://discord.com/api/webhooks/824902187205263360/THe8KXukJ15RbIxzooqpsDT6miex8orUUsTiUA9hucgNdF3WfjDEtjKfLv4FxF9m5Eez'
}

ETHICAL.Logs.Webhooks2 = {
    ['Character'] = 'https://discord.com/api/webhooks/824902187205263360/THe8KXukJ15RbIxzooqpsDT6miex8orUUsTiUA9hucgNdF3WfjDEtjKfLv4FxF9m5Eez'
}

ETHICAL.Logs.JoinLog = function(self, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`Server Connection Accepted.`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", pSteam, pDiscord),
            ['color'] = 3124231,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(ETHICAL.Logs.Webhooks['Connection'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

ETHICAL.Logs.ExitLog = function(self, dReason, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`Server Connection Interrupted.`\n\n`• Reason: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", dReason, pSteam, pDiscord),
            ['color'] = 14038582,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(ETHICAL.Logs.Webhooks['Connection'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

ETHICAL.Logs.UserCreate = function(self, uId, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
    local embed = {
        {
            ['description'] = string.format("`User Profile Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• First Name: %s`\n\n`• Last Name: %s`\n\n`• Date of Birth: %s`\n\n`• Gender: %s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, firstname, lastname, dob, gender),
            ['color'] = 2317994,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(ETHICAL.Logs.Webhooks2['Character'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end



RegisterServerEvent('ethical-base:charactercreate')
AddEventHandler('ethical-base:charactercreate',function(firstname, lastname, dob, gender)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    ETHICAL.Logs:UserCreate(source, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
end)