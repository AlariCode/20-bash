#!/bin/bash
cd /home/moon/

cat /home/moon/mcq3.txt | grep 'Print numbers from 0 to a given number'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'Print nothing' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'Prints numbers from 1 to 5' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'Prints numbers from 0 to 15' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"