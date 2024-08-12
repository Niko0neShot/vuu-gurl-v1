function onEvent(name, value1, value2)
    if name == 'Clear Popups' then
        for i = 1, 100 do 
            if getProperty('hitBox'..i..'.x') == 'hitBox'..i..'.x' then
                return
            end
            
            objectPlayAnimation('error_popups'..i, 'end') 
			setProperty('hitBox'..i..'.visible', false);
            runTimer('enddd', .1)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'enddd' then
        for i = 1, 100 do 
            if getProperty('error_popups'..i..'.visible') == 'error_popups'..i..'.visible' then
                return
            end

            setProperty('error_popups'..i..'.visible', false);
        end
    end
end