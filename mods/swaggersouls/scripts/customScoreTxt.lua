function onUpdatePost()
    if getPropertyFromClass("grafex.util.ClientPrefs", "classicScoreTxt", true) then
        setTextString('scoreTxt', 'Too Drunk to see Score...')
    else
        setTextString('scoreTxt', 'ASJKDGJSKLGJKLSDGKSLDGSDKLG')
    end
	setProperty('popUpComboScore', false, false)
end