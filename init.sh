# move files
cp -R /tmp/rotorhazard/RotorHazard /opt/rotorhazard \

# remove temp files
# rm -rf /tmp/rotorhazard/RotorHazard

# start server
cd /opt/rotorhazard/RotorHazard/src/server
python server.py