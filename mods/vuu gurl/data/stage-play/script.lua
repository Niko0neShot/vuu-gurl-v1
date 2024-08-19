function onCreatePost()

    setProperty('gf.visible', false)
    setProperty('iconP1.flipX', 1)
    setProperty('iconP2.flipX', 1)
    setProperty('healthBar.flipX', 1)
    setProperty('healthBarWN.flipX', 1)
end

function onUpdatePost()
if not downscroll then
    setProperty('iconP2.x', 880)
    setProperty('iconP2.y', 565)
    setProperty('iconP1.x', 230)
    setProperty('iconP1.y', 565)
end
if downscroll then
    setProperty('iconP2.x', 880)
    setProperty('iconP2.y', 10)
    setProperty('iconP1.x', 230)
    setProperty('iconP1.y', 10)
end
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function onCountdownTick(c)
	if c == 1 then
		runHaxeCode([[
       			for (i in 0...4) game.strumLineNotes.members[i].x += 460;
       			for (i in 4...8) game.strumLineNotes.members[i].x -= 460;
		]])
	end
end