function onCreate()
	makeLuaSprite('genesistransition', '', 0, 0)
	makeGraphic('genesistransition', 10, 10, 'FFFFFF')
	scaleObject('genesistransition', 300, 300)
	setProperty('genesistransition.alpha', 0)
	--setObjectOrder('genesistransition', getObjectOrder('strumLine') - 1)
	setProperty('genesistransition.color', getColorFromHex('FF0000'))
	setObjectCamera('genesistransition', 'other')
	addLuaSprite('genesistransition')
	setBlendMode('genesistransition', 'screen')
end

time = 0

function onEvent(n, v1, v2)
	if n == 'Genesis Transition' then
		time = tonumber(v2)

		if v1 == 'in' then
			stopSound('warpsound')
			playSound('warpsound', 0.5)
			tweenColor('genesistransition', time, getColorFromHex('FF0000'), getColorFromHex('FFD800'))
			runTimer('colorTween', time)
			setProperty('genesistransition.alpha', 0.4)
		end
	
		if v1 == 'out' then
			doTweenAlpha('whatever', 'genesistransition', 0, time*4)
			tweenColor('genesistransition', time, getColorFromHex('FFFFFF'), getColorFromHex('FFD800'))
			runTimer('reverseColorTween', time)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'colorTween' then
		tweenColor('genesistransition', time, getColorFromHex('FFD800'), getColorFromHex('FFFFFF'))
	end

	if tag == 'reverseColorTween' then
		tweenColor('genesistransition', time, getColorFromHex('FFD800'), getColorFromHex('FF0000'))
	end
end