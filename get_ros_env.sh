#!/bin/bash

# Option 1:
# Make the script executable:
# chmod +x get_ros_env.sh
# Run the script:
# ./get_ros_env.sh

# Option 2:
# bash get_ros_env.sh

ros_env="AMENT_PREFIX_PATH CMAKE_PREFIX_PATH COLCON_PREFIX_PATH PKG_CONFIG_PATH PYTHONPATH LD_LIBRARY_PATH PATH ROS_DISTRO ROS_PYTHON_VERSION ROS_LOCALHOST_ONLY ROS_VERSION"
env_string=""
for e in ${ros_env}; do
    env_string+="$e=${!e};"
done
echo "$env_string"