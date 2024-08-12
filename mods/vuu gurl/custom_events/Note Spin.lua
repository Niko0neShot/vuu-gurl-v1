-- Event notes hooks
function onEvent(name, v1, v2)
	if name == 'Note Spin' then
		local daStart = 0
		local daEnd = 7

		if v1 == 'opponent' or v1 == 'dad' then
			daEnd = 3
		end

		if v1 == 'player' or v1 == 'boyfriend' or v1 == 'bf' then
			daStart = 4
		end

		for i = daStart,daEnd do
			setPropertyFromGroup('strumLineNotes', i, 'angle', 0)

			if i >= 4 then
				noteTweenAngle('notespin'..i, i, -360, 0.1, 'circOut');
			else
				noteTweenAngle('notespin'..i, i, 360, 0.1, 'circOut');
			end
			
		end
	
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end