#!/bin/bash

echo "Starting X server and the VNC server"
export DISPLAY=:0
Xvfb -screen 0 800x600x16 &
x11vnc &

while true
do
  echo "Running the loop of VNC AbadIA engine"
  ./abadIA
done
