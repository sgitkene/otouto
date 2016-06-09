local newline = {}
local bindings = require('bindings')
local utilities = require('utilities')

function newline:init()
	newline.triggers = utilities.triggers(self.info.username):t('n', true).table
end

function newline:action(msg)
	bindings.sendMessage(self, msg.chat.id, '.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n.')
end

return newline
