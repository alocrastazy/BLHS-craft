#!/bin/bash
set -e

# 1. Grab the official upstream BungeeCord.jar
echo "Downloading BungeeCord..."
wget -qO bungee/bungee.jar \
  https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

# 2. (Optional) patch listener port if you’re on Railway
echo "Patching listener port in config.yml to $PORT…"
sed -i "s/host: 0\.0\.0\.0:.*/host: 0.0.0.0:${PORT}/" bungee/config.yml

# 3. Launch
echo "Starting BungeeCord…"
cd bungee
java -Xmx1024M -Xms1024M -jar bungee.jar