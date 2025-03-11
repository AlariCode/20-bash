#!/bin/bash

cat /home/moon/mcq1.txt | grep '/bin/dash'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq1.txt | grep '/bin/zsh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep '/bin/csh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep '/bin/ksh' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-01-shebang/prepare_q2.sh