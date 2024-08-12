function onEvent(n, v1, v2)
	if n == 'Alter Camera Bop' then
		local actualV1 = v1
		local actualV2 = v2

		if v1 == "" then
			actualV1 = 1
		end

		if v2 == "" then
			actualV2 = 4
		end

		local _intensity = tonumber(actualV1)
		local _interval = tonumber(actualV2)

		camBopIntensity = _intensity
		camBopInterval = _interval
	end
end

camBopIntensity = 1
camBopInterval = 4

function onBeatHit()
	-- it's more of extra zoom since i don't wanna mess with playstate
	if curBeat % camBopInterval == 0 then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * (camBopIntensity - 1))
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * (camBopIntensity - 1))
	end
end