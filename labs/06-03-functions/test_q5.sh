#!/bin/bash

bash -c "[[ -x \"/home/moon/func-to-func.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

/home/moon/func-to-func.sh 3 3 | grep worker

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как ожидалось' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-03-functions/prepare_q6.sh