return {
	bot_api_key = '210637847:AAGpsgg6bIm3mcv4v0WnvS3ChBrffbLopM4',
	google_api_key = 'AIzaSyDiRSahc_Y8AgxDFB2ZStRr7FUR0Iv09b4',
	google_cse_key = '005569076602134005772:-atbsbjkolg',
	lastfm_api_key = 'da6afb8cbbbbe47ebb8a9d5d29320578',
	owm_api_key = 'a2237100747fbe4e46048ce3c5d93f29',
	biblia_api_key = 'AA88ED4157D8D65FEE24E8EFB72042585BB8E1CD',
	thecatapi_key = 'NzI4Mjg',
	nasa_api_key = 'AXINozpgSQEiv0ZZaBqQm2fNSwHxleNKxyeess2i',
	yandex_key = 'trnsl.1.1.20160314T095240Z.7c255532a9adc70a.ed8b5d97efa926809da555f7ea4d272f07e9505a',
	simsimi_key = '',
	simsimi_trial = true,
	time_offset = 0,
	lang = 'en',
	-- If you change this, make sure you also modify launch-tg.sh.
	cli_port = 4567,
	admin = 18639698,
	admin_name = 'Sgit Kene',
	log_chat = nil,
	about_text = [[
I am sgitbot, the plugin-wielding, multi-purpose Telegram bot.

Send /help to get started.
]]	,
	errors = {
		connection = 'Connection error.',
		results = 'No results found.',
		argument = 'Invalid argument.',
		syntax = 'Invalid syntax.',
		chatter_connection = 'I don\'t feel like talking right now.',
		chatter_response = 'I don\'t know what to say to that.'
	},
	greetings = {
		['Hello, #NAME.'] = {
			'hello',
			'hey',
			'sup',
			'hi',
			'good morning',
			'good day',
			'good afternoon',
			'good evening'
		},
		['Goodbye, #NAME.'] = {
			'bye',
			'later',
			'see ya',
			'good night'
		},
		['Welcome back, #NAME.'] = {
			'i\'m home',
			'i\'m back'
		},
		['You\'re welcome, #NAME.'] = {
			'thanks',
			'thank you'
		},
		['Your place or mine, #NAME?'] = {
			'fuck you',
			'let\'s have sex'
		},
		['You too, #NAME.'] = {
			'i love you',
			'i hate you'
		},
		['I try but my arms are too short! RIP #NAME.'] = {
			'help me',
			'save me'
		}
	},
	plugins = {
		'control.lua',
		'blacklist.lua',
		'about.lua',
		'floodcontrol.lua',
		'ping.lua',
		'whoami.lua',
		'nick.lua',
		'echo.lua',
		'set.lua',
		'get.lua',
		'wikipedia.lua',
		'hackernews.lua',
		'calc.lua',
		'boobs.lua',
		'urbandictionary.lua',
		'time.lua',
		'eightball.lua',
		'reactions.lua',
		'dice.lua',
		'reddit.lua',
		'xkcd.lua',
		'slap.lua',
		'dance.lua',
		'commit.lua',
		'pun.lua',
		'pokedex.lua',
		'bandersnatch.lua',
		'currency.lua',
		'cats.lua',
--		'hearthstone.lua',
		'newline.lua',
		'shout.lua',
		'apod.lua',
		'patterns.lua',
		-- Put new plugins above this line.
		'help.lua',
		'greetings.lua'
	}
}
