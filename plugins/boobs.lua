local command = 'boobs'
local doc = [[```
/boobs
Returns a pic with nice boobs.
Alias: /bo
```]]

local triggers = {
	'^/boobs[@'..bot.username..']*',
	'^/bo[@'..bot.username..']*',
}


local action = function(msg)

	local jstr, status = HTTP.request('http://api.oboobs.ru/noise/1')
	if status ~= 200 then
		sendReply(msg, config.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)[1]
	if not jdat then
		sendReply(msg, config.errors.results)
		return
	end

	if jdat.error then
		sendReply(msg, 'jdat error')
		return
	end
	
	local output =  '[boobs!](http://media.oboobs.ru/' .. jdat.preview .. ')'

	sendMessage(msg.chat.id, output, false, nil, true)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}

