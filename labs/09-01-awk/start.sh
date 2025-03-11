#!/bin/bash
sudo clean-working-dir
sudo cp -R /labs/09-01-awk/assets/get_names.sh /home/moon/get_names.sh; sudo chmod +x /home/moon/get_names.sh; sudo chown moon:moon /home/moon/get_names.sh

sudo cp -R /labs/09-01-awk/assets/dataset.csv /home/moon/dataset.csv; sudo chown moon:moon /home/moon/dataset.csv 