function onCreate()
	makeLuaSprite('blubber-vuu', 'blubber-vuu', -435, -277);
	scaleObject('blubber-vuu', 3, 3);
	setScrollFactor('blubber-vuu', 0.95, 0.95);
	setProperty('blubber-vuu.antialiasing', false);
	setObjectOrder('blubber-vuu', 0);

	setScrollFactor('gfGroup', 0.95, 0.95);
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