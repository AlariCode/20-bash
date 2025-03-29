#!/bin/bash
cd /home/moon/

cat /home/moon/mcq1.txt | grep 'prepare-directory-structure'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq1.txt | grep 'create-directories' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep 'mkdir' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep 'function' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"