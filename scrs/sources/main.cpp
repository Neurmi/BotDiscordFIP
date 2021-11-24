#include "sleepy_discord/sleepy_discord.h"
#include "../includes/BotClass.h"
#include <iostream>
#include <string>

int main() 
{
    std::string Token = "NzEzMDQ0MDQwODk1MDM3NDYw.XsaYAw.-D5YwodijxCPooj8r0-KYUFk1ZI";

	BotClass client(Token, SleepyDiscord::USER_CONTROLED_THREADS);
	client.run();
}
