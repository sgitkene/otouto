local torrents = {}

utilities = require('otouto.utilities')
HTTPS = require('ssl.https')
URL = require('socket.url')
JSON = require('dkjson')

torrents.command = 'torrents (query)'
torrents.doc = [[```
/torrents (query)
Returns torrent search results.
Alias: /tse
```]]

function torrents:init(config)
	torrents.triggers = utilities.triggers(self.info.username, config.cmd_pat):t('torrents', true):t('tse',true).table
end
torrents.api = 'https://torrentproject.se/?s='
torrents.options = '&out=json'
function torrents:action(msg, config)

	local input = utilities.input(msg.text)
	if not input then
		if msg.reply_to_message and msg.reply_to_message.text then
			input = msg.reply_to_message.text
		else
			utilities.send_message(self, msg.chat.id, doc, true, msg.message_id, true)
			return
		end
	end

	local url = torrents.api .. URL.escape(input) ..torrents.options

	local jstr, res = HTTPS.request(url)
	if res ~= 200 then
		utilities.send_reply(self, msg, config.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)
	if jdat.total_found == 0 then
		utilities.send_reply(self, msg, config.errors.results)
		return
	end

	local output = ''

	for i = 1, math.min(tonumber(jdat.total_found), 5) do
		local cur = jdat[tostring(i)] 
		local magnet = 'magnet:?xt=urn:btih:'
		output = output .. cur.title .. ' s:' .. cur.seeds .. ' l:' .. cur.leechs .. ' ' .. cur.torrent_size .. 'bytes \n' .. magnet .. cur.torrent_hash .. '\n'
	end

	utilities.send_message(self, msg.chat.id, output, true, nil, false)

end

return torrents
