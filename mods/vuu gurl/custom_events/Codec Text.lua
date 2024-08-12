function onEvent(n,v1,v2)
	if n == 'Codec Text' then
		local alpha = 1

		if v2 ~= "" then
			alpha = tonumber(v2)
		end

		setProperty('codectext.alpha', alpha)
		setTextString('codectext', v1)
		screenCenter('codectext', 'x')
	end
end