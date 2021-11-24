#include "../includes/BotClass.h"

void BotClass::onMessage(SleepyDiscord::Message message) 
{
	if (message.startsWith("@ hello"))
		sendMessage(message.channelID, "Hello " + message.author.username);
}