set(root ${CMAKE_CURRENT_LIST_DIR})

# Replace skk-bin
file(REMOVE_RECURSE ${root}/mydesk/skk-bin)

# Replace .Xdefaults
file(COPY_FILE ${root}/other_configs/Xdefaults ${root}/mydesk/Xdefaults)

# Replase skk-jisyo
file(COPY_FILE ${root}/skk-dict/SKK-JISYO.L ${root}/mydesk/SKK-JISYO.L)

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
