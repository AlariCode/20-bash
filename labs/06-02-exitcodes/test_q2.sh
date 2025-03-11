#!/bin/bash

cat /home/moon/mcq2.txt | grep -w '127'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq2.txt | grep -w '0' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Command Not Found' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep -w '1' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-02-exitcodes/prepare_q3.sh