return {
	-- Your authorization token from the botfather.
	bot_api_key = '210637847:AAGpsgg6bIm3mcv4v0WnvS3ChBrffbLopM4',
	-- http://console.developers.google.com
	google_api_key = 'AIzaSyDiRSahc_Y8AgxDFB2ZStRr7FUR0Iv09b4',
	-- https://cse.google.com/cse
	google_cse_key = '005569076602134005772:-atbsbjkolg',
	lastfm_api_key = 'da6afb8cbbbbe47ebb8a9d5d29320578',
	-- http://openweathermap.org/appid
	owm_api_key = 'a2237100747fbe4e46048ce3c5d93f29',
	biblia_api_key = 'AA88ED4157D8D65FEE24E8EFB72042585BB8E1CD',
	thecatapi_key = 'NzI4Mjg',
	nasa_api_key = 'AXINozpgSQEiv0ZZaBqQm2fNSwHxleNKxyeess2i',
	yandex_key = 'trnsl.1.1.20160314T095240Z.7c255532a9adc70a.ed8b5d97efa926809da555f7ea4d272f07e9505a',
	mashape_key = '4qqPckve42mshJYla8hjFLWjIigkp1NoNFXjsnKdJc0iewHwDC',
	simsimi_key = '',
	simsimi_trial = true,
	-- Differences, in seconds, between your time and UTC.
	time_offset = 0,
	-- Two-letter language code.
	lang = 'en',
	-- If you change this, make sure you also modify launch-tg.sh.
	cli_port = 4567,
	-- Your Telegram ID.
	admin = 18639698,
	admin_name = 'Sgit Kene',
	-- The channel, group, or user to send error reports to.
	log_chat = 18639698,
	-- If this is not set, errors will be printed to the console.
	-- The port used to communicate with tg for administration.lua.
	-- If you change this, make sure you also modify launch-tg.sh.
	-- The block of text returned by /start.
	about_text = [[
I am otouto, the plugin-wielding, multipurpose Telegram bot.

Send /help to get started.
	]],
	-- The symbol that starts a command. Usually noted as '/' in documentation.
	cmd_pat = '/',

	-- https://datamarket.azure.com/dataset/bing/search
	bing_api_key = '',
	-- http://last.fm/api
	-- http://api.biblia.com
	-- http://thecatapi.com/docs.html
	-- http://api.nasa.gov
	-- http://tech.yandex.com/keys/get
	-- http://developer.simsimi.com/signUp

	errors = { -- Generic error messages.
		generic = 'An unexpected error occurred.',
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

	plugins = { -- To enable a plugin, add its name to the list.
		'control',
		'blacklist',
		'about',
		'ping',
		'whoami',
		'nick',
		'echo',
		'setandget',
--		'pr0',
--		'rule34',
		'dogify',
		'boobs',
		'newline',
		'wikipedia',
		'hackernews',
		'calc',
		'lastfm',
		'urbandictionary',
		'time',
		'eightball',
		'dice',
		'reddit',
		'xkcd',
		'slap',
		'commit',
		'pun',
		'currency',
		'cats',
		'reactions',
		'shout',
		-- Put new plugins above this line.
		'help',
		'greetings'
	}

}
