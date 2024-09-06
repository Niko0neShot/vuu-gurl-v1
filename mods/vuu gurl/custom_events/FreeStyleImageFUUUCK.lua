local ability = true

function onCreatePost()
	precacheImage('solo_time')
        precacheSound("spray_sound")
        --precacheSound("fuckmyass")
end

function onEvent(name, value1, value2)
	if name == "FreeStyleImageFUUUCK" and ability == true then
	    makeAnimatedLuaSprite('image', 'solo_time', 0, 0);
	    scaleObject('image', 0.8, 0.8)
	    setLuaSpriteScrollFactor('image',1, 1)
            setObjectCamera('image', 'hud')
	    addAnimationByPrefix('image', 'anim', 'solo_time', 24, false)
            screenCenter('image')
            addLuaSprite('image', true);

            objectPlayAnimation('image', 'anim', true)
            --playSound("fuckmyass")
            playSound("spray_sound")
            ability = false
	end
end

function onUpdate(elapsed)
	if getProperty('image.animation.curAnim.finished') == true and getProperty('image.animation.curAnim.name') == 'anim' then
              removeLuaSprite('image', true) 
              ability = true
	end
end