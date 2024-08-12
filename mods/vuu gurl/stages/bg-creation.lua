function onCreate()
	-- background shit
	makeLuaSprite('bg-creation/room', 'bg-creation/room', 0, 0);
	makeLuaSprite('bg-creation/tables', 'bg-creation/tables', -100, -200);
	setLuaSpriteScrollFactor('bg-creation/tables', 1.2, 1.0);
        scaleObject('bg-creation/tables', 1.3, 1.3);

	makeLuaSprite('intro', 'empty', 0, 0);
	makeGraphic('intro', 1280, 750, '000000');
	setObjectCamera('intro', 'camHUD');

	makeLuaSprite('intro2', 'empty', 0, 0);
	makeGraphic('intro2', 1280, 750, '000000');
	setObjectCamera('intro2', 'other');

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
		setLuaSpriteScrollFactor('stagelight_left', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);
		
		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setLuaSpriteScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setPropertyLuaSprite('stagelight_right', 'flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
		setLuaSpriteScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('bg-creation/room', false);
	addLuaSprite('bg-creation/tables', true);
	addLuaSprite('intro', false);
	addLuaSprite('intro2', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end