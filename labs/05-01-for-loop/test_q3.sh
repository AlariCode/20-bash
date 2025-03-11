#!/bin/bash

[ -f /home/moon/loop.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла loop.sh' && exit 1
fi

bash /home/moon/loop.sh | egrep '11|12|13|14|15|16|17|18|19' | sort -u | wc -l | grep 9

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не печатает все значения с 11 до 19" && exit 1
fi

cat /home/moon/loop.sh | egrep 'for|while|until' | grep -vi ^# | wc -l |  grep ^[1-3]

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не исполльзует цикл" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-01-for-loop/prepare_q4.sh