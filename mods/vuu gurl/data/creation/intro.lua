function onStepHit()
	if curStep == 59 then
	doTweenAlpha('fadeOut', 'intro2', 0, 1.0, 'cubeInOut')
	end
	if curStep == 128 then
		removeLuaSprite('intro', false)
	end
end