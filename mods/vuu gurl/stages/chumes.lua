function onCreate()
	makeLuaSprite('bite_bg_vuu', 'chumes bg/1gg', -500, -200);
	scaleObject('bite_bg_vuu', 3.2, 3.2);
	setScrollFactor('bite_bg_vuu', 1, 1);
	setProperty('bite_bg_vuu.antialiasing', false);
	setObjectOrder('bite_bg_vuu', 5);

	makeLuaSprite('bite_bg_bvuug', 'chumes bg/2ggg', -500, -200);
	scaleObject('bite_bg_bvuug', 3.2, 3.2);
	setScrollFactor('bite_bg_bvuug', 1, 1);
	setProperty('bite_bg_bvuug.antialiasing', false);
	setObjectOrder('bite_bg_bvuug', 3);

	makeLuaSprite('bite_bg_avuu', 'chumes bg/3gggg', -500, -200);
	scaleObject('bite_bg_avuugg', 3.2, 3.2);
	setScrollFactor('bite_bg_avuugg', 1, 1);
	setProperty('bite_bg_avuugg.antialiasing', false);
	setObjectOrder('bite_bg_avuugg', 2);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 4);

	setObjectCamera('gfGroup', 'OTHER')
	setObjectCamera('boyfriendGroup', 'OTHER')
end

function onCountdownTick(c)
	if c == 1 then
		runHaxeCode([[
       			for (i in 0...4) game.strumLineNotes.members[i].x += 12050;
       			for (i in 4...8) game.strumLineNotes.members[i].x -= 220;
		]])
	end
end