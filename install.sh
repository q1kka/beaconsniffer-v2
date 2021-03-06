#!/bin/bash
echo "Start beaconsniffer v2 installation?"
read -p "Press enter to continue"
sudo apt-get update -y && sudo apt-get upgrade -y
git pull
clear
echo "Done updating. Satisfying dependencies..."
./dependencies.sh
clear
echo "Dependencies satisfied, proceed to module configuration"
sleep 3
./modules.sh
clear
echo "Installation done, rebooting in 5sec.."
sleep 5
sudo reboot -h now
