#!/bin/bash
cd /home/moon/
sudo clean-working-dir
sudo rm -rf /bin/sh; sudo ln -s /bin/dash /bin/sh; 

sudo cp -R /labs/06-01-shebang/assets/loop.sh /home/moon; sudo chown -R moon:moon /home/moon/loop.sh; sudo chmod +x /home/moon/loop.sh;

sudo cp -R /labs/06-01-shebang/assets/mcq1.txt /home/moon/; sudo chown moon:moon /home/moon/mcq1.txt