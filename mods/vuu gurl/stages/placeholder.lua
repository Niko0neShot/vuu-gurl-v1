function onCreate()
	makeLuaSprite('placeholder', 'placeholder', -1687, -1884);
	scaleObject('placeholder', 6.6, 6.6);
	setScrollFactor('placeholder', 1, 1);
	setProperty('placeholder.antialiasing', true);
	setObjectOrder('placeholder', 0);

	setScrollFactor('gfGroup', 1, 1);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	close(true);
end