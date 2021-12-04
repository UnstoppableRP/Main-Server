RegisterServerEvent('error')
AddEventHandler('error',function(resource, args)

    sendToDiscord("```Error in "..resource..'```', args)
    createFile(args)
end)



function sendToDiscord(name, args, color)
    local connect = {
          {
            ["color"] = 16711680,
            ["title"] = "".. name .."",
            ["description"] = args,
          }
      }
    PerformHttpRequest('https://canary.discord.com/api/webhooks/801641849546342410/LJYXEy_wyWjPpCr412cPcs4ae5-7ynLx86pwPPzxdao8p1Wpv6B_VBBTdOxWTK_qn28u', function(err, text, headers) end, 'POST', json.encode({username = "Error Log", embeds = connect, avatar_url = "https://i.imgur.com/VuKnN5P_d.webp?maxwidth=728&fidelity=grand"}), { ['Content-Type'] = 'application/json' })
end

function createFile(data)
    local file = io.open("error_logs.txt",'r')
    file:write((data))
    file:close()
end
