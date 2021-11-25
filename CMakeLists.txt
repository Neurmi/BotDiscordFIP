#CMakeLists.txt
cmake_minimum_required (VERSION 3.6)
project(example)

add_executable(botDiscord src/includes/BotClass.h src/sources/BotClass.cpp src/sources/main.cpp)

#Add these two lines
add_subdirectory(deps/sleepy-discord)
target_link_libraries(botDiscord sleepy-discord)

