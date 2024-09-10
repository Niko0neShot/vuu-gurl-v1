function onCreate()
	makeLuaSprite('BG', 'delivery-vuu', -887, -350);
	scaleObject('BG', 4, 4);
	setProperty('BG.antialiasing', false);
	setObjectOrder('BG', 0);

	close(true);
end