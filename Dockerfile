FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        curl \
        lib32gcc-s1 \
        lib32stdc++6 \
        libc6:i386 \
        && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/steamcmd && \
    mkdir -p /home/oncehuman/server/OnceHuman/Saved/Config/LinuxServer/ && \
    useradd -m -s /bin/bash oncehuman && \
    chown -R oncehuman:oncehuman /opt/steamcmd /home/oncehuman

WORKDIR /opt/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \
    chmod +x steamcmd.sh

USER oncehuman
RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/oncehuman/server +app_update 2139460 validate +quit

RUN cat > /home/oncehuman/server/OnceHuman/Saved/Config/LinuxServer/GameUserSettings.ini <<'EOF'
[/Script/OnceHuman.GameUserSettings]
ServerName=My Once Human Server
MaxPlayers=16
ServerPassword=yourpassword_here
AdminPassword=youradminpassword_here
PvEEnabled=True
DayLength=60
NightLength=30
XPMultiplier=1.0
ResourceMultiplier=1.0
DropMultiplier=1.0
EOF

CMD ["/home/oncehuman/server/OnceHumanServer.sh", "-log", "-port=27015"]
