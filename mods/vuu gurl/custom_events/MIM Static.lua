function onEvent(name,value1,value2)

    if name == "MIM Static" then
		doTweenAlpha('twnStatIn', 'mariostatic', 1, (stepCrochet*value1)/1000, 'sineIn')
		doTweenAlpha('twnGraphIn', 'white', 1, (stepCrochet*value1)/1000+0.25, 'sineIn')
		objectPlayAnimation('mariostatic', 'e', true)
		runTimer('delay', (stepCrochet*(value1+8))/1000)
    end
end

function onCreate()
	makeLuaSprite('white', nil, 0, 0)
	makeGraphic('white', screenWidth, screenHeight, 'DBDBDB')
	addLuaSprite('white', false)
	setProperty('white.alpha', 0)
	setObjectOrder('white', getObjectOrder('strumLineNotes')-1)
	setObjectCamera('white', 'camHUD')

	makeAnimatedLuaSprite('mariostatic', 'backgrounds/mario/mariomix/power-glitch', -20, -20)
	addAnimationByPrefix('mariostatic', 'e', 'SMW-Crash-Compilation-Powerup-In_', 24*(bpm/120), true)
	addLuaSprite('mariostatic', true)
	setObjectCamera('mariostatic', 'camHUD')
	setObjectOrder('mariostatic', getObjectOrder('white')+1)
	scaleObject('mariostatic', 4.5, 4.5)
	setProperty('mariostatic.antialiasing', false)
	setProperty('mariostatic.alpha', 0)
end

function onSectionHit()
	if getProperty('mariostatic.animation.curAnim.frameRate') ~= 24*(curBpm/120) then
		setProperty('mariostatic.animation.curAnim.frameRate', 24*(curBpm/120))
	end
end

function onTimerCompleted(t, l, ll)
	if t == 'delay' then
		setProperty('mariostatic.alpha', 0)
		setProperty('white.alpha', 0)
		cameraFlash('other', '0xAFFF0000', 1)
	end
end