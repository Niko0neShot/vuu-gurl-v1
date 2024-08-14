
function onCreate()
	precacheImage('DUBLENOTE_splashes')
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Duble Note' then --Check if the note on the chart is a Bullet Note
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'DUBLENOTE_assets'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'DUBLENOTE_splashes');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
				setPropertyFromGroup("unspawnNotes", i, "noAnimation", true)
				setPropertyFromGroup("unspawnNotes", i, "hitHealth", 0)
				setPropertyFromGroup("unspawnNotes", i, "missHealth", 0)
				setPropertyFromGroup("unspawnNotes", i, "ignoreNote", true)
				setPropertyFromGroup("unspawnNotes", i, "alpha", 0.5)
		end
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Duble Note" then
	        --nothing
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "Duble Note" then
	        addScore(450)
	end
end
