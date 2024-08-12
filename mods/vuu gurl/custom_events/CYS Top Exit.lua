function onEvent(n, v1, v2)
	if n == 'CYS Top Exit' then
		local info = {}
		for val in string.gmatch(v1, "[^%s]+") do
			table.insert(info, val)	
		end

		local top = info[1]
		local char = info[2]

		if char == 'bf' then
			char = 'boyfriend'
		end

		if v2 == "up" then
			doTweenY(top..'leaving', top, getProperty(top..'.y') - 1100, 0.2, 'quadinout')
			doTweenY(char..'leaving', char, getProperty(char..'.y') - 1100, 0.2, 'quadinout')
		elseif v2 == 'down' then
			doTweenY(top..'leaving', top, getProperty(top..'.y') + 1100, 0.2, 'quadinout')
			doTweenY(char..'leaving', char, getProperty(char..'.y') + 1100, 0.2, 'quadinout')
		elseif v2 == 'left' then
			doTweenX(top..'leaving', top, getProperty(top..'.x') - 2000, 0.2, 'quadinout')
			doTweenX(char..'leaving', char, getProperty(char..'.x') - 2000, 0.2, 'quadinout')
		else
			doTweenX(top..'leaving', top, getProperty(top..'.x') + 2000, 0.2, 'quadinout')
			doTweenX(char..'leaving', char, getProperty(char..'.x') + 2000, 0.2, 'quadinout')
		end
	end
end