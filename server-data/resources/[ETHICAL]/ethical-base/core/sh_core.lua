ETHICAL.Core = ETHICAL.Core or {}

function ETHICAL.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[ETHICAL LOG - %s] %s", mod, msg)
    if not pMsg then return end

    print(pMsg)
end

RegisterNetEvent("ethical-base:consoleLog")
AddEventHandler("ethical-base:consoleLog", function(msg, mod)
    ETHICAL.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not ETHICAL[module] then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return ETHICAL[module]
end

function addModule(module, tbl)
    if ETHICAL[module] then print("Warning: '" .. tostring(module) .. "' module is being overridden") end
    ETHICAL[module] = tbl
end

ETHICAL.Core.ExportsReady = false

function ETHICAL.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["ethical-base"] then
                TriggerEvent("ethical-base:exportsReady")
                ETHICAL.Core.ExportsReady = true
                return
            end
        end
    end)
end

exports("getModule", getModule)
exports("addModule", addModule)
ETHICAL.Core:WaitForExports()