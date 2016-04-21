

local triggers = {
	'^/public[@'..bot.username..']*',
	'^/n[@'..bot.username..']*'
}

local action = function(msg)
	sendMessage(msg.chat.id, '.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n.')
end

return {
	action = action,
	triggers = triggers
}
