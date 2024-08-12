function onEvent(name,value1,value2)
    if name == "Set Object Color" then
		local color = ''
		if not (string.match(value2, '0xFF')) then
			color = '0xFF'..value2
		end
		
		if value1 == 'healthbarOpponent' then
			updateHealthbar(color:sub(3), '')
		elseif value1 == 'healthbarPlayer' then
			updateHealthbar('', color:sub(3))
		else
			setProperty(value1..'.color', getColorFromHex(color))

			if getProperty(value1..'.curCharacter') ~= value1..'.curCharacter' then -- checks for characters
				setProperty(value1..'.curColor', getColorFromHex(color))
			end
		end
    end
end