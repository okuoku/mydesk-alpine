execute_process(COMMAND
    ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_LIST_DIR}/skkbuild/runbuild.cmake
    RESULT_VARIABLE rr)

if(rr)
    message(FATAL_ERROR "Faild to build skk")
endif()
