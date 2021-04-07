#!/bin/bash
cd /home/container

if [ "${AUTO_UPDATE}" == "1" ]; then
    ./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 996560 validate +quit

    wget https://github.com/Exiled-Team/EXILED/releases/download/2.8.0/Exiled.Installer-Linux
    chmod +x Exiled.Installer-Linux
    ./Exiled.Installer-Linux --path /home/container --exit
    rm Exiled.Installer-Linux
fi

MODIFIED_STARTUP="eval $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')"
echo ":/home/container$ ${MODIFIED_STARTUP}"

${MODIFIED_STARTUP}