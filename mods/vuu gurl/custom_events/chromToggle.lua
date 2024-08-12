
local shaderName = "impostorchromaticabberation"
function onCreate()
    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite(shaderName)
    makeGraphic("shaderImage", screenWidth, screenHeight)

   setSpriteShader("shaderImage", shaderName)
   
    makeLuaSprite("chromAmountObject")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);

        var camGameFilters = [];

        if (game.camGame._filters != null){
            camGameFilters = game.camGame._filters;
        }

        camGameFilters.push(new ShaderFilter(shader0));

        game.camGame.setFilters(camGameFilters);
        game.getLuaObject(shaderName).shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        //game.camHUD.setFilters([new ShaderFilter(game.getLuaObject(shaderName).shader)]);
        return;
    ]])

    setShaderFloat(shaderName, "amount", -0.5)
end

isChrom = false
chromAmount = 0
chromFreq = 0

function onEvent(n, v1, v2)
    if n == 'chromToggle' then
        local amount = tonumber(v1)
        local freq = tonumber(v2)

        if amount ~= 0 then
            isChrom = true
            chromAmount = amount
            chromFreq = freq
        else
            isChrom = true
            chromAmount = 0
            return
        end
    end
end

function onUpdate()
    setShaderFloat(shaderName, "amount", getProperty('chromAmountObject.x'))
end

function onBeatHit()
    if(curBeat % chromFreq == 0) then
        setProperty('chromAmountObject.x', chromAmount)
        doTweenX('chromTween', 'chromAmountObject', 0, 0.45, 'sineinout')
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end