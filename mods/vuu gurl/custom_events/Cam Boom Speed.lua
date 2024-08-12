boomspeed = 4
bam = 1
songEnded = false
function onEvent(n,v1,v2)
	if n == "Cam Boom Speed" then
		boomspeed = tonumber(v1)
		bam = tonumber(v2)
	end
end

hudOnly = false

function onStepHit()
	if songName == 'Forces' then
		if curStep == 1056 then
			hudOnly = true
		end

		if curStep == 1152 then
			hudOnly = false
		end
	end
end

function onBeatHit()

	if curBeat % boomspeed == 0 and not songEnded then

		if hudOnly == true then
			triggerEvent("Add Camera Zoom",0,0.03*bam)
			if getProperty('camGame.zoom') >= 1.35 then
				
				--setProperty('camGame.zoom',getProperty('camGame.zoom')+0.025*bam);
				setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.03*bam);
			end

		else
			triggerEvent("Add Camera Zoom",0.015*bam,0.03*bam)
			if getProperty('camGame.zoom') >= 1.35 then
				
				setProperty('camGame.zoom',getProperty('camGame.zoom')+0.025*bam);
				setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.03*bam);
			end
		end
	end	

end

function onEndSong()
	songEnded = true
	return Function_Continue;
end