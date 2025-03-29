#!/bin/bash
cd /home/moon/
sudo clean-working-dir

sudo cp -R /labs/10-prj/assets/destroy.sh /tmp/destroy.sh; sudo chmod +x /tmp/destroy.sh; sudo chown moon:moon /tmp/destroy.sh

mkdir -p /home/moon/answer

sudo cp -R /labs/10-prj/assets/deploy-estate-application.sh /home/moon/answer/deploy-estate-application.sh; sudo chmod +x /home/moon/answer/deploy-estate-application.sh; sudo chown moon:moon /home/moon/answer/deploy-estate-application.sh

sudo sysctl net.ipv6.conf.all.disable_ipv6=1

sudo /tmp/destroy.sh