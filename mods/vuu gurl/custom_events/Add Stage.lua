function onEvent(n, v1, v2)
	if name == 'Add Stage' then
		stage = tonumber(v1)
		if v1 ~= nil or v1 ~= '' then
			addLuaScript('stages/'..stage)
		end
	end
end