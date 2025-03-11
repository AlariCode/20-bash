#!/bin/bash
sudo cp -R /labs/07-01-streams/assets/log_analyse.sh /home/moon/; sudo chmod +x /home/moon/log_analyse.sh; sudo chown moon:moon /home/moon/log_analyse.sh

mkdir /home/moon/logs
sudo cp -R /labs/07-01-streams/assets/log.txt /home/moon/logs/

