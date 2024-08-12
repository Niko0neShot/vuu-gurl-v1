function onCreate()
	makeAnimatedLuaSprite('pressspace', 'backgrounds/sonic/exe/spacebar_icon', 0, 0)
    scaleObject('pressspace', 0.5, 0.5)
    addAnimationByPrefix('pressspace', 'press', 'spacebar', 24, false)
    setObjectCamera('pressspace', 'other')
    screenCenter('pressspace')
    setProperty('pressspace.x', getProperty('pressspace.x') - 42)
    setProperty('pressspace.alpha', 0)
    addLuaSprite('pressspace', true)
end

function onEvent(n, v1, v2)
	if n == 'Fleetway Space Warning' then
		local duration = stepCrochet*4/1000
		local ease = 'cubeinout'

		if v1 ~= "" then
			duration = tonumber(v1)
		end

		if v2 ~= "" then
			ease = v2
		end
		cancelTween('pressspacetween2')
		setProperty('pressspace.alpha', 1)
		doTweenAlpha('pressspacetween2', 'pressspace', 0, duration, ease)
	end
end
