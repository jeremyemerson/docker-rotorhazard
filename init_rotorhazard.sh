#!/bin/bash

# move files
cp -R /tmp/rotorhazard/RotorHazard/* /opt/rotorhazard

# remove temp files
# rm -rf /tmp/rotorhazard/RotorHazard

# start server
cd /opt/rotorhazard/src/server
python server.py