#!/bin/bash
echo {1..17} > /home/moon/lines_dump.txt
cat /home/moon/lines_dump.txt | tr ' ' '\n' > /home/moon/lines.txt
rm -f /home/moon/lines_dump.txt

sudo cp -R /labs/09-01-awk/assets/mcq2.txt /home/moon/; sudo chown moon:moon /home/moon/mcq2.txt