#!/bin/bash

bash -c "[[ -x \"/home/moon/shopping-list.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

echo testxzxz | /home/moon/shopping-list.sh | tr -d ' ' | grep 'Currentshoppinglistis:testxzxz'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

echo save | /home/moon/shopping-list.sh | tr -d ' ' | grep 'Currentshoppinglistis:' | grep 'save' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi


clear && echo "Вопрос решен"