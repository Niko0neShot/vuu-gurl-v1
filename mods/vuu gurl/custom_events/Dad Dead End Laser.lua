function onCreate()
	makeAnimatedLuaSprite('dadlaser', 'backgrounds/jimmy/deadend/dadlaser', -400, 10)
	addAnimationByPrefix('dadlaser', 'laser', 'ddlaser', 24, false)
	setProperty('dadlaser.visible', false)
	addLuaSprite('dadlaser', true)
end

firingLaser = false
currentlyActive = 0

function onEvent(n, v1, v2)
	if n == 'Dad Dead End Laser' then
		currentlyActive = currentlyActive + 1

		if currentlyActive < 2 then -- so that skip time doesn't kick your ass
			firingLaser = true
			setProperty('dadlaser.visible', true)
			playSound('dadlaser', 0.7)
			triggerEvent("Play Animation", 'laser', "dad")
			objectPlayAnimation('dadlaser', 'laser',  true)

			cameraFlash('hud', '0xBBFF0000', 1, true)		
			runTimer('die', 0.2)

			local changeTimer = 0.5 

			if v1 ~= "" and v1 ~= nil then
				changeTimer = tonumber(v1)
			end

			runTimer("changeback dad", changeTimer)

			if v2 == "" or v2 == nil then
				zoomEnabled = true
			else
				zoomEnabled = false
			end
		end
	end
end

changeTimer = 0.5
zoomEnabled = true

function onUpdate()
	if ((keyJustPressed('space') or getPropertyFromClass('flixel.FlxG', 'save.data.botplay')) and firingLaser) then
		if zoomEnabled then
			setProperty('defaultCamZoom', 1)
		end

		currentlyActive = 0
		firingLaser = false
		triggerEvent("Play Animation", 'dodge', "boyfriend")
		cancelTimer('die')
		
		runTimer('changeback', 0.5)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'die' then
		currentlyActive = 0
		firingLaser = false
		setProperty('health', getProperty('health') - 0.5)
	end

	if tag == 'changeback dad' then
		setProperty('dad.specialAnim', false)
	end

	if tag == 'changeback' then
		setProperty('boyfriend.specialAnim', false)
	end
end
