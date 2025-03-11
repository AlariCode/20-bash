#!/bin/bash

cat /home/moon/mcq1.txt | grep -w '0'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq1.txt | grep -w '127' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep -w '1' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep -w 'Success' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-02-exitcodes/prepare_q2.sh