# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM osrf/ros:humble-desktop-jammy

# install ros2 packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ros-humble-desktop-full=0.10.0-1* \
    && rm -rf /var/lib/apt/lists/*

RUN . /opt/ros/humble/setup.sh \
    && apt-get update \
    && apt-get install -y python3-pip \
    && pip install transforms3d \
    && apt-get install ros-humble-tf-transformations \
    && apt install -y xauth \
    && apt-get -y install tmux \
    && cd ~ \
    && mkdir -p dev_ws/src \
    && cd dev_ws/src \
    && git clone https://github.com/JACart2/ai-navigation.git \
    && cd .. \
    && chmod +x src/ai-navigation/motor_control/resource/docker_startup_script.sh \
    && ./src/ai-navigation/motor_control/resource/docker_startup_script.sh 




