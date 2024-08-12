function onCreatePost()

    setProperty('gf.visible', false) --
    setProperty('camGame.visible', false)
    setProperty('camHUD.visible', false)
    setProperty('stage.visible', false)
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