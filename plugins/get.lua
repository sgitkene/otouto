
if not database.setsfromchats then
	return 'error'
end

local command = 'get <variable>'
local doc = [[```
/get <variable>
Get your variable. If no variable provided, gives a list of available variables instead.
```]]

local triggers = {
	'^/get[@'..bot.username..']*'
}

local action = function(msg)

	local output = 'local variables:\n'
	local input = msg.text:input()
	if not input and not database.setsfromchats[msg.chat.id_str].variable then
		output = 'no variables yet!'
	elseif not input then
		for k,v in pairs(database.setsfromchats[msg.chat.id_str].variable) do output =  output .. k .. '\n' end
	elseif database.setsfromchats[msg.chat.id_str].variable[input] then
		output = database.setsfromchats[msg.chat.id_str].variable[input]
	else
		output = 'no variable with that name!'
	end

	sendReply(msg, output)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
