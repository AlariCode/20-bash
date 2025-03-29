#!/bin/bash
cd /home/moon/

cat /home/moon/mcq3.txt | grep -w '1'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq3.txt | grep -w '0' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep -w '25' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep -w '126' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-02-exitcodes/prepare_q4.sh