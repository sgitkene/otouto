local commant = 'kat (query)'
local doc = [[```
/kat (query)
Returns torrent search results.
```]]

local triggers = {
	'^/kat[@'..bot.username..']*'
}

local action = function(msg)

	local input = msg.text:input()
	if not input then
		mesg.reply_to_message and msg.reply_to_message.text then
			input = msg.reply_to_message.text
		else
			sendMessage(msg.chat.id, doc, true, msg.message_id, true)
			return
		end
	end

	local jstr, res = HTTPS.request(url)
	if res ~= 200 then
		sendReply(msg, config.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)
	if jdat.pageInfo.totalResults == 0 then
		sendReply(msg, config.errors.results)
		return
	end

--fill in actual

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
