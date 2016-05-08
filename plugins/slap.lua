local command = 'slap [target]'
local doc = [[```
/slap [target]
Slap somebody.
```]]

local triggers = {
	'^/slap[@'..bot.username..']*',
	'^/cuddle[@'..bot.username..']*'
}

local cuddles = {
	'VICTIM was cuddled by VICTOR.',
	'VICTIM feels loved in VICTOR\'s embrace.',
	'VICTOR takes VICTIM into their arms.',
	'VICTOR shows VICTIM their appreciation.',
	'VICTOR holds VICTIM closely.',
	'VICTIM got licked by VICTOR.',
	'VICTIM can\'t escape VICTOR\'s love.',
	'VICTOR won\'t let go of VICTIM.',
	'VICTOR and VICTIM get into the same bed.',
	'VICTOR and VICTIM are happy toghether.',
	'VICTIM gets kissed by VICTOR.',
	'VICTOR kisses VICTIM amiably.',
	'VICTOR strokes VICTIM\'s fur.',
	'VICTOR looks deeply into VICTIM\'s bright eyes.',
	'VICTOR looks at VICTIM. VICTIM looks back. VICTOR blushes and looks away.',
	'VICTOR floofs VICTIM with their soft fur.',
	'VICTIM shudders as they get floofed softly.',
	'VICTIM relaxes as they cuddle with VICTOR.',
	'VICTIM can\'t get enough of VICTOR\'s cluddles.',
	'VICTOR and VICTIM enjoy their time toghether.',
	'VICTIM has been overfloofed.'

}

