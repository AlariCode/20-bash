#!/bin/bash

rm -rf /tmp/apps; cd /tmp; 
bash /home/moon/create-directories.sh; 

ls /tmp/apps | awk -v RS='^$' 'END{exit !(index($0,"app1") && index($0,"app2") && index($0,"app3"))} '

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как ожидалось' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-03-functions/prepare_q3.sh