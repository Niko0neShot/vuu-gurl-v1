local updateShit = false
local songDifficulty = ''
function onCreatePost()
    --makeLuaText("GAY", "hi", 1000, (220) - (220 / 2), getProperty("healthBarBG.y") + (dS and -42 or 42))
    --setTextAlignment("GAY", "center")
    --setTextSize('GAY', 17)
    --setTextBorder('GAY', 1, '000000')
    setProperty('scoreTxt.y', 50)
    setProperty('scoreTxt.x', 110)
    setTextSize('scoreTxt', 18)
    setTextBorder('scoreTxt', 1, '000000')
    setScrollFactor("GAY", 0, 0)
    setObjectCamera("GAY", "hud")
    --addLuaText("GAY", true)

end
function onUpdatePost()
    if getPropertyFromClass("grafex.util.ClientPrefs", "classicScoreTxt", true) then
        setTextString('scoreTxt', '~ SCORE ~\n[ ' .. score .. ' ]')
    else
        setTextString('scoreTxt', '~ SCORE ~\n[ ' .. score .. ' ]')
    end
	setProperty('popUpComboScore', false, false)
end
function rankLetters(accuracy)
	if accuracy == 100 then
		return 'S+'
	elseif accuracy > 99 then
		return 'S'
	elseif accuracy > 91 then
		return 'A+'
	elseif accuracy > 81 then
		return 'A'
	elseif accuracy > 71 then
		return 'B'
	elseif accuracy > 61 then
		return 'C'
	elseif accuracy > 51 then
		return 'D'
	elseif accuracy > 31 then
		return 'E' 
	else
		return 'F'
	end
end
function floorInDecimal(number, decimals)
    return math.floor(number * (10^decimals)) / (10^decimals)
end
function math.lerp(a,b,t)
    return(b-a) * t + a;
end
function math.remapToRange(value,start1,stop1,start2,stop2)
    return start2 + (stop2 - start2) * ((value - start1)/(stop1 - start1))
end