function onCreate()
	makeLuaSprite('bg', 'forgotten_bg', -575, 170);
	scaleObject('bg', 1.1, 1.1);
	setScrollFactor('bg', 1, 1);
	setProperty('bg.antialiasing', false);
	setObjectOrder('bg', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', false);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', false);
	setObjectOrder('boyfriendGroup', 3);

	close(true);
end