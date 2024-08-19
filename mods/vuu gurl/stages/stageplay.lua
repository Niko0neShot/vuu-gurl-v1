function onCreate()
	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 0);

	makeLuaSprite('stage', 'stage-play-vuu', -420, -587);
	scaleObject('stage', 3, 3);
	setScrollFactor('stage', 1, 1);
	setProperty('stage.antialiasing', false);
	setObjectOrder('stage', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', false);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', false);
	setObjectOrder('boyfriendGroup', 3);

	close(true);
end