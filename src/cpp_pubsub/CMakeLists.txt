## reference: https://www.allaban.me/posts/2020/08/ros2-setup-ide-docker/
## Using a CMakeLists in the Top Level Workspace

# For Dockerfile.ros2-docker-ssh-env
# But only cmake and make work, debugging and executing don't work
# The reason is that the ros2 environment variables are not been set up.

# For Dockerfile.ros2-docker-ssh-sourced-env and Dockerfile.ros2
# cmake and make work, debugging and executing also work

cmake_minimum_required(VERSION 3.5)
project(cpp_pubsub)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)

add_executable(talker src/publisher_member_function.cpp)
ament_target_dependencies(talker rclcpp std_msgs)

add_executable(listener src/subscriber_member_function.cpp)
ament_target_dependencies(listener rclcpp std_msgs)

install(TARGETS
  talker
  listener
  DESTINATION lib/${PROJECT_NAME})

message("install path lib/${PROJECT_NAME}")

ament_package()
