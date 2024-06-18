---
layout: default
section_title: "Introduction to ROS"
section_url: /01_INTRO/README.html
title_url: /01_INTRO/03_COMMANDS.html
title: "Basic ROS Commands"
description: "ROS command line tools explained"
---

These are the commands to explore a new robotic system.

#### ros2 topic list

Returns a list of topics for both publishers and subscribers. Below is a list of topics available on a simple robot.

```console
can@ubuntu:~$ ros2 topic list
/cmd_vel
/joint_states
/odom
/parameter_events
/robot_description
/rosout
/rosrider/diagnostics
/scan
/tf
/tf_static
```

#### ros2 topic echo

Listen on the given topic name and prints its output to the terminal.

Below command prints `/odom` topic:

```console
can@ubuntu:~$ ros2 topic echo /odom
header:
  stamp:
    sec: 1716665922
    nanosec: 124206471
  frame_id: odom
child_frame_id: base_footprint
pose:
  pose:
    position:
      x: 0.0
      y: 0.0
      z: 0.0
    orientation:
      x: 0.0
      y: 0.0
      z: 0.0
      w: 1.0
twist:
  twist:
    linear:
      x: 0.0
      y: 0.0
      z: 0.0
    angular:
      x: 0.0
      y: 0.0
      z: 0.0
```

Below command prints wheel positions:

```console
can@ubuntu:~$ ros2 topic echo  /joint_states
header:
  stamp:
    sec: 1716666515
    nanosec: 667963578
  frame_id: ''
name:
- wheel_left_joint
- wheel_right_joint
position:
- 0.0
- 0.0
velocity: []
effort: []
```

##### ros2 topic info

Prints information about which node is publishing the topic, and which nodes are subscribed to this topic, as well as the message data type. 

```console
can@ubuntu:~$ ros2 topic info /odom
Type: nav_msgs/msg/Odometry
Publisher count: 1
Subscription count: 1
```

The -vvv flag will provide verbose output.

```console
can@ubuntu:~$ ros2 topic info /odom -vvv
Type: nav_msgs/msg/Odometry

Publisher count: 1

Node name: rosrider_node
Node namespace: /
Topic type: nav_msgs/msg/Odometry
Endpoint type: PUBLISHER
GID: 01.0f.65.91.01.05.d8.7e.01.00.00.00.00.00.12.03.00.00.00.00.00.00.00.00
QoS profile:
  Reliability: RELIABLE
  History (Depth): UNKNOWN
  Durability: VOLATILE
  Lifespan: Infinite
  Deadline: Infinite
  Liveliness: AUTOMATIC
  Liveliness lease duration: Infinite

Subscription count: 1

Node name: _ros2cli_1336
Node namespace: /
Topic type: nav_msgs/msg/Odometry
Endpoint type: SUBSCRIPTION
GID: 01.0f.65.91.38.05.f3.b9.01.00.00.00.00.00.05.04.00.00.00.00.00.00.00.00
QoS profile:
  Reliability: RELIABLE
  History (Depth): UNKNOWN
  Durability: VOLATILE
  Lifespan: Infinite
  Deadline: Infinite
  Liveliness: AUTOMATIC
  Liveliness lease duration: Infinite
```

#### ros2 topic hz

Will measure the publication speed of the topic and report in hertz. When there is a problem with a sensor, use this to verify it is publishing with the desired speed.

```console
can@ubuntu:~$ ros2 topic hz /odom
average rate: 20.001
	min: 0.048s max: 0.052s std dev: 0.00078s window: 22
average rate: 19.998
	min: 0.048s max: 0.052s std dev: 0.00084s window: 42
average rate: 19.996
	min: 0.048s max: 0.052s std dev: 0.00083s window: 62
average rate: 19.998
	min: 0.048s max: 0.052s std dev: 0.00082s window: 83
```

#### ros2 topic pub

The below command publishes to /cmd_vel and will make the robot move in a circular pattern. For the robot to continue moving, `/cmd_vel` must receive data not less than 10 hz.

```console
can@ubuntu:~$ ros2 topic pub /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.1}, angular: {z: 0.1}}" -r 10
publisher: beginning loop
publishing #1: geometry_msgs.msg.Twist(linear=geometry_msgs.msg.Vector3(x=0.1, y=0.0, z=0.0), angular=geometry_msgs.msg.Vector3(x=0.0, y=0.0, z=0.1))
publishing #2: geometry_msgs.msg.Twist(linear=geometry_msgs.msg.Vector3(x=0.1, y=0.0, z=0.0), angular=geometry_msgs.msg.Vector3(x=0.0, y=0.0, z=0.1))
publishing #3: geometry_msgs.msg.Twist(linear=geometry_msgs.msg.Vector3(x=0.1, y=0.0, z=0.0), angular=geometry_msgs.msg.Vector3(x=0.0, y=0.0, z=0.1))

```

Publishes just once
```
ros2 topic pub --once /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.1}, angular: {z: 0.0}}"
```

Publishes at 20 hz
```
ros2 topic pub --rate 20 /cmd_vel geometry_msgs/msg/Twist "{linear: {x: 0.0}, angular: {z: 0.2}}"
```

#### ros2 node list

Lists nodes running on the robot. Each node is a computer program handling specific aspects of the robot.

```console
can@ubuntu:~$ ros2 node list
/ldlidar
/robot_state_publisher
/rosrider_node
```

#### sending static transforms

Used to send static transforms
```
ros2 run tf2_ros static_transform_publisher "0" "0" "0" "0" "0" "0" "map" "odom"
```

#### joystick

Add a common joystick to generate velocity commands
```
ros2 launch teleop_twist_joy teleop-launch.py joy_config:='f710'
```

Activate the feedback motors on the joystick
```
ros2 topic pub -1 /joy/set_feedback sensor_msgs/JoyFeedback "{type: 1, id: 0, intensity: 1.0}"
```

#### rqt plot

Plot anything within the ROS system
```
ros2 run rqt_plot rqt_plot
```

#### saving maps

Save Maps from mapping for use with later navigation
```
ros2 run nav2_map_server map_saver_cli -f ~/map
```

__Next Chapter:__ [Parameter System](04_PARAMETERS.md)
