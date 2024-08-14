function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BAN Note' then --Check if the note on the chart is a Bullet Note
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'BAN_NOTE'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'BAN_SPLASH');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/Explosion'); --custom notesplash texture and its not playing animation

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'BAN Note' then
		cameraShake('camGame', 0.01, 0.2)
		playSound('yes_rico_caboom', 10);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'BAN Note' then
		setProperty('health', -500);
		playSound('yes_rico_caboom', 10);
	end
end