function onCreate()
	triggerEvent("PlayAsDad", "true")
end

local PlayerIsDad = 0
function onEvent(name, value1, value2)
	if name == 'PlayAsDad' then
		if value1 == 'true' then
			noteTweenX('xSwapPlayerL', 4, defaultOpponentStrumX0+90, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerD', 5, defaultOpponentStrumX1+80, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerU', 6, defaultOpponentStrumX2+70, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerR', 7, defaultOpponentStrumX3+60, 0.2, 'CircInOut')
				
			noteTweenX('xSwapEnemyL', 0, defaultPlayerStrumX0-60, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyD', 1, defaultPlayerStrumX1-70, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyU', 2, defaultPlayerStrumX2-80, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyR', 3, defaultPlayerStrumX3-90, 0.2, 'CircInOut')
		
			PlayerIsDad = 1
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true) --removes le animation
			end
		elseif value1 == 'false' then
			noteTweenX('xSwapPlayerL', 4, defaultPlayerStrumX0+40, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerD', 5, defaultPlayerStrumX1+40, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerU', 6, defaultPlayerStrumX2+40, 0.2, 'CircInOut')
			noteTweenX('xSwapPlayerR', 7, defaultPlayerStrumX3+40, 0.2, 'CircInOut')
				
			noteTweenX('xSwapEnemyL', 0, defaultOpponentStrumX0+40, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyD', 1, defaultOpponentStrumX1+40, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyU', 2, defaultOpponentStrumX2+40, 0.2, 'CircInOut')
			noteTweenX('xSwapEnemyR', 3, defaultOpponentStrumX3+40, 0.2, 'CircInOut')
		
			PlayerIsDad = 0
			
			for i = 0, getProperty('unspawnNotes.length')-1 do
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', false) --re adds le animation
			end
		end
	end
end

local hold = -1.0
local DadSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'} --sorry had to copy since it is 100% cleaner than what sir top hat used to have done
local DadSingDir = 1

function goodNoteHit(id, direction, noteType, isSustainNote)
	if PlayerIsDad == 1 then
	hold = 0;
	DadSingDir = direction
	setProperty('dad.holdTimer', 0)
	setProperty('dad.specialAnim', true)
		if noteType ~= 'Hey!' or noteType ~= 'GF Sing' or noteType ~= 'No Animation' then
			characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
		elseif noteType == 'Hey!' then
			characterPlayAnim('dad', 'hey', true)
		end
		if getProperty('health') > 0.1 then
			setProperty('health', getProperty('health')-0.05)
		end
		setProperty('boyfriend.holdTimer', 0)
		characterPlayAnim('boyfriend', bfSingAnims[direction+1], false);
	end
end

local singKeys = {'left', 'down', 'up', 'right'}
function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if hold >= 0 then
		hold = hold + elapsed
		if hold >= holdCap then
			if keyPressed(singKeys[DadSingDir+1]) then
				if dadName == 'dad' or dadName == 'mom-car' or dadName == 'monster' or dadName == 'monster-christmas' or dadName == 'parents-christmas' then
					characterPlayAnim('dad', getProperty('dad.animation.curAnim.name')..'-loop', true)
					setProperty('dad.specialAnim', true)
				else
					setProperty('dad.animation.curAnim.paused', true)
					setProperty('dad.specialAnim', true)
				end
				hold = 0
			else
				hold = -1
				characterPlayAnim('dad', 'idle', true)
			end
		end
	end
	if getProperty('boyfriend.holdTimer') >= holdCap then
		setProperty('boyfriend.holdTimer', -1)
		characterPlayAnim('boyfriend', 'idle', true)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if PlayerIsDad == 1 then
		if getProperty('health') < 1.9 then
			setProperty('health', getProperty('health')+0.07)
			setProperty('boyfriend.animation.curAnim.paused', true)
			characterPlayAnim('boyfriend', 'idle', true)
			runTimer('unPause', 0.001, 1)
		end
	end
end

function onTimerCompleted(t, l, ll)
	if tag == 'unPause' then
		setProperty('boyfriend.animation.curAnim.paused', false)
		if getProperty('boyfriend.holdTimer') >= holdCap then
			characterPlayAnim('boyfriend', 'idle', true)
		end
	end
end

function noteMissPress(direction)
	if PlayerIsDad == 1 then
		if getProperty('health') < 1.9 then
			setProperty('health', getProperty('health')+0.07)
			setProperty('boyfriend.animation.curAnim.paused', true)
			characterPlayAnim('boyfriend', 'idle', true)
			runTimer('unPause', 0.01, 1)
		end
	end
end

local bfSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function opponentNoteHit(id, direction, noteType, isSustainNote) --makes player sing when dad hits a note
	if PlayerIsDad == 1 then
		setProperty('boyfriend.holdTimer', 0)
		characterPlayAnim('boyfriend', bfSingAnims[direction+1], true);
	
		if getProperty('health') < 1.9 then
			setProperty('health', getProperty('health')+0.02)
		end
	end
end