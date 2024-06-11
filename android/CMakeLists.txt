cmake_minimum_required(VERSION 3.9.0)
project(react-native-matrix-rust-sdk)

set (CMAKE_VERBOSE_MAKEFILE ON)
set (CMAKE_CXX_STANDARD 17)

# Specifies a path to native header files.
include_directories(
    ../cpp
    ../cpp/generated

    ../node_modules/uniffi-bindgen-react-native/cpp/includes
)

add_library(
    ${CMAKE_PROJECT_NAME} SHARED
    ../cpp/react-native-matrix-rust-sdk.cpp
    ../cpp/generated/rondpoint.cpp
    cpp-adapter.cpp
)

find_package(ReactAndroid REQUIRED CONFIG)
find_library(LOGCAT log)

target_link_libraries(
  ${CMAKE_PROJECT_NAME}
  ReactAndroid::jsi
  ReactAndroid::turbomodulejsijni
  ReactAndroid::react_nativemodule_core
  ${LOGCAT}
)

# link_libraries(jsi)
# target_link_libraries(${CMAKE_PROJECT_NAME} jsi)
