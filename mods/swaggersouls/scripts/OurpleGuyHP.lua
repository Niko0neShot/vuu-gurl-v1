--HUD recreado (o como se diga xd) por zDonMasterz
--Masomenos basado en el HUD del rerun de nickobelit (no me pegues)

local gfSpeed = 1;

function onCreatePost()
    setProperty('healthBarBG.visible', false);
end

function onCreate()
	makeLuaSprite('healthbarSacorg', 'healthbarSacorg')
	setObjectCamera('healthbarSacorg', 'hud')
	addLuaSprite('healthbarSacorg', true)
	setObjectOrder('healthbarSacorg', getObjectOrder('healthBarGroup') + 1)
	scaleObject('healthbarSacorg', 1, 1)
	makeLuaSprite('timevloo', 'timevloo')
	setObjectCamera('timevloo', 'hud')
	addLuaSprite('timevloo', true)
	setObjectOrder('timevloo', getObjectOrder('timeBar') + 1)
	scaleObject('timevloo', 1, 1)
    setProperty('timevloo.alpha', 0)
end

function onUpdate()

    if (getProperty('iconP1.angle') >= 0) then
	    if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')-1);
    	end
    else
        if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')+1);
    	end
    end

    if (getProperty('iconP2.angle') >= 0) then
	    if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')-1);
    	end
    else
        if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')+1);
    	end
    end

end

function onUpdatePost(elapsed)
if not downscroll then
    setProperty('iconP1.x', 880)
    setProperty('iconP1.y', 565)
    setProperty('iconP2.x', 230)
    setProperty('iconP2.y', 565)
end
if downscroll then
    setProperty('iconP1.x', 880)
    setProperty('iconP1.y', 10)
    setProperty('iconP2.x', 230)
    setProperty('iconP2.y', 10)
end
	setProperty('healthbarSacorg.x', getProperty('healthBar.x') - 110)
	setProperty('healthbarSacorg.y', getProperty('healthBar.y') - 46)
end

function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end

function onBeatHit()

	if (curBeat % gfSpeed == 0) then
		if curBeat % (gfSpeed * 2) == 0 then
			setProperty('iconP1.scale.x', 0.8 );
			setProperty('iconP1.scale.y', 0.8 );
			setProperty('iconP2.scale.x', 1.2 );
			setProperty('iconP2.scale.y', 1.3 );

			setProperty('iconP1.angle', -15);
			setProperty('iconP2.angle', 15);
		else
			setProperty('iconP1.scale.x', 1.2 );
			setProperty('iconP1.scale.y', 1.3 );
			setProperty('iconP2.scale.x', 0.8 );
			setProperty('iconP2.scale.y', 0.8 );

			setProperty('iconP2.angle', -15);
			setProperty('iconP1.angle', 15);
		end

	end

end