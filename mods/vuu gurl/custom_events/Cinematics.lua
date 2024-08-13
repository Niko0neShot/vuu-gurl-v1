-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

hudStuff = {'healthBarBG', 'healthBar', 'iconP1', 'iconP2', 'star1', 'star2', 'star3', 'star4', 'star5', 'healthbarSacorg'}

function onCreate()
	
	if getPropertyFromClass('flixel.FlxG', 'save.data.psychUI') == false then -- kade ui
		hudStuff = {'healthBarBG', 'healthBar', 'scoreTxt', 'iconP1', 'iconP2'}
	end

	--THE TOP BAR
	makeLuaSprite('UpperBar', '', 0, -200)
	makeGraphic('UpperBar', 1500, 200, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)

	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', '', 0, 730)
	makeGraphic('LowerBar', 1500, 200, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)
end

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		local start = tonumber(value1)
		local time = 0.2
		
		if value2 == '2' or start == 2 then
			time =  0.5
		end

		if value2 ~= "2" and value2 ~= "" then
			time = tonumber(value2)	
		end

		if start == 1 then
			if time == 0 then
				setProperty('UpperBar.x', -96)
				setProperty('LowerBar.x', 624)
				for i = 1, #hudStuff do
					setProperty(hudStuff[i]..'.alpha', 0)
				end
			else
				doTweenY('Cinematics1', 'UpperBar', -96, time, 'sineinout')
				doTweenY('Cinematics2', 'LowerBar', 624, time, 'sineinout')
				for i = 1, #hudStuff do
					doTweenAlpha('AlphaTween'..i, hudStuff[i], 0, time+0.05)
				end
			end
		end

		if start == 2 or value2 == '2' then
			if time == 0 then
				setProperty('UpperBar.x', -200)
				setProperty('LowerBar.x', 730)
				for i = 1, #hudStuff do
					setProperty(hudStuff[i]..'.alpha', 1)
				end
			else
				doTweenY('Cinematics1', 'UpperBar', -200, time, 'sineinout')
				doTweenY('Cinematics2', 'LowerBar', 730, time, 'sineinout')
				for i = 1, #hudStuff do
					doTweenAlpha('AlphaTween'..i, hudStuff[i], 1, time+0.05)
				end
			end
		end
	end
end
