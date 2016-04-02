if not database.setsfromchats then
	database.setsfromchats = {variable={}}
end

local command = 'set [name] [value]'
local doc = [[```
/set [name] [value]
Set a variable (named name) with a value. Use "/set [name] --" to delete it.
```]]

local triggers = {
	'^/set[@'..bot.username..']*'
}

local action = function(msg)

	local output
	local input = msg.text:input()
	if not input then
		output = doc
		sendReply(msg, output)
		return
	end
	

	_,_, name, input = string.find(input, "(%a+)%s(.*)")
	if not input or not name then
		output = doc
	elseif string.len(input) > 1000 then
		output = 'The character limit is 1000.'
	elseif input == '--' or input == '—' then
		database.setsfromchats[msg.chat.id_str].variable[name] = nil
		output = name .. ' has been deleted.'
	else
		if not database.setsfromchats[msg.chat.id_str] then database.setsfromchats[msg.chat.id_str] = {variable={}} end
		database.setsfromchats[msg.chat.id_str].variable[name] = input
		output = name  .. ' has been set to "' .. input .. '".'
	end

	sendReply(msg, output)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
