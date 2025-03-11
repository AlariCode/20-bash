#!/bin/bash

[ -f /home/moon/check_greater.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла check_greater.sh' && exit 1
fi

sh /home/moon/check_greater.sh 2 11 | grep 11 && sh /home/moon/check_greater.sh 91 26 | grep 91

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не показывает большее число между аргументами $1 и $2' && exit 1
fi

clear && echo "Вопрос решен"