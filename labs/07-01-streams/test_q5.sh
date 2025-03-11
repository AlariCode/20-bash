#!/bin/bash

[ -f /home/moon/err-silenced.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла err-silenced.sh' && exit 1
fi

bash -c "[[ -x \"/home/moon/err-silenced.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

bash /home/moon/devnull.txt  2>&1 | wc -c | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'Команда в devnull.txt работает неверно' && exit 1
fi

cat /home/moon/devnull.txt | grep err-silenced.sh

if [ $? -ne 0 ]; then
    clear && echo 'Команда в devnull.txt не вызывает err-silenced.sh' && exit 1
fi

/home/moon/err-silenced.sh 2> /dev/null | grep "Hide a standard output" && /home/moon/err-silenced.sh 2> /dev/null | grep "Hide an error messages" | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/07-01-streams/prepare_q6.sh