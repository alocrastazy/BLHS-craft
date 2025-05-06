# fetch the matching Waterfall build and overwrite bungee.jar
wget -qO bungee/bungee.jar \
  https://papermc.io/api/v2/projects/waterfall/versions/1.19-R0.1-SNAPSHOT/builds/526/downloads/waterfall-1.19-R0.1-SNAPSHOT-526.jar

#!/bin/bash
echo "Patching BungeeCord to listen on port $PORT…"
# Replace the listener port line in bungee/config.yml
sed -i "s/host: 0\.0\.0\.0:.*/host: 0.0.0.0:${PORT}/" bungee/config.yml

echo "Starting BungeeCord on port $PORT…"
cd bungee
java -Xmx1024M -Xms1024M -jar bungee.jar
