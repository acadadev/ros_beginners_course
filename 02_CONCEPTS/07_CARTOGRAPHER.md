---
layout: default
section_title: "Basic Robotics Concepts in ROS"
section_url: /02_CONCEPTS/README.html
title_url: /02_CONCEPTS/07_CARTOGRAPHER.html
title: "Cartographer"
description: "Cartographer is Google's solution to robot localization mappnig problem. "
---

Cartographer is Google's solution to robot localization mappnig problem. It is built on ROS therefore you can run it on your robot as well. 

[![Cartographer Video](https://img.youtube.com/vi/DM0dpHLhtX0/maxresdefault.jpg)](https://www.youtube.com/watch?v=DM0dpHLhtX0
)

Using the lidar and odometry data, cartographer generates a map as the robot is moved. This map can be saved and used for navigation later on.

To launch cartographer on your computer:
```
ros2 launch rosrider_cartographer cartographer.launch.py use_sim_time:=False launch_rviz:=True
```

[![Cartographer Video](https://img.youtube.com/vi/VQr9q23jddA/maxresdefault.jpg)](https://www.youtube.com/watch?v=VQr9q23jddA
)


If cartographer is running on the robot, set `launch_rviz` to `False`, if running on a desktop setting it to `True` will launch RVIZ visualization program. If used with a simulator, set `use_sim_time` to `True`. 

For running cartographer in a simulation environment [see](08_SIMULATIONS.md)

__Next Section:__ [Navigation](08_NAVIGATION.md)
