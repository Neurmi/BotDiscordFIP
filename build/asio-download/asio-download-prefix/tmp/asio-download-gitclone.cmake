
if(NOT "/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitinfo.txt" IS_NEWER_THAN "/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps/asio"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps/asio'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout "https://github.com/chriskohlhoff/asio.git" "asio"
    WORKING_DIRECTORY "/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/chriskohlhoff/asio.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout master --
  WORKING_DIRECTORY "/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps/asio"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps/asio"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/hoernel/Documents/Programme c++/BotDiscord/deps/sleepy-discord/deps/asio'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitinfo.txt"
    "/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/hoernel/Documents/Programme c++/BotDiscord/build/asio-download/asio-download-prefix/src/asio-download-stamp/asio-download-gitclone-lastrun.txt'")
endif()

