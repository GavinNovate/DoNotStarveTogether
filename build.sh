#!/bin/bash
steamcmd_dir="$HOME/SteamCmd"
config_dir="$HOME/.klei/DoNotStarveTogether"
install_dir="$HOME/DoNotStarveTogetherServer"
cluster_name="Moon"

# evn
sudo apt install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386

# install steamcmd
wget -P "$steamcmd_dir" http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar -zxvf "$steamcmd_dir/steamcmd_linux.tar.gz" -C "$steamcmd_dir" && rm "$steamcmd_dir/steamcmd_linux.tar.gz"

# install DoNotStarveTogetherServer
"$steamcmd_dir/steamcmd.sh" +force_install_dir "$install_dir" +login anonymous +app_update 343050 +quit

# copy config
mkdir -p "$config_dir"
cp -r Moon/ "$config_dir"

# mods
mkdir -p "$install_dir/mods"
cp dedicated_server_mods_setup.lua "$install_dir/mods"