local slaps = {
	'VICTIM was shot by VICTOR.',
	'VICTIM was pricked to death.',
	'VICTIM walked into a cactus while trying to escape VICTOR.',
	'VICTIM drowned.',
	'VICTIM drowned whilst trying to escape VICTOR.',
	'VICTIM blew up.',
	'VICTIM was blown up by VICTOR.',
	'VICTIM hit the ground too hard.',
	'VICTIM fell from a high place.',
	'VICTIM fell off a ladder.',
	'VICTIM fell into a patch of cacti.',
	'VICTIM was doomed to fall by VICTOR.',
	'VICTIM was blown from a high place by VICTOR.',
	'VICTIM was squashed by a falling anvil.',
	'VICTIM went up in flames.',
	'VICTIM burned to death.',
	'VICTIM was burnt to a crisp whilst fighting VICTOR.',
	'VICTIM walked into a fire whilst fighting VICTOR.',
	'VICTIM tried to swim in lava.',
	'VICTIM tried to swim in lava while trying to escape VICTOR.',
	'VICTIM was struck by lightning.',
	'VICTIM was slain by VICTOR.',
	'VICTIM got finished off by VICTOR.',
	'VICTIM was killed by magic.',
	'VICTIM was killed by VICTOR using magic.',
	'VICTIM starved to death.',
	'VICTIM suffocated in a wall.',
	'VICTIM fell out of the world.',
	'VICTIM was knocked into the void by VICTOR.',
	'VICTIM withered away.',
	'VICTIM was pummeled by VICTOR.',
	'VICTIM was fragged by VICTOR.',
	'VICTIM was desynchronized.',
	'VICTIM was wasted.',
	'VICTIM was busted.',
	'VICTIM\'s bones are scraped clean by the desolate wind.',
	'VICTIM has died of dysentery.',
	'VICTIM fainted.',
	'VICTIM is out of usable Pokemon! VICTIM whited out!',
	'VICTIM is out of usable Pokemon! VICTIM blacked out!',
	'VICTIM whited out!',
	'VICTIM blacked out!',
	'VICTIM says goodbye to this cruel world.',
	'VICTIM got rekt.',
	'VICTIM was sawn in half by VICTOR.',
	'VICTIM died. I blame VICTOR.',
	'VICTIM was axe-murdered by VICTOR.',
	'VICTIM\'s melon was split by VICTOR.',
	'VICTIM was slice and diced by VICTOR.',
	'VICTIM was split from crotch to sternum by VICTOR.',
	'VICTIM\'s death put another notch in VICTOR\'s axe.',
	'VICTIM died impossibly!',
	'VICTIM died from VICTOR\'s mysterious tropical disease.',
	'VICTIM escaped infection by dying.',
	'VICTIM played hot-potato with a grenade.',
	'VICTIM was knifed by VICTOR.',
	'VICTIM fell on his sword.',
	'VICTIM ate a grenade.',
	'VICTIM practiced being VICTOR\'s clay pigeon.',
	'VICTIM is what\'s for dinner!',
	'VICTIM was terminated by VICTOR.',
	'VICTIM was shot before being thrown out of a plane.',
	'VICTIM was not invincible.',
	'VICTIM has encountered an error.',
	'VICTIM died and reincarnated as a goat.',
	'VICTOR threw VICTIM off a building.',
	'VICTIM is sleeping with the fishes.',
	'VICTIM got a premature burial.',
	'VICTOR replaced all of VICTIM\'s music with Nickelback.',
	'VICTOR spammed VICTIM\'s email.',
	'VICTOR made VICTIM a knuckle sandwich.',
	'VICTOR slapped VICTIM with pure nothing.',
	'VICTOR hit VICTIM with a small, interstellar spaceship.',
	'VICTIM was quickscoped by VICTOR.',
	'VICTOR put VICTIM in check-mate.',
	'VICTOR RSA-encrypted VICTIM and deleted the private key.',
	'VICTOR put VICTIM in the friendzone.',
	'VICTOR slaps VICTIM with a DMCA takedown request!',
	'VICTIM became a corpse blanket for VICTOR.',
	'Death is when the monsters get you. Death comes for VICTIM.',
	'Cowards die many times before their death. VICTIM never tasted death but once.',
	'VICTOR developped an algorithm that slaps VICTIM in O(1).',
	'VICTOR slaps VICTIM with a figurine of VICTOR slapping VICTIM.',
	'VICTOR slaps VICTIM with a figurine of VICTIM.',
	'VICTOR threw VICTIM in a room full of spiders.',
	'VICTOR dared VICTIM to play a game of FNaF. They were scared shitless and died, literally.',
	'I slapped VICTIM for VICTOR.',
	'The floor trembles as VICTIM hits the floor, defeated by VICTOR!',
	'VICTOR breaks a bottle on VICTIM \'s head.',
	'VICTOR slaps VICTIM with a Windows Update.',
	'VICTOR hits VICTIM with a small interstellar spaceship.',
	'VICTOR slaps VICTIM around a bit with a large trout.',
	'VICTOR stabs VICTIM with a key.',
	'VICTOR strangles VICTIM with a power cable.',
	'VICTOR penetrated VICTIM.',
	'VICTOR resetted VICTIM.',
	'VICTOR devoured VICTIM.',
	'VICTIM forgot to pull out.',
	'VICTIM fell out of the world',
	'VICTIM is now only two dimensional.',
	'VICTOR won\'t put up with VICTIM anymore.',
	'VICTOR had their way with VICTIM.'
}

local action = function(msg)

	local victim = msg.text:input()
	if msg.reply_to_message then
		if database.users[tostring(msg.reply_to_message.from.id)].nickname then
			victim = database.users[tostring(msg.reply_to_message.from.id)].nickname
		else
			victim = msg.reply_to_message.from.first_name
		end
	end

	local victor = msg.from.first_name
	if database.users[msg.from.id_str].nickname then
		victor = database.users[msg.from.id_str].nickname
	end

	if not victim then
		victim = victor
		victor = bot.first_name
	end
	local message
	if msg.text_lower:match('cuddle') then
		message = cuddles[math.random(#cuddles)]
	else
		message = slaps[math.random(#slaps)]
	end

	message = message:gsub('VICTIM', victim)
	message = message:gsub('VICTOR', victor)

	message = latcyr(message)

	sendMessage(msg.chat.id, message)

end

return {
	action = action,
	triggers = triggers,
	doc = doc,
	command = command
}
