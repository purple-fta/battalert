# Battalert

Battalert is a lightweight Bash script for Linux that monitors your battery level, notifies you when the charge is low, and automatically shuts down your laptop at a critical level. It is perfect for minimalistic window managers such as bspwm.

## Features

- Low battery notification
- Critical battery notification and automatic shutdown
- Minimal system resource usage
- Simple configuration

## Installation

1. Copy the script to a convenient location, for example:
   `~/battalert.sh`
2. Make the file executable:
   `chmod +x ~/battalert.sh`
3. Add the script to your autostart depending on your system. For bspwm, add to `bspwmrc`:
   `~/battalert.sh &`

## Requirements

- Any notification daemon that supports `notify-send` (e.g., dunst, xfce4-notifyd, notify-osd, etc.)
- The `notify-send` utility

## Configuration

You can change the following parameters at the beginning of the script: