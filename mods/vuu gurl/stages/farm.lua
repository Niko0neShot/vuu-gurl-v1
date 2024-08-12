function onCreate()
	makeLuaSprite('sky', 'farm/sky', -1295, -814);
	scaleObject('sky', 5, 5);
	setScrollFactor('sky', 1, 1);
	setProperty('sky.antialiasing', false);
	setObjectOrder('sky', 0);

	makeLuaSprite('clouds', 'farm/clouds', -1020, -915);
	scaleObject('clouds', 5, 5);
	setScrollFactor('clouds', 1, 1);
	setProperty('clouds.antialiasing', false);
	setObjectOrder('clouds', 1);

	makeLuaSprite('farm', 'farm/farm', -1300, -825);
	scaleObject('farm', 5, 5);
	setScrollFactor('farm', 1, 1);
	setProperty('farm.antialiasing', false);
	setObjectOrder('farm', 2);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', false);
	setObjectOrder('gfGroup', 3);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', false);
	setObjectOrder('dadGroup', 4);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', false);
	setObjectOrder('boyfriendGroup', 5);

	makeLuaSprite('i forgot', 'farm/i forgot', -1295, -815);
	scaleObject('i forgot', 5, 5);
	setScrollFactor('i forgot', 1, 1);
	setProperty('i forgot.antialiasing', false);
	setObjectOrder('i forgot', 6);

	close(true);
end