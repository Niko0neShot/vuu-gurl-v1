function onEvent(n, v1, v2)
	if name == 'Set BF XY' then
		x = tonumber(v1)
		y = tonumber(v2)
		if v1 ~= nil or v1 ~= '' then
			setCharacterX('boyfriend', x)
		end
		if v2 ~= nil or v2 ~= '' then
			setCharacterY('boyfriend', y)
		end
	end
end