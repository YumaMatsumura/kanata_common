macro(kanata_package)
  # Set compile options
  if(NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
  endif()
  if(CMAKE_CXX_COMPILER_ID MATCHES "^(GNU|Clang|AppleClang)$")
    add_compile_options(-Wall -Wextra -Wpedantic)
    if(CMAKE_VERSION VERSION_GREATER_EQUAL "3.24.0")
      option(CMAKE_COMPILE_WARNING_AS_ERROR "Treat compiler warnings as errors." ON)
      mark_as_advanced(CMAKE_COMPILE_WARNING_AS_ERROR)
    else()
      add_compile_options(-Werror)
    endif()
  endif()

  # Ignore unnecessary CMake warnings
  set(__dummy__ ${CMAKE_EXPORT_COMPILE_COMMANDS})

  # Find dependencies
  find_package(ament_cmake_auto REQUIRED)
  ament_auto_find_build_dependencies()

  # Find test dependencies
  if(BUILD_TESTING)
    find_package(ament_lint_auto REQUIRED)
    ament_lint_auto_find_test_dependencies()
  endif()
endmacro()
