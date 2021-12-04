local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/853830895068119092/qbf40LX-oR7fZ0RYuz5g8YETJ25cg6TK3eHKfRcViBtlrCuuI0L5wC5g_FF-BmNL0dBu"

RegisterServerEvent('send')
AddEventHandler('send', function(data)
    if(data.url == nil or data.url == "") then
        data.url = "https://cdn.discordapp.com/attachments/422597127508852736/853831687103053864/EthicalDevs_Discord_Avatar.png"
    end
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Bug Report",
            ["description"] = "Title: \n `"..data.title.."` \n Description: \n `"..data.description.."`",
	        ["footer"] = {
                ["text"] = "Ethical Bugs",
            },
            ["image"] = {
                ["url"] = data.url,
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Bug Reports",  avatar_url = "https://cdn1.iconfinder.com/data/icons/ios-11-glyphs/30/error-512.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

