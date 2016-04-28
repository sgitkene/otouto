local command = 'rule34'
local doc = [[```
/rule34 character
Returns a pic with rule34 pic of character.
Alias: /r34
```]]

local triggers = {
	'^/rule34[@'..bot.username..']*',
	'^/r34[@'..bot.username..']*'
}


local action = function(msg)
	local input = msg.text:input()
	local output = 'nothing'
	if not input then
		output = doc
	else
		input = URL.escape(input)
		print(input)
		answer, status = HTTP.request('http://supertwins.nl/old/r34.py?img='..input)
		if status ~= 200 then
			output = config.errors.connection
		else
			answer = answer:match('http.*%....')
			print(answer)
			output = '[rule34!]('..answer..')'
		end
	end
	
	sendMessage(msg.chat.id, output, false, nil, true)
end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}

