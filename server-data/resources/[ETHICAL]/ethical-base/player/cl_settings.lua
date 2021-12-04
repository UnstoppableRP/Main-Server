ETHICAL.SettingsData = ETHICAL.SettingsData or {}
ETHICAL.Settings = ETHICAL.Settings or {}

ETHICAL.Settings.Current = {}
-- Current bind name and keys
ETHICAL.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["clickVolume"] = 0.8,
    ["radioVolume"] = 0.8,
    ["phoneVolume"] = 0.8,
    ["releaseDelay"] = 200
  },
  ["hud"] = {

  }

}


function ETHICAL.SettingsData.setSettingsTable(settingsTable, shouldSend)
  if settingsTable == nil then
    ETHICAL.Settings.Current = ETHICAL.Settings.Default
    TriggerServerEvent('ethical-base:sv:player_settings_set',ETHICAL.Settings.Current)
    ETHICAL.SettingsData.checkForMissing()
  else
    if shouldSend then
      ETHICAL.Settings.Current = settingsTable
      TriggerServerEvent('ethical-base:sv:player_settings_set',ETHICAL.Settings.Current)
      ETHICAL.SettingsData.checkForMissing()
    else
       ETHICAL.Settings.Current = settingsTable
       ETHICAL.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",ETHICAL.Settings.Current)

end

function ETHICAL.SettingsData.setSettingsTableGlobal(self, settingsTable)
  ETHICAL.SettingsData.setSettingsTable(settingsTable,true);
end

function ETHICAL.SettingsData.getSettingsTable()
    return ETHICAL.Settings.Current
end

function ETHICAL.SettingsData.setVarible(self,tablename,atrr,val)
  ETHICAL.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('ethical-base:sv:player_settings_set',ETHICAL.Settings.Current)
end

function ETHICAL.SettingsData.getVarible(self,tablename,atrr)
  return ETHICAL.Settings.Current[tablename][atrr]
end

function ETHICAL.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(ETHICAL.Settings.Default) do
    if ETHICAL.Settings.Current[j] == nil then
      isMissing = true
      ETHICAL.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  ETHICAL.Settings.Current[j][k] == nil then
           ETHICAL.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('ethical-base:sv:player_settings_set',ETHICAL.Settings.Current)
  end


end

RegisterNetEvent("ethical-base:cl:player_settings")
AddEventHandler("ethical-base:cl:player_settings", function(settingsTable)
  ETHICAL.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("ethical-base:cl:player_reset")
AddEventHandler("ethical-base:cl:player_reset", function(tableName)
  if ETHICAL.Settings.Default[tableName] then
      if ETHICAL.Settings.Current[tableName] then
        ETHICAL.Settings.Current[tableName] = ETHICAL.Settings.Default[tableName]
        ETHICAL.SettingsData.setSettingsTable(ETHICAL.Settings.Current,true)
      end
  end
end)