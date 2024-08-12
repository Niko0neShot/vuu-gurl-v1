
local singing = 0

function onCreate()
	--Iterate over all notes

	t1 = 0.2

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Attack' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)

	if noteType == 'Attack' then
		runTimer('T', t1);
		characterPlayAnim('boyfriend', 'pre-attack', true);
   		characterPlayAnim('dad', 'preDodge', true);
   		setProperty('boyfriend.specialAnim', true);
   		setProperty('dad.specialAnim', true);

    end
end

--function noteMiss(id, direction, noteType, isSustainNote)
	--if noteType == 'Sword' then
	--	setProperty('health', getProperty('health')-0.35);
	--	playSound('slice', 0.6);
	--	addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
	--	characterPlayAnim('dad', 'attack', true);
	--	characterPlayAnim('boyfriend', 'hurt', true);
	--	setProperty('boyfriend.specialAnim', true);
	--	setProperty('dad.specialAnim', true);
	--	cameraShake('camGame', 0.01, 0.2)
	--end
--end

function onUpdate(elapsed) -- Avoid Playing Idle While Playing Animation

	-- WILL NOT DO IDLE IF PLAYING ANIMATION		
	if getProperty('dad.animation.curAnim.name') ~= 'idle' and not getProperty('dad.animation.curAnim.finished') then
	singing = 1
	else
	singing = 0
	
	end


function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'T' == true then

   characterPlayAnim('boyfriend', 'attack', true);
   characterPlayAnim('dad', 'Dodge', true);

   setProperty('health', getProperty('health') + 0.3);

   --setProperty('boyfriend.specialAnim', false);
   --setProperty('dad.specialAnim', false);
   
   end
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.1);
	end

end
end