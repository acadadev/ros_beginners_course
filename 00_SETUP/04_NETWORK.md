---
layout: default
section_title: "Robot and Workstation Setup"
section_url: /00_SETUP/README.html
title_url: /00_SETUP/04_NETWORK.html
title: "Network Setup"
description: "Network Setup for running ROS"
---

#### Add WiFi networks without reinitializing the SD card

To add networks at a later stage or modify existing settings, edit the `/etc/netplan/50-cloud-init.yaml` file on your robot.

```shell
sudo nano /etc/netplan/50-cloud-init.yaml
```

The file should look like:
```
network:
    version: 2
    wifis:
        renderer: networkd
        wlan0:
            access-points:
                SKYNET:
                    password: PASSWORD_STRING
            dhcp4: true
            optional: true
```

After modifying it, execute `sudo netplan generate` and `sudo netplan apply`. 

If you can't reach your robot, you can remove the SDCard from the RaspberryPI, and connect to a computer by means of an SDCard reader. You can manually edit this file then boot the RaspberryPI with the SDCard to gain access to your robot.

#### Test if the robot is connected to Internet

Execute the following command on the robot

```
ubuntu@robot$ sudo curl google.com
```

If connected to internet, command will return html from google.
```
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
```

#### Bridge the internet connection through your laptop with ethernet

If you can connect to the internet in an environment but your robot can't follow the procedure below to bridge the connection between your laptop and your robot whenever you need internet access on the robot.

- Connect your laptop to a wireless network
- Connect robot to your laptop with an ethernet cable
- Make new Ethernet connection:
    - `nm-connection-editor`
    - Click "+"
    - Type -> Ethernet
    - Connection Name: "Shared to Robot"
    - Select `IPV4` tab
    - Select Method
    - Select "Shared to other computers"
    - Click apply

Now you should be able to SSH to your robot.

```shell
ssh robot
```

__Next Section:__ [Introduction to ROS](../01_INTRO/README.md)
