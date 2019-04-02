#!/bin/bash
echo "Adding necessary respositories"
sudo add-apt-repository universe -y;
sudo add-apt-repository ppa:jonathonf/ffmpeg-3 -y;
sudo apt update;
echo "Installing all necessary packages"
sudo apt install python3 python3-pip espeak ffmpeg libopus0 opus-tools git -y;
echo "Preventing pip from being upgraded to avoid conflicts with pip3"
sudo apt-mark hold python-pip
echo "Upgrading all other packages"
sudo apt upgrade -y;
echo "Installing necessary Python3 packages"
pip3 install -r requirements.txt;
echo "Creating secret_key.txt necessary for Discord server authentication"
touch secret_key.txt;
echo "$1" >> secret_key.txt;
