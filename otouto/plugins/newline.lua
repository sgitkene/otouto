local newline = {}
local utilities = require('otouto.utilities')

function newline:init(config)
	newline.triggers = utilities.triggers(self.info.username, config.cmd_pat):t('n', true).table
end

function newline:action(msg)
	utilities.send_message(self, msg.chat.id, '.\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n.')
end

return newline
