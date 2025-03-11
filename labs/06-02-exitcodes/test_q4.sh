#!/bin/bash

cat /home/moon/mcq4.txt | grep 'Exit script after first error'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq4.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq4.txt | grep 'Nothing' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq4.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq4.txt | grep 'Verbose script output' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq4.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq4.txt | grep 'Ignore all errors in script' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq4.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-02-exitcodes/prepare_q5.sh