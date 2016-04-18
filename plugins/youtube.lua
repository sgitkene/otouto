 -- Thanks to @TiagoDanin for writing the original plugin.

if not config.google_api_key then
	print('Missing config value: google_api_key.')
	print('youtube.lua will not be enabled.')
	return
end

local command = 'youtube <query>'
local doc = [[```
/youtube <query>
Returns the top result from YouTube.
Alias: /yt
```]]

local triggers = {
	'^/youtube[@'..bot.username..']*',
	'^/yt[@'..bot.username..']*$',
	'^/yt[@'..bot.username..']* '
}

local action = function(msg)

	local input = msg.text:input()
	if not input then
		if msg.reply_to_message and msg.reply_to_message.text then
			input = msg.reply_to_message.text
		else
			sendMessage(msg.chat.id, doc, true, msg.message_id, true)
			return
		end
	end

	local url = 'https://www.googleapis.com/youtube/v3/search?key=' .. config.google_api_key .. '&type=video&part=snippet&maxResults=4&q=' .. URL.escape(input)

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

	local vid_url = 'https://www.youtube.com/watch?v=' .. jdat.items[1].id.videoId
	local vid_title = jdat.items[1].snippet.title
	vid_title = vid_title:gsub('%(.+%)',''):gsub('%[.+%]','')
	local output = '[' .. vid_title .. '](' .. vid_url .. ')'

	sendMessage(msg.chat.id, output, false, nil, true)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
