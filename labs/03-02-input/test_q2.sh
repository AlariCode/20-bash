#!/bin/bash

cat /home/moon/mcq2.txt | grep 'All arguments'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'All arguments and script name' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Script name' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep 'Fifth argument' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-02-input/prepare_q3.sh