# Don't Starve Together Server
> 参考资料：http://hi.ktsee.com/608.html



## 配置服务器环境

Ubuntu 64 

```shell
sudo apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386
```

Ubuntu 32

```shell
sudo apt-get install libstdc++6 libgcc1 libcurl4-gnutls-dev
```



## 安装SteamCmd

下载 SteamCmd

```shell
mkdir ~/SteamCmd
cd ~/SteamCmd
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar -zxvf steamcmd_linux.tar.gz
rm steamcmd_linux.tar.gz
```



## 安装 Don't Starve Together Server

```shell
./steamcmd.sh +force_install_dir ~/DoNotStarveTogetherServer +login anonymous +app_update 343050 +quit
```



## 生成默认配置

```shell
cd ~/DoNotStarveTogetherServer/bin
./dontstarve_dedicated_server_nullrenderer
```

