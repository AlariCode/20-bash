#!/bin/bash

bash -c "[[ -x \"/home/moon/shopping-list.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

echo -ne '123\nxxxxz\nsave' | /home/moon/shopping-list.sh | tr -d ' ' | grep 'Currentshoppinglistis:123xxxxz'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

echo -ne '123\nxxxxz\nsave' | /home/moon/shopping-list.sh | tr -d ' ' | grep 'Remainingshoppinglistis:xxxxz'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi


clear && echo "Вопрос решен"