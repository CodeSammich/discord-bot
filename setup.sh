#!/bin/bash
sudo add-apt-repository universe -y;
sudo add-apt-repository ppa:jonathonf/ffmpeg-3 -y;
sudo apt update;
sudo apt install python3.6 python3-pip espeak ffmpeg libopus0 opus-tools git -y;
pip3 install -r requirements.txt
touch secret_key.txt
echo "$0" >> secret_key.txt
