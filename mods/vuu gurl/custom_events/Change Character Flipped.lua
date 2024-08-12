-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

function onEvent(n,v1,v2)
	if n == 'Change Character Flipped' then
		if v1 == 0 or v1 == 'dad' then
			changeDadAuto(v2, true)
		elseif v1 == 1 or v1 == 'boyfriend' or v1 == 'bf' then
			changeBFAuto(v2, true)
		elseif v1 == 2 or v1 == 'girlfriend' or v1 == 'gf' then
			changeGFAuto(v2, true)
		end
	end
end