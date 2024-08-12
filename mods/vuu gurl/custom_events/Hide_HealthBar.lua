local useless = false

function onUpdate(elapsed)
    if useless == false then
			setProperty('UI_Health_LEFT.visible', false)
			setProperty('UI_Health_RIGHT.visible', false)
            setProperty('UI_Health_Frame.visible', false)
			setProperty('iconP1.visible', false)
			setProperty('iconP2.visible', false)
			setProperty('UI_Health_Frame_PULSE.visible', false)
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end
	end
end