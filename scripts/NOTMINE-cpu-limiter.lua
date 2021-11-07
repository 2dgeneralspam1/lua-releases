-- credits to https://v3rmillion.net/showthread.php?tid=1143864
-- self hosting here incase the owner decides to edit the pastebin to something very bad 

local Debounce = false
local Update = function ()
	if not iswindowactive() then
		if not Debounce then
			Debounce = true
			setfpscap(5)
			return
		else
			return
		end
	else
		if Debounce then
			Debounce = false
			setfpscap(360)
			return
		else
			return
		end
	end
end

local Initialize = function ()
	while true do
		Update()
		task.wait()
	end
end
coroutine.resume(coroutine.create(Initialize))
