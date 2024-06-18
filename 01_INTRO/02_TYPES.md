---
layout: default
section_title: "Introduction to ROS"
section_url: /01_INTRO/README.html
title_url: /01_INTRO/02_TYPES.html
title: "ROS Data Types"
description: "Data packets commonly used in mobile robotics are illustrated"
---

In ROS data packets are standardized, and all the calculations are done with physical units, just like in a physics problem. 

This approach allows the same algorithm to run on different robots. There are many ROS Data Types, and custom data types can be also created programmatically. 

We outline some of the most basic ROS data types that is relevant to our robot.

#### Twist

```
geometry_msgs/msg/Vector3 linear
geometry_msgs/msg/Vector3 angular
```
Includes Vector3 for linear and angular speeds. If the robot is a planar robot, then we are only interested in `linear.x` and `angular.z` elements of those vectors. The first contains the linear speed of the robot in `meters / second` and the latter contains the angular speed of the robot given in `radians / second`. These two values can make the robot follow any given trajectory in 2D.

#### Odometry

```
std_msgs/msg/Header header
string child_frame_id
geometry_msgs/msg/PoseWithCovariance pose
geometry_msgs/msg/TwistWithCovariance twist
```

Odometry message contains Header, Child Frame ID, Pose and Twist data. Header contains the Timestamp and Frame ID of the measurement.
Pose contains the X, Y positions and the quaternion for the orientation. Twist contains the measured linear and angular speeds of the robot. When we give the robot a Twist command, those are target values. The actual values are measured in and published on the odometry message. Again the measured values are in `meters / second` and `radians / second`.

#### JointState

```
std_msgs/msg/Header header
string[] name
double[] position
double[] velocity
double[] effort
```
JointState message arrays for storing name, position, velocity, effort related to any link. For our purposes we keep `wheel_right_joint` and `wheel_right_joint` positions.

The position is given in radians 0 to 6.283185.

#### Imu

```
std_msgs/msg/Header header
geometry_msgs/msg/Quaternion orientation
geometry_msgs/msg/Vector3 angular_velocity
geometry_msgs/msg/Vector3 linear_acceleration
double[9] orientation_covariance
double[9] angular_velocity_covariance
double[9] linear_acceleration_covariance
```

Imu sensor measures raw accelerometer and gyro data, and calculates an orientation with a complementary filter. This data is published as an Imu message, `linear_acceleration`, `angular_velocity`, and the calculated orientation are broadcasted at 10 to 200 hz depending on the configuration of the Imu sensor.

#### MagneticField

```
std_msgs/msg/Header header
geometry_msgs/msg/Vector3 magnetic_field
double[9] magnetic_field_covariance
```

The IMU sensor also measures the earth's magnetic field in 3 axes. We can use this data as a compass, correcting gyroscope and accelerometer data against gyro drift produced by earth's rotation.

#### Header

```
builtin_interfaces/msg/Time stamp
string frame_id
```

The header field contains `timestamp` and `frame_id` which is common to most datatypes above. The `timestamp` has some nanoseconds accuracy.


Odometry data is calculated from sensors for the `odom` coordinate frame. As the robot moves, errors from the odometry sensor will accumulate rendering the long term measurements useless. 

However, cartographer_node using both lidar measurements and odometry, calculates a transformation between map and `odom` frames so the data can be useful. This is exactly what a localization system does.

__Next Chapter:__ [ROS Commands](03_COMMANDS.md)
