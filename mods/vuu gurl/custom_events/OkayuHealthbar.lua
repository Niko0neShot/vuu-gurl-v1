function onCreate()
    makeAnimatedLuaSprite('PixelOkayu','mechanics/PixelOkayu',900,560)
    addAnimationByPrefix('PixelOkayu','eat','PixelOkayu eat',10,true)
    scaleObject('PixelOkayu',5,5)
    setObjectCamera('PixelOkayu','camHUD')
    setProperty('PixelOkayu.antialiasing',false)
    addLuaSprite('PixelOkayu')

end
function onEvent(n,v1,v2)
   if n == 'OkayuHealthbar' then
        eat(75)
   end
end

function eat(health)
    setHealth(2)
    local value = 350
    local time = 15
    doTweenX('eatYou','PixelOkayu',450,time)
    runHaxeCode([[
        game.modchartTweens.set('frame1Gone', FlxTween.tween(game.getLuaObject('UI_Health_Frame')._frame.frame, {width: ]]..value..[[}, ]]..time..[[, {ease: FlxEase.linear, onComplete: function(){
            game.modchartTweens.remove('frame1Gone');
            game.callOnLuas('onTweenCompleted', ['frame1Gone']);
        }}));
        game.modchartTweens.set('frame2Gone', FlxTween.tween(game.getLuaObject('UI_Health_RIGHT')._frame.frame, {width: ]]..value..[[}, ]]..time..[[, {ease: FlxEase.linear, onComplete: function(){
            game.modchartTweens.remove('frame2Gone');
            game.callOnLuas('onTweenCompleted', ['frame2Gone']);
        }}));
    ]])
end