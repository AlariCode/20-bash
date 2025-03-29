#!/bin/bash
cd /home/moon/
sudo clean-working-dir
sudo cp -R /labs/03-02-input/assets/prepare-and-deploy /home/moon; sudo chown moon:moon /home/moon/prepare-and-deploy; sudo chmod +x /home/moon/prepare-and-deploy