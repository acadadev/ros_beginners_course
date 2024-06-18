---
layout: default
section_title: "Introduction to ROS"
section_url: /01_INTRO/README.html
title_url: /01_INTRO/04_PARAMETERS.html
title: "ROS Parameters"
description: "ROS comes with a dictionary of parameters that can be accessed from any node programatically"
---

#### YAML Files

ROS comes with a dictionary of parameters that can be accessed from any node programmatically. Parameters can also be configured using yaml files. The yaml file below shows partial parameters for the rosrider_node. This is where we configure a hardware node using a yaml file that is read at the start of the robot. This way configurations can be shared between robots and roboticists for ROS programs.

```yaml
/rosrider_node:
 ros__parameters:
   I2C_ENABLED: True
   ODOM_FRAME_ID: 'odom'
   BASE_FRAME_ID: 'base_footprint'
   BROADCAST_TF2: True
   PUB_ODOMETRY: True
   PUB_JOINTS: True
   PUB_DIAGNOSTICS: True
   ROS2RPI_CONFIG: 0x33
   AUTO_SYNC: True
   DEBUG: False
   CONFIG_FLAGS: 48
   UPDATE_RATE: 20
   ALLOWED_SKIP: 3
   PWM_DIV: 64
   DRIVE_MODE: 3
   MONITOR_RATE: 100
   PWM_SCALE: 256
```

ROS program nodes read these yaml files and configure themselves accordingly. Detailed tunings can be performed without changing the code taking advantage of this parametric configuration systems.

#### ros2 param list

The below command lists parameters for a ldlidar node.

```console
can@ubuntu:~$ ros2 param list /ldlidar
  lidar_frame
  range_threshold
  serial_port
  topic_name
  use_sim_time
```

#### ros2 param get

The below command gets the parameter topic_name from ldlidar node.

```console
can@ubuntu:~$ ros2 param get /ldlidar topic_name
String value is: scan
```

__Next Chapter:__ [Basic Robotics Concepts in ROS](../02_CONCEPTS/README.md)
