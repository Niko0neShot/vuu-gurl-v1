function onCreate()
	initLuaShader('impostorcolor')

	makeLuaSprite('pinkVignette2', 'backgrounds/impostor/mira/vignette2', 0, 0)
	setObjectCamera('pinkVignette2', 'hud')
	setProperty('pinkVignette2.alpha', 0)
	--setBlendMode('pinkVignette2', 'add')
	addLuaSprite('pinkVignette2', false)

	makeLuaSprite('pinkVignette', 'backgrounds/impostor/mira/vignette', 0, 0)
	setObjectCamera('pinkVignette', 'hud')
	setProperty('pinkVignette.alpha', 0)
	setBlendMode('pinkVignette', 'add')
	addLuaSprite('pinkVignette', false)

	makeAnimatedLuaSprite('heartsImage', 'backgrounds/impostor/mira/hearts', -25, 0)
	setObjectCamera('heartsImage', 'other')
	addAnimationByPrefix('heartsImage', 'boil', 'Symbol 2', 24, true)
	objectPlayAnimation('heartsImage', 'boil', true)
	setProperty('heartsImage.alpha', 0)
	setSpriteShader('heartsImage', 'impostorcolor')
	setShaderFloat('heartsImage', 'amount', 0)
	addLuaSprite('heartsImage', false)

	makeLuaSprite('heartColorShader', '', 0, 0)

	for i = 0,10 do
		makeAnimatedLuaSprite('littlehearts'..i, 'backgrounds/impostor/mira/littleheart', 0, 1000)
		addAnimationByPrefix('littlehearts'..i, 'littleheart', 'littleheart', 24, true)
		setProperty('littlehearts'..i..'.animation.curAnim.curFrame', getRandomInt(0,2))
		playAnim('littlehearts'..i, 'littleheart')
		setObjectCamera('littlehearts'..i,'hud')
		setSpriteShader('littlehearts'..i, 'impostorcolor')
		setObjectOrder('littlehearts'..i,getObjectOrder('camHUD')-1)
		setShaderFloat('littlehearts'..i, 'amount', 0)
		setProperty('littlehearts'..i..'.alpha', 0)
		addLuaSprite('littlehearts'..i)		
	end

	daWidth = getPropertyFromClass('flixel.FlxG', 'width')
end

pinkCanPulse = false
daWidth = 0

function onUpdate()
	if getShaderFloat('heartsImage', 'amount') ~= getProperty('heartColorShader.x') then
		setShaderFloat('heartsImage', 'amount', getProperty('heartColorShader.x'))
	end

	if pinkCanPulse == true then
		for i = 0,10 do
			if getProperty('littlehearts'..i..'.y') < -100 then
				setProperty('littlehearts'..i..'.x', getRandomInt(-50, daWidth + 50))
				setProperty('littlehearts'..i..'.y', getProperty('littlehearts'..i..'.y'))
				setProperty('littlehearts'..i..'.y', 1000)
			end
		end
	end
end

function onEvent(n, v1, v2)
	if n == 'pink toggle' then
		if pinkCanPulse == false then
			pinkCanPulse = true
			setProperty('heartsImage.alpha', 1)
			setProperty('pinkVignette.alpha', 1)
			setProperty('pinkVignette2.alpha', 0.3)

			local fadeTime = tonumber(v1)*1.2

			setProperty('heartColorShader.x', 1)
			doTweenX('heartsfade', 'heartColorShader', 0, fadeTime, 'cubeinout')

			for i = 0,10 do
				setProperty('littlehearts'..i..'.alpha', 1)
				setProperty('littlehearts'..i..'.x', getRandomInt(-50, daWidth + 50))
				setProperty('littlehearts'..i..'.y', getProperty('littlehearts'..i..'.y') - getRandomInt(0, 100))
				setProperty('littlehearts'..i..'.velocity.x', getRandomInt(-50, 50))
				setProperty('littlehearts'..i..'.velocity.y', getRandomInt(-800, -400))
			end
			return
		else
			cancelTween('vignetteTween')
			cancelTween('whiteTween')

			setProperty('heartsImage.alpha', 1)
			setProperty('pinkVignette.alpha', 1)
			setProperty('pinkVignette2.alpha', 0.4)

			local fadeTime = tonumber(v1)*2

			setProperty('heartColorShader.x', 1)

			doTweenX('heartsfade', 'heartColorShader', 0, fadeTime, 'cubeinout')

			local other = {'heartsImage', 'pinkVignette', 'pinkVignette2'}

			for i = 1, #other do
				doTweenAlpha(other[i]..'fade', other[i], 0, fadeTime, 'cubeinout')
			end

			pinkCanPulse = false
			return
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 1 and pinkCanPulse then
		setProperty('pinkVignette.alpha', 1)
		doTweenAlpha('vignetteTween', 'pinkVignette', 0.2, 1.2, 'sineout')
		setProperty('heartColorShader.x', 0.5)
		doTweenX('whiteTween', 'heartColorShader', 0, 0.75, 'sineout')	
	end
end