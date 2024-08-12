function onEvent(n, v1, v2)
    if n == 'Rocket Warning' then
        local beeps = tonumber(v2)

        curNote = v1

        setProperty('targ.x',  getPropertyFromGroup('strumLineNotes', curNote, 'x'))
        setProperty('expl.x',  getPropertyFromGroup('strumLineNotes', curNote, 'x') - 196)

        objectPlayAnimation('targ', 'idle', true)
        setProperty('targ.alpha', 1)

        if getPropertyFromClass('flixel.FlxG', 'save.data.downscroll') == true and getProperty('targ.y') ~= getPropertyFromClass('flixel.FlxG', 'height') - 165 then -- thanks sawbutt.
            setProperty('targ.y', getPropertyFromClass('flixel.FlxG', 'height') - 165)
            setProperty('expl.y', getProperty('targ.y') - 160)
        elseif getPropertyFromClass('flixel.FlxG', 'save.data.downscroll') == false and getProperty('targ.y') ~= 50 then
            setProperty('targ.y',  50)
            setProperty('expl.y',  -110)
        end
      
        fired = false
        stepArray = {}

        local daStep = curStep
        
        if daStep % 2 ~= 0 then
            daStep = daStep + 1
        end
        
        if beeps == 2 then
            stepArray = {2,4}
        elseif beeps == 3 then
            stepArray = {4,6,8}
        elseif beeps == 4 then
            stepArray = {4,8,10,12}
        else
            stepArray = {4,8,10,12,14,16}
        end

        for i = 1,#stepArray do
            stepArray[i] = stepArray[i]+daStep
        end

        fireDelay = roundNumber(160/stepCrochet)
    end
end

stepArray = {}
fired = true
fireDelay = 4
curNote = 0

function roundNumber(num)
    local number = num + 0.5
    return math.floor(number)
end

function onStepHit()

    if fired == false then
        for i = 1,#stepArray do
            if i < #stepArray then
                if curStep == stepArray[i] then
                    objectPlayAnimation('targ', 'idle', true)
                end
            else
                if curStep == stepArray[i] - fireDelay then -- play the animation early
                    if string.gmatch(getProperty('dad.curCharacter'), 'tord-in-bot') and getProperty('dad.animation.curAnim.name') ~= 'singDOWN-alt' then
                        triggerEvent('Play Animation', 'singDOWN-alt', 'dad')
                    end
                    fired = true
                end
            end
        end
    end
    
end