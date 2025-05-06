# In main.sh before you launch, overwrite bungee.jar:
wget -qO bungee/bungee.jar https://ci.md-5.net/job/BungeeCord/lastStableBuild/artifact/bootstrap/target/BungeeCord.jar

#!/bin/bash
echo "Patching BungeeCord to listen on port $PORT…"
# Replace the listener port line in bungee/config.yml
sed -i "s/host: 0\.0\.0\.0:.*/host: 0.0.0.0:${PORT}/" bungee/config.yml

echo "Starting BungeeCord on port $PORT…"
cd bungee
java -Xmx1024M -Xms1024M -jar bungee.jar
