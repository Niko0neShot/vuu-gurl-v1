function onCountdownTick(c)
	if c == 1 then
		runHaxeCode([[
       			for (i in 0...4) game.strumLineNotes.members[i].x += 460;
       			for (i in 4...8) game.strumLineNotes.members[i].x -= 460;
		]])
	end
end