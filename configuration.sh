#!/usr/bin/env bash

function blesniffercrontab {
    crontab -l > cron
    #echo new cron into cron file
    echo "@reboot screen -S blesniffer -dm sh -c 'sleep 15; python /home/pi/beaconsniffer-v2/blesniffer-python/beaconsniffer.py; exec bash'" >> cron
    #install new cron file
    crontab cron
    rm mycron
}

read -p "Start blesniffer on startup (y/n)?" CONT

if [ "$CONT" = "y" ]; then
    crontab -l > cron
    #echo new cron into cron file
    echo "@reboot screen -S blesniffer -dm sh -c 'sleep 15; python /home/pi/beaconsniffer-v2/blesniffer-python/beaconsniffer.py; exec bash'" >> cron
    #install new cron file
    crontab cron
    rm cron
else
  echo "skipped cron setup";
fi