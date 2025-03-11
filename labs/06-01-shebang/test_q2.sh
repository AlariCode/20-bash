#!/bin/bash

cat /home/moon/mcq2.txt | grep 'Prints numbers from 12 to 21'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Prints nothing' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Prints numbers from 0 to a given number' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Prints {12..21}' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-01-shebang/prepare_q3.sh