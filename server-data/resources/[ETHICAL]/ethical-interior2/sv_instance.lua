local ActiveInstances = {}

RegisterServerEvent('ethical-build:instance:remove')
AddEventHandler('ethical-build:instance:remove', function()
	for k,v in pairs(ActiveInstances) do
		for key, value in pairs(v.players) do
			if value == source then
				ActiveInstances[k].players[key] = nil
				TriggerClientEvent('ethical-build:instance:remove', source)
				for kee, vaa in pairs(v.players) do
					TriggerClientEvent('ethical-build:instance:update', vaa, ActiveInstances[k])
				end
			end
		end
	end
end)

RegisterServerEvent('ethical-build:instance:create')
AddEventHandler('ethical-build:instance:create', function()
	for k, v in pairs(ActiveInstances) do
		if table.contains(v.players, source) then
			return
		end
	end
	local ins_id = #ActiveInstances+1
	table.insert(ActiveInstances, ins_id, {
		id = ins_id,
		players = {source},
		created = os.time()
	})
	TriggerClientEvent('ethical-build:instance:enter', source, ActiveInstances[ins_id])
end)

RegisterServerEvent('ethical-build:instance:enter')
AddEventHandler('ethical-build:instance:enter', function(id)
	for k, v in pairs(ActiveInstances) do
		if table.contains(v.players, source) then
			return
		end
	end
	
	if ActiveInstances[id] then
		table.insert(ActiveInstances[id].players, #ActiveInstances[id].players+1, source)
		
		for k,v in pairs(ActiveInstances[id].players) do 
			TriggerClientEvent('ethical-build:instance:update', v, ActiveInstances[id])
		end
		
		TriggerClientEvent('ethical-build:instance:enter', id, ActiveInstances[id])
	else
		return
	end
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end
