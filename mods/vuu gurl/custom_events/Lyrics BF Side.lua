-- Event notes hooks
function onCreate()
    makeLuaText('yappin', 'Lyrics go here!', 900, 200, 650)
    setObjectCamera("yappin", 'hud');
    setTextFont('yappin', 'vcr.ttf')
    setTextColor('yappin', '0xffffff')
    setTextSize('yappin', 50);
    addLuaText('yappin')
    setProperty('yappin.visible', false)
end

function onEvent(name, value1, value2)
    if name == "Lyrics BF Side" then
        local var string = (value1)
        local var length = tonumber(0 + value2)

        setTextString('yappin',  "" .. string)
        setTextAlignment('yappin', 'center')
        setProperty('yappin.visible', true)
        runTimer('lyricalTho', length, 1) 

        triggerEvent("Lyrics BF Side Post", value1, value2)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'lyricalTho' then
        setProperty('yappin.visible', false)
    end
end