#!/bin/bash
cd /home/moon/

[ -f /home/moon/limit-loop.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла limit-loop.sh' && exit 1
fi

bash /home/moon/limit-loop.sh 11 19 | wc -l | grep 4

if [ $? -ne 0 ]; then
    clear && echo 'У скрипта слишком большой вывод' && exit 1
fi

bash /home/moon/limit-loop.sh 11 19 | grep build-12

if [ $? -ne 0 ]; then
    clear && echo 'В выводе нет правильного вхождения' && exit 1
fi

bash /home/moon/limit-loop.sh 11 19 | grep build-14

if [ $? -ne 0 ]; then
    clear && echo 'В выводе нет правильного вхождения' && exit 1
fi

bash /home/moon/limit-loop.sh 11 19 | grep build-16

if [ $? -ne 0 ]; then
    clear && echo 'В выводе нет правильного вхождения' && exit 1
fi

bash /home/moon/limit-loop.sh 11 19 | grep build-18

if [ $? -ne 0 ]; then
    clear && echo 'В выводе нет правильного вхождения' && exit 1
fi

clear && echo "Вопрос решен"
