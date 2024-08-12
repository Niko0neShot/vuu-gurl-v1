function onEvent(n, v1, v2)
	if name == 'Set GF XY' then
		x = tonumber(v1)
		y = tonumber(v2)
		if v1 ~= nil or v1 ~= '' then
			setCharacterX('gf', x)
		end
		if v2 ~= nil or v2 ~= '' then
			setCharacterY('gf', y)
		end
	end
end