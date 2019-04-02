#!/bin/bash
sudo add-apt-repository universe -y;
sudo add-apt-repository ppa:jonathonf/ffmpeg-3 -y;
sudo apt update;
sudo apt install python3-pip espeak ffmpeg libopus0 opus-tools git -y;
cd ~
git clone https://github.com/CodeSammich/discord-bot
cd ~/discord-bot
pip3 install -r requirements.txt
