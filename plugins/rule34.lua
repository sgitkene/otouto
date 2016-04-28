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
	local answer = ''
	local status = 0
	local base_url = 'http://rule34.paheal.net/post/list/'
	local randomint = 0
	if not input then
		output = doc
	else
		input = input:gsub(' ', '_')
		input = URL.escape(input)
		print(input)
		answer, status = HTTP.request(base_url..input..'/1')
		if status ~= 200 then
			output = config.errors.connection..'1'
		else
			maxnum = answer:match('<a href=".-(%d*)">Last</a>')
			if maxnum then
				maxnum = tonumber(maxnum)
				maxnum = math.random(maxnum)
			else
				maxnum = 1
			end
			print(maxnum)
			answer, status = HTTP.request(base_url..input..'/'..randomint)
			if status ~= 200 then
				output = config.errors.connection..'2'
			else
				local temptable = {}
				numbert = 1
				for imgname in answer:gmatch('<a href="(.-)">Image Only</a>') do
					temptable[numbert] = imgname
					numbert = numbert +1
				end
				randomint = math.random(#temptable)
				answer = temptable[randomint]
				if not answer then
					output = config.errors.results
				else
					output = '[rule34!]('..answer..')'
				end
			end
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

