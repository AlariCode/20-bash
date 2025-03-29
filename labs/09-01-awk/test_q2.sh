#!/bin/bash
cd /home/moon/

cat /home/moon/mcq2.txt | grep "The word 'Hello' gets printed to the terminal 17 times."

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq2.txt | grep "The word 'Hello' gets printed to the terminal 15 times." | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep "The word 'Hello' gets not printed to the terminal." | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq2.txt | grep "The output of the command is blank." | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq2.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/09-01-awk/prepare_q3.sh