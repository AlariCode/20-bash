#!/bin/bash

rm -rf /home/moon/scripts; mkdir /home/moon/scripts; cd /home/moon/scripts; touch pling.sh plang.sh plong.sh; chown -R moon:moon /home/moon/*; HOME=/home/moon /home/moon/add-exec-to-directory.sh scripts;

ls -al /home/moon/scripts/plang.sh | grep x

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт plang.sh не имеет разрешений на исполнение" && exit 1
fi

ls -al /home/moon/scripts/pling.sh | grep x

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт pling.sh не имеет разрешений на исполнение" && exit 1
fi

ls -al /home/moon/scripts/plong.sh | grep x

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт plong.sh не имеет разрешений на исполнение" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-01-for-loop/prepare_q5.sh