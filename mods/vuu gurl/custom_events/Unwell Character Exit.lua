-- works with cameraFollow.lua

function onEvent(n,v1,v2)
	if n == 'Unwell Character Exit' then
		if v2 == "" then
			local isPlayer = getProperty(v1..'.isPlayer')

			if isPlayer == true then
				doTweenX(v1..'TwenX', v1..'', getProperty(v1..'.x') + 600, 0.5, 'quadinout')
				doTweenY(v1..'TwenY', v1..'', getProperty(v1..'.y') + 600, 0.5, 'expoinout')
				doTweenAngle(v1..'TwenAngle', v1..'', 90, 0.5, 'circinout')
			else
				doTweenX(v1..'TwenX', v1, getProperty(v1..'.x') - 600, 0.5, 'quadinout')
				doTweenY(v1..'TwenY', v1, getProperty(v1..'.y') + 600, 0.5, 'expoinout')
				doTweenAngle(v1..'TwenAngle', v1..'', -90, 0.5, 'circinout')
			end
		
		else
			if v2 == 'straightdown' then
				doTweenY(v1..'TwenY', v1, getProperty(v1..'.y') + 600, 0.5, 'elasticinout')
			elseif v2 == 'straightacross' then
				local isPlayer = getProperty(v1..'.isPlayer')

				if isPlayer == true then
					doTweenX(v1..'TwenX', v1..'', getProperty(v1..'.x') + 600, 0.5, 'quadinout')
				else
					doTweenX(v1..'TwenX', n, getProperty(v1..'.x') - 600, 0.5, 'quadinout')
				end
			end
		end
	end
end