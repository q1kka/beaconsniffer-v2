#!/usr/bin/env bash
crotab -r
read -p "Use presenceparser module? (y/n)=" PARSER
if [ "$PARSER" = "y" ]; then
    crontab -l > cron
    #echo new cron into cron file
    echo "@reboot screen -S presenceparser -dm sh -c 'sleep 20; cd /home/pi/beaconsniffer-v2/presenceparser/; java -jar presenceparser.jar; exec bash'" >> cron
    #install new cron file
    crontab cron
    rm cron
else
  echo "presenceparser not used";
fi

read -p "Use mqtt-client module? (y/n)=" MQTT
if [ "$MQTT" = "y" ]; then
    crontab -l > cron
    echo "@reboot screen -S mqtt-client -dm sh -c 'sleep 25; /usr/local/bin/forever start -c /usr/local/bin/node /home/pi/beaconsniffer-v2/mqtt-client/mqtt.js; exec bash'" >> cron
    crontab cron
    rm cron
else
    echo "mqtt client not used";
fi

