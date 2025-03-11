#!/bin/bash

echo 7 | sh -c "/home/moon/character-code.sh" | grep U | wc -l | grep 2

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

echo 7 | sh -c "/home/moon/character-code.sh" | grep "character 7 is"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"
