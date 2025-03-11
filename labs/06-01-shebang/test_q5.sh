#!/bin/bash

cat /home/moon/mcq5.txt | grep 'print_number4.sh'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq5.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq5.txt | grep 'print_number1.sh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq5.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq5.txt | grep 'print_number2.sh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq5.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq5.txt | grep 'print_number3.sh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq5.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"
