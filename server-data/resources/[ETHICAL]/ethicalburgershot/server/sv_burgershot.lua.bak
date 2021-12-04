--------------------------------------------------------------------------------------------------
--																				          	    --
--       ______ _______ _    _ _____ _____          _        _____  ________       _______      --
--      |  ____|__   __| |  | |_   _/ ____|   /\   | |      |  __ \|  ____\ \    / / ____|      --
--      | |__     | |  | |__| | | || |       /  \  | |      | |  | | |__   \ \  / / (___        --
--      |  __|    | |  |  __  | | || |      / /\ \ | |      | |  | |  __|   \ \/ / \___ \       --
--      | |____   | |  | |  | |_| || |____ / ____ \| |____  | |__| | |____   \  /  ____) |      --
--      |______|  |_|  |_|  |_|_____\_____/_/    \_\______| |_____/|______|   \/  |_____/       --
-- 																					            --
--                           joshua#5319 glacielgaming#6969 Woodz#1668                          --
--------------------------------------------------------------------------------------------------

RegisterServerEvent('ethicalburgershot:bill:player')
AddEventHandler("ethicalburgershot:bill:player", function(TargetID, amount)
	local src = source
	local target = tonumber(TargetID)
	local fine = tonumber(amount)
	local user = exports["ethical-base"]:getModule("Player"):GetUser(target)
	local characterId = user:getCurrentCharacter().id
	if user ~= false then
			TriggerEvent("cash:remove", target, fine)
			TriggerClientEvent('DoLongHudText', target, "You have been billed $"..fine, 1)
			TriggerClientEvent('DoLongHudText', src, "You have successfully wrote a bill for $"..fine, 1)
			TriggerEvent("bank:addlog", characterId, fine, "Fine", false)
	end
end)

--------------------------------------------------------------------------------------------------
--																				          	    --
--       ______ _______ _    _ _____ _____          _        _____  ________       _______      --
--      |  ____|__   __| |  | |_   _/ ____|   /\   | |      |  __ \|  ____\ \    / / ____|      --
--      | |__     | |  | |__| | | || |       /  \  | |      | |  | | |__   \ \  / / (___        --
--      |  __|    | |  |  __  | | || |      / /\ \ | |      | |  | |  __|   \ \/ / \___ \       --
--      | |____   | |  | |  | |_| || |____ / ____ \| |____  | |__| | |____   \  /  ____) |      --
--      |______|  |_|  |_|  |_|_____\_____/_/    \_\______| |_____/|______|   \/  |_____/       --
-- 																					            --
--                           joshua#5319 glacielgaming#6969 Woodz#1668                          --
--------------------------------------------------------------------------------------------------
