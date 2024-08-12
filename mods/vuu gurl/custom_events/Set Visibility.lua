function onEvent(n, v1, v2)
	if name == 'Set Visibility' then
		obj = tonumber(v1)
		switch = tonumber(v2)
		if (v1 ~= nil or v1 ~= '') and (v2 ~= nil or v2 ~= '') then
			setProperty(obj..'.visible', switch)
		end
	end
end