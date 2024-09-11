function onCreate()
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('Image','lime.graphics')
    addHaxeLibrary('ClientPrefs')
    createUi()

end
local savedOPTex
local savedPLTex

function onCreate()
    makeLuaSprite('border','overlay',0,0)
    addLuaSprite('border',false)
    setObjectCamera('border','hud')
end
function onCreatePost()
    checkCharacter()
    setProperty('camZoomingMult',1.2)
    setProperty('camZoomingDecay',2)
    runHaxeCode([[
        for (i in 0...4) game.strumLineNotes.members[i].x += 50;
        for (i in 4...8) game.strumLineNotes.members[i].x -= 50;
        for (note in game.unspawnNotes) 
        {
            if (note.isSustainNote)
            {
                note.cameras = [game.camHUD];
            }
        };


	game.healthBarGroup.scale -= 0.1;
    ]])

    local size = getPropertyFromGroup('strumLineNotes',0,'scale.x') - 0.09;

    for i = 0,8 do
        setPropertyFromGroup('strumLineNotes',i,'x',(getPropertyFromGroup('strumLineNotes',i,'x') / 1.12) + 40);

        setPropertyFromGroup('strumLineNotes',i,'scale.x',size);
        setPropertyFromGroup('strumLineNotes',i,'scale.y',size);
    end

    for n = 0,getProperty('unspawnNotes.length') - 1 do
        setPropertyFromGroup('unspawnNotes',n,'scale.x',size);
        setPropertyFromGroup('unspawnNotes',n,'scale.y',size);
    end
end
function onUpdate(elapsed)
    setTextString('timeTxt', '('..formatTime(songLength - (getSongPosition() - noteOffset))..')')
    setProperty('camHUD.zoom', lerp(getProperty('camHUD.zoom'), -0.5, elapsed))
end 
function onEvent(n,v1,v2)
    if n == 'Change Character' then
        checkCharacter()
    end
end
--- functions
local disableSkin = false
function checkCharacter()
    local texStrumsOP
    local texStrumsPL
    if week == 'Camellia' or week:find('HoloFunk') then
        if boyfriendName == 'bf' then
            texStrumsPL = 'NOTE_assets'
            texSplashPL = 'noteSplashes'
        else
            texStrumsPL = 'notes/HOLONOTE_assets'
            texSplashPL = 'splashes/holoSplashes'
        end
        if dadName == 'bobmellia' then
            texStrumsOP = 'NOTE_assets'
        elseif dadName:find('camellia') then
            texStrumsOP = 'notes/Stepmania'
        else
            texStrumsOP = 'notes/HOLONOTE_assets'
        end
    else
        disableSkin = true
    end
    for i = 0,3 do
        if not disableSkin then
        setPropertyFromGroup('playerStrums', i, 'texture', texStrumsPL)
        setPropertyFromGroup('opponentStrums', i, 'texture', texStrumsOP)
        end
    end
    for i = 0,getProperty('unspawnNotes.length') - 1 do
        local nt = getPropertyFromGroup('unspawnNotes', i, 'noteType')
        local mp = getPropertyFromGroup('unspawnNotes', i, 'mustPress')
        local sus = getPropertyFromGroup('unspawnNotes', i, 'isSustainNote')
        if not disableSkin then
            if mp then
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', texSplashPL)
            end
        end
    end
    savedOPTex = texStrumsOP
    savedPLTex = texStrumsPL
    savedSplashPLTex = texSplashPL
end
function math.lerp(a, b, t)
	return a + t * (b - a);
end
function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)
    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end
function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end