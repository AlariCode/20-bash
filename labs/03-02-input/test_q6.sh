#!/bin/bash

cat /home/moon/mcq6.txt | grep '2'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq6.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq6.txt | grep '3' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq6.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq6.txt | grep '0' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq6.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq6.txt | grep '5' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq6.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"