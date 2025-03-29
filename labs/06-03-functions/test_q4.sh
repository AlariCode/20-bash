#!/bin/bash
cd /home/moon/

bash /home/moon/summ.sh | grep 8

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как ожидалось' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-03-functions/prepare_q5.sh