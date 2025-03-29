#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/multi-deploy.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

cat /home/moon/multi-deploy.sh | grep for | grep tasks

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт использует for для перебора массива tasks' && exit 1
fi

cd /home/moon/; rm -rf first second third fourth fifth; export COUNT_DOWN=0; export POST_LIFT_OFF_DELAY=0; export STATUS_DELAY=0; export SHOW_ANIMATION=false; 
/home/moon/multi-deploy.sh first second third fourth fifth

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

! test -d /home/moon/first && ! test -d /home/moon/second && ! test -d /home/moon/fifth && cat /home/moon/third/status | grep success && cat /home/moon/fourth/status | grep success;

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   