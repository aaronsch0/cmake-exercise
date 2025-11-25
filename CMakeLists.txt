cmake_minimum_required(VERSION 3.16)
project(sse_cmake_exercise)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Boost REQUIRED COMPONENTS filesystem system)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

set(SOURCE_FILES
    fem/fem.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    yamlParser/yamlParser.cpp
)

add_executable(${PROJECT_NAME} main.cpp ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME}
    ${Boost_LIBRARIES}
    yaml-cpp
)

DEAL_II_SETUP_TARGET(${PROJECT_NAME})
