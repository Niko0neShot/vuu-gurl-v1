function onCreate()
	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 0);

	makeLuaSprite('bluebox_bg', 'bluebox_bg', -575, -470);
	scaleObject('bluebox_bg', 1.1, 1.1);
	setScrollFactor('bluebox_bg', 1, 1);
	setProperty('bluebox_bg.antialiasing', true);
	setObjectOrder('bluebox_bg', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	close(true);
end