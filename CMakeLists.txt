cmake_minimum_required(VERSION 3.10)
project(Calculator)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

# Створюємо динамічну бібліотеку (shared)
add_library(calculator SHARED calculator.cpp)

# Виконуваний файл
add_executable(calculator_app main.cpp)

# Лінкуємо виконуваний файл з динамічною бібліотекою
target_link_libraries(calculator_app calculator)

# Вказуємо шлях для пошуку динамічних бібліотек під час виконання
set_target_properties(calculator_app PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
    INSTALL_RPATH "$ORIGIN"
)
