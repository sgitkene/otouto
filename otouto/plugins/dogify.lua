local dogify = {}

local utilities = require('otouto.utilities')

dogify.command = 'dogify <text>'
dogify.doc = [[```
/dogify <such text/wow>
Wow, much return, such text, wow.
```]]

function dogify:init(config)
	dogify.triggers = utilities.triggers(self.info.username, config.cmd_pat):t('dogify', true).table
end

dogify.base_url = 'http://dogr.io/'

function dogify:action(msg, config)
	local input = utilities.input(msg.text)
	local urlm = 'https?://[%%%w-_%.%?%.:/%+=&]+'
	local output = ''
	if not input then
		output = dogify.doc
	else
		input = input:gsub(' ', '%%20')
		url = dogify.base_url..input..'.png?split=false&.png'
		if string.match(url, urlm) == url then
			output = '[WOW!]('..url..')'
		else
			output = config.errors.argument
		end
	end
	utilities.send_message(self, msg.chat.id, output, false, nil, true)
end

return dogify
