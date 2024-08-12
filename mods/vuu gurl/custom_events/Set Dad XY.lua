function onEvent(n, v1, v2)
	if name == 'Set Dad XY' then
		x = tonumber(v1)
		y = tonumber(v2)
		if v1 ~= nil or v1 ~= '' then
			setCharacterX('dad', x)
		end
		if v2 ~= nil or v2 ~= '' then
			setCharacterY('dad', y)
		end
	end
end