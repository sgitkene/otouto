local boobs = {}

local URL = require('socket.url')
local bindings = require('otouto.bindings')
local utilities = require('otouto.utilities')
local JSON = require('dkjson')
local HTTP = require('socket.http')



function boobs:init(config)
	boobs.triggers = utilities.triggers(self.info.username, config.cmd_pat):t('boobs', true):t('butts', true):t('bo', true):t('bu', true).table
end

boobs.command = 'boobs'
boobs.doc = [[```
/boobs
Returns a pic with nice boobs.
Alias: /bo
/butts
Returns a pic with nice butts.
Alias: /bu
```]]


function boobs:action(msg)

	local val = msg.text_lower:match('bu')
	if val == 'bu' then
		val = 'butt'
	else
		val = 'boob'
	end
	local jstr, status = HTTP.request('http://api.o'..val..'s.ru/noise/1')
	if status ~= 200 then
		bindings.sendReply(self, msg, config.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)[1]
	if not jdat then
		bindings.sendReply(self, msg, config.errors.results)
		return
	end

	if jdat.error then
		bindings.sendReply(self, msg, 'jdat error')
		return
	end
	
	local output =  '['..val..'s!](http://media.o'..val..'s.ru/' .. jdat.preview .. ')'

	bindings.sendMessage(self, msg.chat.id, output, false, nil, true)

end

return boobs

