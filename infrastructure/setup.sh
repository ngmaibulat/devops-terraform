#!/bin/bash

mkdir -p /opt/someapp

systemctl list-units > /opt/someapp/units.txt

sudo apt update

apt install -y nala nginx python3-pip python-is-python3

sudo nala install -y mc

systemctl enable nginx
systemctl start nginx
