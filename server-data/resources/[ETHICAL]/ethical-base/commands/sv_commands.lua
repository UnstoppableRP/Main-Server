ETHICAL.Commands = {}
ETHICAL._Commands = {}
ETHICAL._Commands.ValidCommands = {}
ETHICAL._Commands.PersonalCommands = {}
ETHICAL._Commands.AllCommands = {}

function ETHICAL.Commands.AddCommand(self, cmd, help, src, callback)
    if self:IsValid(cmd,src) then return end 

    ETHICAL._Commands.AllCommands[cmd] = help 



    if src and src ~= -1 then 
        ETHICAL._Commands.PersonalCommands[src][cmd] = {f = callback, help = help}
        TriggerClientEvent("chat:addSuggestion", src, cmd, help)
        return 
    end

    ETHICAL._Commands.ValidCommands[cmd] = {f = callback, help = help}
    TriggerClientEvent("chat:addSuggestion", -1, cmd, help)
end


function ETHICAL.Commands.RemoveCommand(self, cmd, src)

    if src and src ~= -1 then 
        ETHICAL._Commands.PersonalCommands[src][cmd] = nil
        TriggerClientEvent("chat:removeSuggestion", src, cmd)
        return 
    end

    ETHICAL._Commands.ValidCommands[cmd] = nil
    TriggerClientEvent("chat:removeSuggestion", -1, cmd)
end

function ETHICAL.Commands.RemoveAllSelfCommands(self,src)
    if src and src ~= -1 then 
        if ETHICAL._Commands.PersonalCommands[src] then 
            for cmd, tbl in pairs(ETHICAL._Commands.PersonalCommands[src]) do 
        ETHICAL._Commands.PersonalCommands[src][cmd] = nil
        TriggerClientEvent("chat:removeSuggestion", src, cmd)
            end 
        end
    end
end

function ETHICAL.Commands.IsValid(self, cmd, src)
    if ETHICAL._Commands.ValidCommands[cmd] and ETHICAL._Commands.ValidCommands[cmd].f then return true, false end 
    if src and src ~= -1 and ETHICAL._Commands.PersonalCommands[src] and ETHICAL._Commands.PersonalCommands[src][cmd].f then return true, true end
    return false, false 
end

function ETHICAL.Commands.RunCommand(self, cmd, src, args)
    if not src or not cmd then return end 
    cmd = string.lower(cmd)

    local valid, personal = self.IsValid(cmd, src)
    
    if not valid then return end 

    if personal then 

        if ETHICAL._Commands.PersonalCommands[src][cmd].f then 
            ETHICAL._Commands.PersonalCommands[src][cmd].f(src, args)
        end
        return 
    end

    if ETHICAL._Commands.ValidCommands[cmd].f then 
        ETHICAL._Commands.ValidCommands[cmd].f(src, args) 
    end
end

RegisterServerEvent("ethical-base:playerSessionStarted")
AddEventHandler("ethical-base:playerSessionStarted", function()
    local src = source 
    ETHICAL._Commands.PersonalCommands[src] = ETHICAL._Commands.PersonalCommands[src] or {}

    for k,v in pairs(ETHICAL._Commands.ValidCommands) do 
        TriggerClientEvent("chat:addSuggestion", src, k, v.help)
    end
end)

AddEventHandler("chatMessage", function(src, author, message)
    if string.sub(message, 1, 1) == "/" then 
        local args = ETHICAL.Util:Stringsplit(message, " ")
        local cmd = args[1]
        cmd  = string.lower(cmd)
       if ETHICAL._Commands.PersonalCommands[src] and ETHICAL._Commands.PersonalCommands[src][cmd] or ETHICAL._Commands.ValidCommands[cmd] then 
        ETHICAL.Commands:RunCommand(cmd, src, args)
       else
        TriggerClientEvent("chatMessage", src, "", {163,163,163}, "^1 Invalid command: '" .. cmd .. "'")
       end

       CancelEvent()
    end
end)

AddEventHandler("playerDropped", function (reason)
     ETHICAL.Commands:RemoveAllSelfCommands(source)
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then 
        for k,v in pairs(ETHICAL._Commands.AllCommands) do 
            TriggerClientEvent("chat:removeSuggestion", -1, k)
        end
    end  
end)

RegisterServerEvent("ethical-base:myCommands")
AddEventHandler("ethical-base:myCommands", function(sauce)
    local src = tonumber(sauce)
    local commandString = " "

    for k,v in pairs(ETHICAL._Commands.AllCommands) do 
        commandString = commandString .. " " .. k .. " - " .. ETHICAL._Commands.AllCommands[k] .. " \n"
    end

    TriggerClientEvent("chatMessage", src, "", 4, commandString)
end)
