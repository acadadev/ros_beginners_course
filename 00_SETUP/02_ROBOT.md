---
layout: default
section_title: "Robot and Workstation Setup"
section_url: /00_SETUP/README.html
title_url: /00_SETUP/02_ROBOT.html
title: "Robot Setup"
description: "Robot Setup for Ubuntu 22.04"
---

##### Robot Install RaspberryPI4

```shell
source 01_ubuntu_post.sh
source 02_rpi_install_libs.sh
source 04_humble_pre.sh
source 05_humble_robot.sh
source 07_humble_post.sh
source 08_humble_perception.sh
source 20_rpi_userland.sh
```

##### Robot Install Generic

```shell
source 01_ubuntu_post.sh
source 04_humble_pre.sh
source 05_humble_robot.sh
source 07_humble_post.sh
source 08_humble_perception.sh
```

__Next Section:__ [Environment](03_ENVIRONMENT.md)
