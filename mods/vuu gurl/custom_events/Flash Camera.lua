function onEvent(n,v1,v2)
	if n == 'Flash Camera' then
		local cam = "camGame"
		local color = "FFFFFF"
		local duriation = "1"

		if v1 ~= "" then
			cam = v1
		end

		if v2 ~= "" then
			color = v2
		end

		if v3 ~= "" then
			duriation = v3
		end
		
		cameraFlash(cam, color, duriation, true)
	end
end