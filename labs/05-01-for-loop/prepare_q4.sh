#!/bin/bash
sudo cp -R /labs/05-01-for-loop/assets/add-exec-to-directory.sh /home/moon/; sudo chmod +x /home/moon/add-exec-to-directory.sh;

mkdir /home/moon/scripts; cd /home/moon/scripts; touch pling.sh plang.sh plong.sh;

sudo chown -R moon:moon /home/moon/*