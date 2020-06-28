#!/bin/bash
export DISPLAY=:0.0
docker run -v /tmp/.X11-unix:/tmp/.X11-unix  -v /home/iraj/Downloads/jmiter/test_data:/jmeter -e DISPLAY=unix$DISPLAY   --rm egaillardon/jmeter jmeter.sh
