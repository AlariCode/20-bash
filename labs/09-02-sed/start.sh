#!/bin/bash
sudo clean-working-dir

echo {1..17} > /home/moon/lines_dump.txt
cat /home/moon/lines_dump.txt | tr ' ' '\n' > /home/moon/lines.txt
rm -f /home/moon/lines_dump.txt

sudo cp -R /labs/09-02-sed/assets/mcq1.txt /home/moon/mcq1.txt; sudo chown moon:moon /home/moon/mcq1.txt 