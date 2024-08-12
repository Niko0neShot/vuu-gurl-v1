function onCreate()
	makeLuaSprite('party room', 'pizzeria/209_Sem_Titulo_20240210180342', -564, -406);
	scaleObject('party room', 0.6, 0.6);
	setScrollFactor('party room', 0.95, 0.95);
	setProperty('party room.antialiasing', true);
	setObjectOrder('party room', 0);

	setScrollFactor('gfGroup', 0.95, 0.95);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 1);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 2);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 3);

	makeLuaSprite('209_Sem_Titulo_20240210180328', 'pizzeria/209_Sem_Titulo_20240210180328', -560, -453);
	scaleObject('209_Sem_Titulo_20240210180328', 0.6, 0.6);
	setScrollFactor('209_Sem_Titulo_20240210180328', 1, 1);
	setProperty('209_Sem_Titulo_20240210180328.antialiasing', true);
	setObjectOrder('209_Sem_Titulo_20240210180328', 4);

	makeLuaSprite('209_Sem_Titulo_20240210180242', 'pizzeria/209_Sem_Titulo_20240210180242', -563, -350);
	scaleObject('209_Sem_Titulo_20240210180242', 0.6, 0.6);
	setScrollFactor('209_Sem_Titulo_20240210180242', 1, 1);
	setProperty('209_Sem_Titulo_20240210180242.antialiasing', true);
	setObjectOrder('209_Sem_Titulo_20240210180242', 5);

	close(true);
end