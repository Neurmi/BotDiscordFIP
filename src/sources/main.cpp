#include "sleepy_discord/sleepy_discord.h"
#include "../includes/BotClass.h"
#include <iostream>
#include <string>

int main() 
{
    std::string Token = "ToKen";

	BotClass client(Token, SleepyDiscord::USER_CONTROLED_THREADS);
	client.run();
}
