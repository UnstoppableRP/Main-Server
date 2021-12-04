
RegisterNetEvent("ethical-jobmanager:playerBecameJob")
AddEventHandler("ethical-jobmanager:playerBecameJob", function(job, name, notify)
    local LocalPlayer = exports["ethical-base"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", job)
    if notify ~= false then 

    end
    if name == "Entertainer" then
	    TriggerEvent('DoLongHudText',"College DJ and Comedy Club pay per person around you",1)
	end
    if name == "Broadcaster" then
        TriggerEvent('DoLongHudText',"(RadioButton + LeftCtrl for radio toggle)",3)
        TriggerEvent('DoLongHudText',"Broadcast from this room and give out the vibes to los santos on 1982.9",1)
    end  
	if job == "unemployed"  then
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
        SetPoliceIgnorePlayer(PlayerPedId(),false)
        TriggerEvent("ResetRadioChannel");
        TriggerEvent('DoLongHudText',"You're now unemployed!",1)
	end
    
    if job == "trucker" then

    end

    if job == "towtruck" then
        TriggerEvent("DoLongHudText","Use /tow to tow cars to your truck.",1)

    end

    if job == "news"  then
        TriggerEvent('DoLongHudText',"'H' to use item, F1 change item. (/light r g b)",1)
    end

    if job == "driving instructor"  then
        TriggerEvent('DoLongHudText',"'/driving' to use access driving instructor systems",1)
    end
    
    if job == "pdm"  then
        TriggerEvent('DoLongHudText',"Go Sell Some Cars",1)
    end

    if job == "OffBurgerShot"  then
        TriggerEvent('DoLongHudText',"You are now off the clock, go home loser!",1)
    end

    if job == "police" then
        TriggerEvent('DoLongHudText',"Go protect and serve!",1)
    end
    if job == "ems" then
        TriggerEvent('DoLongHudText',"Go save some lives!",1)
    end
    if job == "doctor" then
        TriggerEvent('DoLongHudText',"Go save some lives!",1)
    end
    if job == "BurgerShot" then
        TriggerEvent('DoLongHudText',"You are on the clock, start flipping burgers!",1)
    end
   -- TriggerServerEvent("ethical-items:updateID",job,exports["isPed"]:retreiveBusinesses())
end)

RegisterNetEvent("ethical-base:characterLoaded")
AddEventHandler("ethical-base:characterLoaded", function(character)
    local LocalPlayer = exports["ethical-base"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", "unemployed")

end)

RegisterNetEvent("ethical-base:exportsReady")
AddEventHandler("ethical-base:exportsReady", function()
    exports["ethical-base"]:addModule("JobManager", ETHICAL.Jobs)
end)