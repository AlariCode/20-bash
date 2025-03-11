#!/bin/bash

bash -c "[[ -x \"/home/moon/parking-checker.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

LITER=3 FLOOR=2 /home/moon/parking-checker.sh /home/moon/parking.txt | grep -w X

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

LITER=2 FLOOR=2 /home/moon/parking-checker.sh /home/moon/parking.txt | grep -w O

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

echo "X Y Z" > /tmp/parking.txt
LITER=2 FLOOR=0 /home/moon/parking-checker.sh /tmp/parking.txt | grep -w Z

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   




