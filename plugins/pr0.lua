-- rewrite of pr0.lua that I tried to port from yagop's bot to otouto.
local command = 'pr0gramm'
local doc = [[```
/pr0gramm [filter] [tag]
Returns a pr0gramm.com image conforming to given filter and tag. If none are given, returns a random image.
Alias: /pr0
```]]

local triggers = {
	'^/pr0gramm[@'..bot.username..']*',
	'^/pr0[@'..bot.username..']*$',
	'^/pr0[@'..bot.username..']* '
}

local action = function(msg)
	-- find out filter and tag, then query the api accordingly.
	-- send the found link formatted [pr0](link) with link preview or, in case of webm or gif, send as file.
	local tag = '&tags='
	local flag = '&flags='
	local text = msg.text:input()
	local urlapi = 'http://pr0gramm.com/api/items/get?promoted=1'
	local answer = nil
	local status = 0
	local output = 'empty'
	local dec_answer = {}
	local img_url = 'http://img.pr0gramm.com/'
	local i = 0
	local imagename = nil
	local name = nil
	if text then
		val = text:match('n?sfw?l?')
		if val == 'sfw' then
			flag = flag..'1'
		elseif val == 'nsfw' then
			flag = flag..'2'
		elseif val == 'nsfl' then
			flag = flag..'4'
		else
			flag = flag..'7'
		end
		text = text:gsub('n?sfw?l?', '')
		text = text:gsub('^%s*', '')
		tag = tag..text
	else
		flag = flag..'7'
	end
	urlapi = urlapi..tag..flag
	answer, status = HTTP.request(urlapi)
	if status ~= 200 then
		output = config.errors.connection
	end
	dec_answer = JSON.decode(answer)
	local found = false
	while (not found) do
		if (#dec_answer.items == 0) then
			output = config.errors.results
			found = true
		else
			rand = math.random(#dec_answer.items)
			imagename = dec_answer.items[rand].image
			name = imagename:match('%.j?pn?g$') --'%.w?j?p?e?n?g?b?m?$')
			if name then
				found = true
				output = '[pr0!]('..img_url..imagename..')'
				-- output = img_url..imagename
			else
				table.remove(dec_answer.items, rand)
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
	
