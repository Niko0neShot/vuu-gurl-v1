function onCreate()
	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 0);

	makeLuaSprite('IMG_9276', 'IMG_9276', -442, -285);
	scaleObject('IMG_9276', 1.4, 1.4);
	setScrollFactor('IMG_9276', 1, 1);
	setProperty('IMG_9276.antialiasing', true);
	setObjectOrder('IMG_9276', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	makeLuaSprite('84+Home+Bar', '84+Home+Bar', -204, 61);
	scaleObject('84+Home+Bar', 4, 4);
	setScrollFactor('84+Home+Bar', 1, 1);
	setProperty('84+Home+Bar.antialiasing', false);
	setObjectOrder('84+Home+Bar', 4);

	close(true);
end