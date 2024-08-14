function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'you-suck' and not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end
		

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'you-suck' then
		misses = 0
		ratingName = 'You Suck!'
		rating = 0

		--cameraShake('camGame', 0.01, 0.2)
		--playSound('yes_rico_caboom', 10);
    end
end


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'you-suck' then
		--setProperty('health', -500);
		--playSound('yes_rico_caboom', 10);
	end
end		