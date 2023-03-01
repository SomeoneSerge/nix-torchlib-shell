cmake_minimum_required(VERSION 3.22)

project(NixTorchlibShell LANGUAGES CXX CUDA)

set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)

find_package(Torch REQUIRED)

add_executable(some main.cpp)
target_link_libraries(some PRIVATE ${TORCH_LIBRARIES})

# So that we can us -DCMAKE_INSTALL_RPATH=/run/opengl-driver/lib during development
set_target_properties(some PROPERTIES BUILD_WITH_INSTALL_RPATH TRUE)
