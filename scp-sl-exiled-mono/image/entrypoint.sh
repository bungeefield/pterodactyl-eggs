#!/bin/bash
cd /home/container

# Auto Update
if [ "${UPDATE}" == "1" ]; then
    # Update SCP: SL Dedicated Server
    ./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 996560 validate +quit

    # Update EXILED
    rm -f Exiled.Installer-Linux
    wget --no-hsts https://github.com/Exiled-Team/EXILED/releases/download/2.8.0/Exiled.Installer-Linux
    chmod +x Exiled.Installer-Linux
    ./Exiled.Installer-Linux --path /home/container --exit
    rm -f Exiled.Installer-Linux
fi

# Replace Startup Variables
MODIFIED_STARTUP="eval $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')"
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run
${MODIFIED_STARTUP}