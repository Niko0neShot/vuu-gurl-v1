function onCreatePost()
   -- addHaxeLibrary("Array", "")
    shaderCoordFix();
    runHaxeCode([[
        game.initLuaShader('cyclesd');
        shader0 = game.createRuntimeShader('cyclesd');
        var filters = [];

        if (game.camGame._filters != null){
            filters = game.camGame._filters;
        }

        filters.push(new ShaderFilter(shader0));
        game.camGame.setFilters(filters);
    ]]);
end

function onEvent(n, v1, v2)
    if n == 'Cycles Distortion' then
        local v1 = splitString(v1, ',');
        local v2 = splitString(v2, ',');

        doTweenShaderFloat(v1[1], tonumber(v2[1]), tonumber(v2[2]), v1[2]);
      --  setPropertyFromGroup("luaDebugGroup", 1, "size", 10)
    end
end

function splitString (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr){
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        fixShaderCoordFix = function(?_){
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]]);
end

function doTweenShaderFloat(floatName, newFloat, duration, ease)
    runHaxeCode([[
        FlxTween.num(getVar(']]..floatName..[['), ]]..newFloat..[[, ]]..duration..[[, {ease: FlxEase.]]..ease..[[},
        function(num){
            shader0.setFloat(']]..floatName..[[', num); setVar(']]..floatName..[[', num);
        });
    ]]);
end