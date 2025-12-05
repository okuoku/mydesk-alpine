# Replace skk-bin
file(REMOVE_RECURSE ${CMAKE_CURRENT_LIST_DIR}/mydesk/skk-bin)

execute_process(COMMAND
    ${CMAKE_COMMAND} -E copy_directory 
    ${CMAKE_CURRENT_LIST_DIR}/skkbuild/out
    ${CMAKE_CURRENT_LIST_DIR}/mydesk/skk-bin
    RESULT_VARIABLE rr)
if(rr)
    message(FATAL_ERROR "Failed to copy skk-bin")
endif()

execute_process(COMMAND
    docker build --tag mydesk .
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/mydesk
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Failed to build image.")
endif()
