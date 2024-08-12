
--Camellia Rating made by beihu(北狐丶逐梦) https://b23.tv/gxqO0GH

combenum1 = 0
combenum2 = 0
combenum3 = 0
combenum4 = 0

judgement1 = 0
judgement2 = 0
judgement3 = 0
judgement4 = 0
judgement5 = 0

ratingnum = 0
color = '000000'

function onCreatePost()
setPropertyFromClass('ClientPrefs', 'comboStacking',false)

makeAnimatedLuaSprite('judgement', 'Rating/Judgement', getProperty('ratingx.alpha')*(10^5), getProperty('ratingy.alpha')*(10^5))
	scaleObject('judgement', 0.7, 0.7);
	addLuaSprite('judgement', false)
	setObjectCamera('judgement', 'hud')
    addAnimationByPrefix('judgement','1','marvelous',1, false)
    addAnimationByPrefix('judgement','2','sick',1, false)
    addAnimationByPrefix('judgement','3','good',1, false)
    addAnimationByPrefix('judgement','4','bad',1, false)
    addAnimationByPrefix('judgement','5','shit',1, false)
    addAnimationByPrefix('judgement','none','none',1, false)
    setProperty('judgement.alpha',0);
    
    makeAnimatedLuaSprite('combe1', 'Rating/Combe', getProperty('judgement.x')+80, getProperty('judgement.y')+100)
	scaleObject('combe1', 0.5, 0.5);
	addLuaSprite('combe1', false)
	setObjectCamera('combe1', 'hud')
    addAnimationByPrefix('combe1','0','num0',1, false)
    addAnimationByPrefix('combe1','1','num1',1, false)
    addAnimationByPrefix('combe1','2','num2',1, false)
    addAnimationByPrefix('combe1','3','num3',1, false)
    addAnimationByPrefix('combe1','4','num4',1, false)
    addAnimationByPrefix('combe1','5','num5',1, false)
    addAnimationByPrefix('combe1','6','num6',1, false)
    addAnimationByPrefix('combe1','7','num7',1, false)
    addAnimationByPrefix('combe1','8','num8',1, false)
    addAnimationByPrefix('combe1','9','num9',1, false)
    addAnimationByPrefix('combe1','none','none',1, false)
    setProperty('combe1.alpha',0);
    
    makeAnimatedLuaSprite('combe2', 'Rating/Combe', getProperty('judgement.x')+80-48, getProperty('judgement.y')+100)
	scaleObject('combe2', 0.5, 0.5);
	addLuaSprite('combe2', false)
	setObjectCamera('combe2', 'hud')
    addAnimationByPrefix('combe2','0','num0',1, false)
    addAnimationByPrefix('combe2','1','num1',1, false)
    addAnimationByPrefix('combe2','2','num2',1, false)
    addAnimationByPrefix('combe2','3','num3',1, false)
    addAnimationByPrefix('combe2','4','num4',1, false)
    addAnimationByPrefix('combe2','5','num5',1, false)
    addAnimationByPrefix('combe2','6','num6',1, false)
    addAnimationByPrefix('combe2','7','num7',1, false)
    addAnimationByPrefix('combe2','8','num8',1, false)
    addAnimationByPrefix('combe2','9','num9',1, false)
    addAnimationByPrefix('combe2','none','none',1, false)
    setProperty('combe2.alpha',0);
    
    makeAnimatedLuaSprite('combe3', 'Rating/Combe', getProperty('judgement.x')+80-48*2, getProperty('judgement.y')+100)
	scaleObject('combe3', 0.5, 0.5);
	addLuaSprite('combe3', false)
	setObjectCamera('combe3', 'hud')
    addAnimationByPrefix('combe3','0','num0',1, false)
    addAnimationByPrefix('combe3','1','num1',1, false)
    addAnimationByPrefix('combe3','2','num2',1, false)
    addAnimationByPrefix('combe3','3','num3',1, false)
    addAnimationByPrefix('combe3','4','num4',1, false)
    addAnimationByPrefix('combe3','5','num5',1, false)
    addAnimationByPrefix('combe3','6','num6',1, false)
    addAnimationByPrefix('combe3','7','num7',1, false)
    addAnimationByPrefix('combe3','8','num8',1, false)
    addAnimationByPrefix('combe3','9','num9',1, false)
    addAnimationByPrefix('combe3','none','none',1, false)
    setProperty('combe3.alpha',0);
    
    makeAnimatedLuaSprite('combe4', 'Rating/Combe', getProperty('judgement.x')+80-48*3, getProperty('judgement.y')+100)
	scaleObject('combe4', 0.5, 0.5);
	addLuaSprite('combe4', false)
	setObjectCamera('combe4', 'hud')
    addAnimationByPrefix('combe4','0','none',1, false)
    addAnimationByPrefix('combe4','1','num1',1, false)
    addAnimationByPrefix('combe4','2','num2',1, false)
    addAnimationByPrefix('combe4','3','num3',1, false)
    addAnimationByPrefix('combe4','4','num4',1, false)
    addAnimationByPrefix('combe4','5','num5',1, false)
    addAnimationByPrefix('combe4','6','num6',1, false)
    addAnimationByPrefix('combe4','7','num7',1, false)
    addAnimationByPrefix('combe4','8','num8',1, false)
    addAnimationByPrefix('combe4','9','num9',1, false)
    setProperty('combe4.alpha',0);
    
    makeLuaText('diffDisplay', "", 0, getProperty('judgement.x')+190, getProperty('judgement.y')+110);
    setTextSize('diffDisplay',20)
    setObjectCamera('diffDisplay', 'hud');
    addLuaText('diffDisplay')
    setTextBorder('diffDisplay', 1, '000000')
    setTextFont('diffDisplay', 'montserrat.ttf')
    setTextAlignment('diffDisplay', 'center')
   
    
    makeLuaText('judgementcounterwall', "Marvelous:\nSicks:\nGoods:\nBads:\nShits:\n", 0, 10, 300);
    setTextSize('judgementcounterwall',20)
    setObjectCamera('judgementcounterwall', 'hud');
    addLuaText('judgementcounterwall')
    setTextBorder('judgementcounterwall', 2, '000000')
    setTextFont('judgementcounterwall', '1.ttf')
    setTextAlignment('judgementcounterwall', 'left')
    
    makeLuaText('judgement1', "0", 0, 140, 300);
    setTextSize('judgement1',20)
    setObjectCamera('judgement1', 'hud');
    addLuaText('judgement1')
    setTextBorder('judgement1', 2, '000000')
    setTextFont('judgement1', '1.ttf')
    setTextAlignment('judgement1', 'left')
    
    makeLuaText('judgement2', "0", 0, 95, 300+18);
    setTextSize('judgement2',20)
    setObjectCamera('judgement2', 'hud');
    addLuaText('judgement2')
    setTextBorder('judgement2', 2, '000000')
    setTextFont('judgement2', '1.ttf')
    setTextAlignment('judgement2', 'left')
    
    makeLuaText('judgement3', "0", 0, 95, 300+18*2);
    setTextSize('judgement3',20)
    setObjectCamera('judgement3', 'hud');
    addLuaText('judgement3')
    setTextBorder('judgement3', 2, '000000')
    setTextFont('judgement3', '1.ttf')
    setTextAlignment('judgement3', 'left')
    
    makeLuaText('judgement4', "0", 0, 85, 300+18*3);
    setTextSize('judgement4',20)
    setObjectCamera('judgement4', 'hud');
    addLuaText('judgement4')
    setTextBorder('judgement4', 2, '000000')
    setTextFont('judgement4', '1.ttf')
    setTextAlignment('judgement4', 'left')
    
    makeLuaText('judgement5', "0", 0, 95, 300+18*4);
    setTextSize('judgement5',20)
    setObjectCamera('judgement5', 'hud');
    addLuaText('judgement5')
    setTextBorder('judgement5', 2, '000000')
    setTextFont('judgement5', '1.ttf')
    setTextAlignment('judgement5', 'left')
  
    end
    
