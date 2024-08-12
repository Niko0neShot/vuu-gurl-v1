function onEvent(n,v1,v2)
	if n == 'Play Sound' then
		local sound = "nogood"
		local vol = 1
	
		if v1 ~= "" then
			sound = v1
		end
	
		if v2 ~= "" then
			vol = v2
		end

		playSound(sound, vol)
	end
end