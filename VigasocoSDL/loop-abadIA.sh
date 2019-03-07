#!/bin/bash

export DISPLAY=:0
Xvfb -screen 0 800x600x16 &
x11vnc &

while true
do
  ./abadIA
done