function goodNoteHit(id,noteData,noteType,isSustainNote)

    local strumTime = getPropertyFromGroup('notes', id, 'strumTime')
    local songPos = getPropertyFromClass('Conductor', 'songPosition')
    local rOffset = getPropertyFromClass('ClientPrefs','ratingOffset')
    
    local diff = strumTime - songPos + rOffset;
    local msDiffStr = string.format("%.0fms", -diff)
    
     
    if not isSustainNote then
    
    combenum1 = combenum1 + 1
    
    if combenum1 >= 10 then 
    combenum1 = combenum1 - 10
    combenum2 = combenum2 + 1
    end
    
    if combenum2 >= 10 then 
    combenum2 = combenum2 - 10
    combenum3 = combenum3 + 1
    end
    
    if combenum3 >= 10 then 
    combenum3 = combenum3 - 10
    combenum4 = combenum4 + 1
    end
    
    
    scaleObject('combe1', 0.57, 0.57);
    scaleObject('combe2', 0.57, 0.57);
    scaleObject('combe3', 0.57, 0.57);
    scaleObject('combe4', 0.57, 0.57);
    
    doTweenX('combe1jump1','combe1.scale',0.5, 0.3, 'quadout')
    doTweenY('combe1jump2','combe1.scale',0.5, 0.3, 'quadout')
    
    doTweenX('combe2jump1','combe2.scale',0.5, 0.3, 'quadout')
    doTweenY('combe2jump2','combe2.scale',0.5, 0.3, 'quadout')
    
    doTweenX('combe3jump1','combe3.scale',0.5, 0.3, 'quadout')
    doTweenY('combe3jump2','combe3.scale',0.5, 0.3, 'quadout')
    
    doTweenX('combe4jump1','combe4.scale',0.5, 0.3, 'quadout')
    doTweenY('combe4jump2','combe4.scale',0.5, 0.3, 'quadout') 
    
    
    setTextString('diffDisplay', msDiffStr);
    
    
    runTimer('waitclose', 1, 1)
    
    scaleObject('judgement', 0.7, 0.7);
    doTweenX('Ratingjump1','judgement.scale',0.6, 0.3, 'quadout')
    doTweenY('Ratingjump2','judgement.scale',0.6, 0.3, 'quadout')
    
    scaleObject('diffDisplay', 1.5, 1.5);
    doTweenX('diffjump1','diffDisplay.scale',1, 0.3, 'quadout')
    doTweenY('diffjump2','diffDisplay.scale',1, 0.3, 'quadout')
    
    objectPlayAnimation("combe1",combenum1,true)
    objectPlayAnimation("combe2",combenum2,true)
    objectPlayAnimation("combe3",combenum3,true)
    objectPlayAnimation("combe4",combenum4,true)
    
   
    cancelTween('Ratingclose1')
    cancelTween('Ratingclose2')
    cancelTween('combe1close2')
    cancelTween('combe2close2')
    cancelTween('combe3close2')
    cancelTween('combe4close2')
    setProperty('judgement.alpha',1)
    setProperty('diffDisplay.alpha',1)
    setProperty('combe1.alpha',1);
    setProperty('combe2.alpha',1);
    setProperty('combe3.alpha',1);
    setProperty('combe4.alpha',1);

    end
    
    if getPropertyFromGroup('notes', id, 'rating') == 'marvelous'  then
    ratingnum = 1
    color = 'D76058'
    judgement1 = judgement1 + 1
    end
    
    if getPropertyFromGroup('notes', id, 'rating') == 'sick' then      
    ratingnum = 2
    color = 'FFFF00'
    judgement2 = judgement2 + 1
    end
    
    
    if getPropertyFromGroup('notes', id, 'rating') == 'good' then   
    ratingnum = 3 
    color = '1E90FF'   
    judgement3 = judgement3 + 1
    end
    
    
    if getPropertyFromGroup('notes', id, 'rating') == 'bad' then
    ratingnum = 4
    color = 'FFA500'
    judgement4 = judgement4 + 1
    end
    
    
    if getPropertyFromGroup('notes', id, 'rating') == 'shit' then
    ratingnum = 5
    color = '000000'
    judgement5 = judgement5 + 1
    if not botPlay then
    combenum1 = 0
    combenum2 = 0
    combenum3 = 0
    combenum4 = 0
    end
    end
    
    setTextString('judgement1', judgement1);
    setTextString('judgement2', judgement2);
    setTextString('judgement3', judgement3);
    setTextString('judgement4', judgement4);
    setTextString('judgement5', judgement5);
    if not isSustainNote then
    objectPlayAnimation("judgement",ratingnum,true)
    end
    setTextColor('diffDisplay',color)
    
    setProperty('combe1.color',getColorFromHex(color))
    setProperty('combe2.color',getColorFromHex(color))
    setProperty('combe3.color',getColorFromHex(color))
    setProperty('combe4.color',getColorFromHex(color))
    
    end
    
function noteMiss(id, direction, noteType, isSustainNote)
combenum1 = 0
combenum2 = 0
combenum3 = 0
combenum4 = 0
    objectPlayAnimation("combe1",'none',true)
    objectPlayAnimation("combe2",'none',true)
    objectPlayAnimation("combe3",'none',true)
    objectPlayAnimation("combe4",'0',true)
    objectPlayAnimation("judgement","none",true)
    setTextString('diffDisplay', "");
    end
    
    
function onTimerCompleted(tag, loops, loopsLeft)
	
	if tag == 'waitclose' then
	doTweenAlpha('Ratingclose1','judgement',0.000001, 0.3, 'quadout')
	doTweenAlpha('Ratingclose2','diffDisplay',0.000001, 0.3, 'quadout')
	doTweenAlpha('combe1close2','combe1',0.000001, 0.3, 'quadout')
	doTweenAlpha('combe2close2','combe2',0.000001, 0.3, 'quadout')
	doTweenAlpha('combe3close2','combe3',0.000001, 0.3, 'quadout')
	doTweenAlpha('combe4close2','combe4',0.000001, 0.3, 'quadout')
	end
	end