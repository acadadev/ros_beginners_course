---
layout: default
section_title: "Basic Robotics Concepts in ROS"
section_url: /02_CONCEPTS/README.html
title_url: /02_CONCEPTS/04_LOCALIZATION.html
title: "Localization"
description: "Robot Localization Systems explained with ROS examples"
---

Robot localization is the process of determining where a mobile robot is located with respect to its environment. Localization is one of the most fundamental competencies required by an autonomous robot as the knowledge of the robot's own location is an essential precursor to making decisions about future actions.

ROS provides `robot_localization` package, which is a collection of state estimation nodes, each of which is an implementation of a nonlinear state estimator for robots moving in 3D space. It contains two state estimation nodes, `ekf_localization_node` and `ukf_localization_node`. In addition, `robot_localization` provides `navsat_transform_node`, which aids in the integration of GPS data.


[TODO: VIDEO: RVIZ visualization /odometry/filtered]


##### Configuration 

Below is the configuration for `robot_localization` package for a planar robot with encoders and imu. The data from encoders and imu are fused to generate a more robust, corrected odometry at `/odometry/filtered` topic.

```
ekf_filter_node:
    ros__parameters:
        frequency: 10.0
        sensor_timeout: 0.1
        two_d_mode: true
        transform_time_offset: 0.0
        transform_timeout: 0.0
        print_diagnostics: true
        debug: false
        debug_out_file: /tmp/ekf_debug.txt
        permit_corrected_publication: true
        publish_acceleration: false
        publish_tf: true
        map_frame: map
        odom_frame: odom
        base_link_frame: base_footprint
        world_frame: odom
        odom0: odom
        # The order of the values is x, y, z, roll, pitch, yaw, vx, vy, vz, vroll, vpitch, vyaw, ax, ay, az.
        # [vx, vy, vyaw]
        odom0_config: [false, false, false,
                       false, false, false,
                       true,  true,  false,
                       false, false, true,
                       false, false, false]

        odom0_queue_size: 3
        odom0_nodelay: false
        odom0_differential: false
        odom0_relative: false

        odom0_pose_rejection_threshold: 6.283185  # 2 PI
        odom0_twist_rejection_threshold: 4.712388 # 3/2 PI

        imu0: imu/data
        # The order of the values is x, y, z, roll, pitch, yaw, vx, vy, vz, vroll, vpitch, vyaw, ax, ay, az.
        # [roll, pitch, yaw, vyaw, ax]
        imu0_config: [false, false, false,
                      true,  true,  true,
                      false, false, false,
                      false, false, true,
                      true, false, false]

        imu0_nodelay: false
        imu0_differential: false
        imu0_relative: true
        imu0_queue_size: 6

        imu0_pose_rejection_threshold: 6.283185  # 2 PI
        imu0_twist_rejection_threshold: 6.283185  # 2 PI
        imu0_linear_acceleration_rejection_threshold: 9.81 # 1G

        imu0_remove_gravitational_acceleration: true

        use_control: true
        stamped_control: false
        control_timeout: 0.1
        control_config: [ true, false, false, false, false, true ]

        acceleration_limits: [1.3, 0.0, 0.0, 0.0, 0.0, 3.4]
        deceleration_limits: [1.3, 0.0, 0.0, 0.0, 0.0, 4.5]
        acceleration_gains: [0.8, 0.0, 0.0, 0.0, 0.0, 0.9]
        deceleration_gains: [1.0, 0.0, 0.0, 0.0, 0.0, 1.0]
```

##### References

- https://docs.ros.org/en/melodic/api/robot_localization/html/index.html
- https://github.com/methylDragon/ros-sensor-fusion-tutorial
  
__Next Section:__ [LIDAR](05_LIDAR.md) 


