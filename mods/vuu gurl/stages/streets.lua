function onCreate()
	makeLuaSprite('background', 'gurlbackground', -728, -133);
	scaleObject('background', 4.7, 4.7);
	setScrollFactor('background', 1, 1);
	setProperty('background.antialiasing', false);
	setObjectOrder('background', 0);

	makeLuaSprite('foreground', 'gurlforeground', -585, -47);
	scaleObject('foreground', 4.1, 4.1);
	setScrollFactor('foreground', 1, 1);
	setProperty('foreground.antialiasing', false);
	setObjectOrder('foreground', 1);

	setScrollFactor('gfGroup', 1, 1);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 2);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 3);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 4);

	close(true);
end