#!/bin/bash
cd /home/moon/
bash -c "/home/moon/system_status.sh" | grep "All OK"

if [ $? -ne 0 ]; then
    clear && echo "Скрипт не работает" && exit 1
fi

clear && echo "Вопрос решен"