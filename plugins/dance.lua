local command = 'dance [target]'
local doc = [[```
/dance [target]
Dance [with  somebody].
```]]

local triggers = {
	'^/dance[@'..bot.username..']*'
}

local pair = {
	'LEADER bids FOLLOWER to dance.',
	'LEADER rocks the dancefloor with FOLLOWER.'
}

local dances = {
	'The whole club was looking at LEADER. LEADER hit the floor. Next thing you know, LEADER got low, low, low, low, low, low, low, low.',
	'LEADER gets jiggy wit\' it!',
	'LEADER should go to military school, because they\'re one hell of a Soldja Boy!',
	'LEADER dances.',
	'LEADER dances ecstatically.',
	'LEADER knows how to pole dance like a pro!',
	'LEADER just whipped, and THEN nae-nae\'d!',
	'LEADER doesn\'t know how to dance but tries anyway.'
}

local action = function(msg)

	local follower = msg.text:input()
	if msg.reply_to_message then
		if database.nicknames[tostring(msg.reply_to_message.from.id)] then
			follower = database.nicknames[tostring(msg.reply_to_message.from.id)]
		else
			follower = msg.reply_to_message.from.first_name
		end
	end

	local leader = msg.from.first_name
	if database.nicknames[msg.from.id_str] then
		leader = database.nicknames[msg.from.id_str]
	end

	local message
	if follower then
		message = pair[math.random(#pair)]
	else
		message = dances[math.random(#dances)]
	end

	if follower then
		message = message:gsub('FOLLOWER', follower)
	end
	message = message:gsub('LEADER', leader)

	sendMessage(msg.chat.id, message)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
