[![forthebadge made-with-python](http://ForTheBadge.com/images/badges/made-with-python.svg)](https://www.python.org/)

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)
[![Requirements Status](https://requires.io/github/CodeSammich/discord-bot/requirements.svg?branch=master)](https://requires.io/github/CodeSammich/discord-bot/requirements/?branch=master)

# Table of Contents
  * [Introduction](#discord-bot)
  * [Usage](#usage)
  * [Installation](#installation)
    * [Local Windows](#local-windows)
    * [Ubuntu 18.04](#ubuntu-1804)
      * [Automatic Install](#automatic-install)
      * [Manual Install](#manual-install)
  * [FAQ](#faq)

# discord-bot
Discord Bot for Time Keeping in MapleStory

This bot's timer is tuned for the Verus/True Hilla boss fight.

It can be deployed on up to as many servers per host as Discord allows per application in the [Discord Developer Portal](https://discordapp.com/developers/applications/).

**Special Thanks:**
- **[ThiefGMS](https://www.youtube.com/channel/UCzCehIR4x1NHz67pOLsODmw)** for his mp3 files and insight into the Verus Hilla fight, as well as the inspiration for this project!
- **[MapleStory.gg](https://maplestory.gg/)** for being the first to test and work with me
- **catboy#7193** for cracking the concurrency and scalability problems

**Boss Timer Mechanics:**
- 16s from start to hourglass timer (29:44)
- First interval 150s (27:14, etc.)
- When HP hits 25% on the second HP bar, interval becomes 125s  (requires !2 input from the player)
- When HP hits 20% on the third HP bar, interval becomes 100s   (requires !3 input from the player)

**NOTE:**
This bot may not always be 100% accurate to the real fight due to unresolvable latency issues with both the Nexon and Discord servers. There may be a variance of 0-5s from actual game.

# Usage
**Commands include:**

`!start` or `!join` or `!fight` to start timer and allow bot to enter user's voice channel

`!2` for phase 2 (use after 1.75 HP bars have depleted)

`!3` for phase 3 (use after 2.75 HP bars have depleted)

`!stop` or `!leave` to disconnect the bot.

`!help` to see this description.

# Installation
[Unfortunately, Discord Voice Chat does not work with free web servers like Heroku](https://stackoverflow.com/questions/53074580/discord-py-opus-heroku-issues) 

You must either deploy **locally** or on a **paid cloud server** (e.g. AWS, DigitalOcean).

## Local Windows
Primarily for players who want to host the bot for personal use during gameplay. This method is not recommended for long-term hosting.

You must install [Ubuntu 18.04 via the Windows Store](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab). 

Once installed, run, and you will be asked to enter a new UNIX username and password. Make sure to type accurately and carefully. You will not be able to see your password when typing it.

Continue onto the following section once you are done.

## Ubuntu 18.04
**Strongly suggested to use Python 3.6. Please verify with python3 --version**

Currently, the only tested platform is **Ubuntu 18.04**. Other Linux distributions may work as well.

To install, run the following commands. You will be asked for your password:

### Automatic Install

If the automatic install fails, go to [Manual Install](#manual-install).

**1) Clone the repository**

> cd ~ && sudo apt install git -y && git clone https://github.com/CodeSammich/discord-bot && cd ~/discord-bot

**2) Go to the [Discord Developer Portal](https://discordapp.com/developers/applications/) and create a project.**
**Under the `Bot` section, create a bot and copy the Token by clicking `Copy`.**

**Then, right click on the Ubuntu window to paste into the command line (where "key" is, no "" quotes):**

> sudo chmod +x ~/discord-bot/setup.sh && sh ~/discord-bot/setup.sh "key"

**3) Before running the bot, please make sure to follow this permissions link and approve the bot's entry to your Discord server. Replace CID with your [client id located here](https://imgur.com/a/A1p0tAI)**

https://discordapp.com/api/oauth2/authorize?client_id=CID&permissions=37084480&scope=bot

**4) Run the bot with:**

> python3 app.py

**You should see a message [like this](http://prntscr.com/n4yrzt)**

### Manual Install

**1) Update apt:**

> sudo add-apt-repository universe

> sudo add-apt-repository ppa:jonathonf/ffmpeg-3

> sudo apt update

**2) Install Python 3.6, Pip3, [Espeak](http://espeak.sourceforge.net/), and [FFMPEG](https://linuxize.com/post/how-to-install-ffmpeg-on-ubuntu-18-04/), [libopus](http://ubuntuhandbook.org/index.php/2017/06/install-opus-1-2-audio-library-in-ubuntu-16-04-14-04/):**

> sudo apt install python3 python3-pip espeak ffmpeg libopus0 opus-tools git -y

**3) Clone this repository and install required Pip packages:**

> git clone https://github.com/CodeSammich/discord-bot

> cd discord-bot

> pip3 install -r `requirements.txt`

**4) Create a file for the Discord bot secret key:**

> touch secret_key.txt

**5) Go to the [Discord Developer Portal](https://discordapp.com/developers/applications/) and create a project.**
**Under the `Bot` section, create a bot and copy the Token by clicking `Copy`.**

**Then, right click on the Ubuntu window to paste into the command line (where "key" is, no "" quotes):**
  
> echo "key" >> secret_key.txt

**MAKE SURE THE KEY IS CORRECT, OTHERWISE THE BOT WILL NOT RECOGNIZE YOUR DISCORD SERVER.**

**6) Before running the bot, please make sure to follow this permissions link and approve the bot's entry to your Discord server. Replace CID with your [client id located here](https://imgur.com/a/A1p0tAI)**

https://discordapp.com/api/oauth2/authorize?client_id=CID&permissions=37084480&scope=bot

**7) Finally, run the bot:**

> python3 app.py

**You should see a message [like this](http://prntscr.com/n4yrzt)**

# FAQ

### "Cannot connect to voice channel, request timed out. Try checking your channel/bot permissions."

If `!2`, `!3`, and `!stop` commands are returning text responses, but `!start` is not joining the voice channel or otherwise not working properly, make sure your voice channels have correct permissions. Use the permissions link from the previous section and make sure that bot role is added explicitly to your voice channel permissions.

### Where can I use this without installation?

As of April 2nd, 2019, [Reboot Central](https://discord.gg/Rfs6huP) has added this server for public use.

If you would like to invite this bot to your own server, just follow [this invite link.](https://discordapp.com/oauth2/authorize?client_id=561450974422630410&permissions=37084480&scope=bot)
