-- CODING FROM  https://gamebanana.com/mods/479687
-- CREDITS:IronDragon2940

function onUpdatePost()
if misses < 11 and misses > 0 then
	setProperty('star1.color', getColorFromHex('f7d903'))
    end

    if misses < 21 and misses > 0 then
	setProperty('star2.color', getColorFromHex('f7d903'))
    end

    if misses < 31 and misses > 0 then
	setProperty('star3.color', getColorFromHex('f7d903'))
    end

    if misses < 41 and misses > 0 then
	setProperty('star4.color', getColorFromHex('f7d903'))
    end

    if misses < 51 and misses > 0 then
	setProperty('star5.color', getColorFromHex('f7d903'))
    end

    if misses > 10 then
	setProperty('star5.color', getColorFromHex('FFFFFF'))
    end

    if misses > 20 then
	setProperty('star4.color', getColorFromHex('FFFFFF'))
    end

    if misses > 30 then
	setProperty('star3.color', getColorFromHex('FFFFFF'))
    end

    if misses > 40 then
	setProperty('star2.color', getColorFromHex('FFFFFF'))
    end

    if misses > 50 then
	setProperty('star1.color', getColorFromHex('FFFFFF'))

   end
end


function onBeatHit()
	if curBeat % 2 == 0 and misses == 0 then
	objectPlayAnimation('star1', 'star', false);
  objectPlayAnimation('star2', 'star', false);
  objectPlayAnimation('star3', 'star', false);
  objectPlayAnimation('star4', 'star', false);
  objectPlayAnimation('star5', 'star', false);

end

if curBeat % 2 == 0 and misses > 0 then
	objectPlayAnimation('star1', 'u suck', false);
	objectPlayAnimation('star2', 'u suck', false);
	objectPlayAnimation('star3', 'u suck', false);
	objectPlayAnimation('star4', 'u suck', false);
	objectPlayAnimation('star5', 'u suck', false);
	end
end