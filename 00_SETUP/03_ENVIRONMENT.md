---
layout: default
section_title: "Robot and Workstation Setup"
section_url: /00_SETUP/README.html
title_url: /00_SETUP/03_ENVIRONMENT.html
title: "Environment Setup"
description: "Environment Setup for Ubuntu 22.04"
---

#### Bash Setup

Add these to your .bashrc in both robot and desktop. 

```shell
export LANG=en_US.UTF-8
export ROS_DOMAIN_ID=0
export ROS_VERSION=2
export ROS_PYTHON_VERSION=3
export ROS_DISTRO=humble
export ROS_LOCALHOST_ONLY=0
export ROBOT_MODEL=caretta
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
source /opt/ros/humble/setup.bash
```

#### SSH setup

Use ssh keys to effortlessly login to your robot. Add your public key to `~/.ssh/authorized_keys` file on the robot.

Create a `~/ssh/config` file. Inside put:

```
Host robot
    User ubuntu
    Hostname robot.local
```

Change `Host` for your robot's nickname, `User` to your username on robot's computer and `Hostname` the the robot's hostname. So you can login to your robot:

```shell
ssh robot
```

__Next Section:__ [Networking](04_NETWORK.md)
