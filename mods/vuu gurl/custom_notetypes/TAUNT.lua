id = 0

function onCreate()

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'TAUNT' then --Check if the note on the chart is a Bullet Note
			--	setPropertyFromGroup('unspawnNotes', i, 'texture', 'TAUNT'); --Change texture
				--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'BAN_SPLASH');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'notes/Explosion'); --custom notesplash texture and its not playing animation

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

