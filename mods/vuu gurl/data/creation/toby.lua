-- 1150 500
function onStepHit()
    if curStep >= 1487 then
        doTweenY('toby', 'gf', 600, 0.2, 'linear')
    end
    if curStep >= 1488 then
	makeLuaSprite('toby!', 'empty', 0, 0);
	makeGraphic('toby!', 1280, 750, '000000');
	setObjectCamera('toby!', 'other');
	addLuaSprite('toby!', false); 
    end
    if curStep >= 1490 then 
        doTweenX('toby', 'gf', 1150, 0.1, 'linear')
    end
    if curStep >= 1507 then 
        removeLuaSprite('toby!', false)
    end
    if curStep >= 2027 then
	makeLuaSprite('uhh', 'empty', 0, 0);
	makeGraphic('uhh', 1280, 750, '000000');
	setObjectCamera('uhh', 'other');
	addLuaSprite('uhh', false); 
    end
    if curStep >= 2041 then 
        removeLuaSprite('uhh', false)
    end
		
end