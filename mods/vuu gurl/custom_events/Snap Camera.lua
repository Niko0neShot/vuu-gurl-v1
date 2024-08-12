function onEvent(n,v1,v2)
	if n == 'Snap Camera' then
		instantSnapCam(v1, v2)
	end
end

function instantSnapCam(xval,yval)
	--psych alternative if you need it
	--[[
		setProperty('camFollowPos.x', xval)
		setProperty('camFollowPos.y', yval)
	]]
	snapCam(xval, yval)
	triggerEvent('Camera Follow Pos', xval, yval)

	local runningScripts = getRunningScripts('e')
	
	for i = 1,#runningScripts do
		if string.match(runningScripts[i], 'cameraFollow') then
			setProperty('followCharsObj.visible', false)
			runTimer('reenable', (stepCrochet*4)/1000)
		end
	end
end

function onTimerCompleted(t)
	if t == 'reenable' then
		setProperty('followCharsObj.visible', true)
	end
end