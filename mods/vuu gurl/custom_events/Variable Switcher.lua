function onEvent(n, v1, v2)
	if name == 'Variable Switcher' then
		variable = tonumber(v1)
		switch = tonumber(v2)
		if (v1 ~= nil or v1 ~= '') and (v2 ~= nil or v2 ~= '') then
			variable = switch
		end
	end
end -- this probably doesn't work