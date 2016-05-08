local command = 'boobs'
local doc = [[```
/boobs
Returns a pic with nice boobs.
Alias: /bo
/butts
Returns a pic with nice butts.
Alias: /bu
```]]

local triggers = {
	'^/boobs[@'..bot.username..']*',
	'^/bo[@'..bot.username..']*',
	'^/bu[tts]?[@'..bot.username..']*'
}


local action = function(msg)

	val = msg.text:match('bu')
	if val == 'bu' then
		val = 'butt'
	else
		val = 'boob'
	end
	local jstr, status = HTTP.request('http://api.o'..val..'s.ru/noise/1')
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
	
	local output =  '['..val..'s!](http://media.o'..val..'s.ru/' .. jdat.preview .. ')'

	sendMessage(msg.chat.id, output, false, nil, true)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}

