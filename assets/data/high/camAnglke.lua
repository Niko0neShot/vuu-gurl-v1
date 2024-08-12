function onUpdate()
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(curBpm/120)
    doTweenAngle('sus2', 'camHUD', 0.6*math.cos((currentBeat+0.1*2)*math.pi), 0.00001)
    doTweenAngle('sus2', 'camGame', 0.6*math.cos((currentBeat+0.1*2)*math.pi), 0.00001)
end
function onUpdatePost(elapsed)
    runHaxeCode([[
        FlxG.camera.followLerp =  0.01;
    ]])

end
