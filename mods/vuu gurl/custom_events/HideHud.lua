function onEvent(name, value1)
	if name == 'HideHud' then
		setProperty('camHUD.visible', false);
		setProperty('strumHUD.visible', false);
	end
	if value1 == 'ass' then
		setProperty('camHUD.visible', true);
		setProperty('strumHUD.visible', true);
	end
end
