#!/bin/bash
#
sudo apt update -y
sudo apt upgrade -y
#
sudo apt install net-tools bridge-utils wireless-tools libnss-mdns libffi-dev libssl-dev python-is-python3 python3-pip mosh locales software-properties-common curl gnupg lsb-release -y
#
sudo apt remove --purge modemmanager -y
sudo apt remove --purge gpsd -y
sudo apt autoremove -y
#
sudo snap disable lxd
#
sudo apt autoremove -y
#
sudo reboot
