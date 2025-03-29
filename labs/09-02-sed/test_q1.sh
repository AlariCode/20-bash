#!/bin/bash
cd /home/moon/

cat /home/moon/mcq1.txt | grep "sed -n 'p;n' lines.txt"

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq1.txt | grep "sed -n '1p' lines.txt" | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep "sed -n 'n;p' lines.txt" | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq1.txt | grep "sed -n '\$p' lines.txt" | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq1.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/09-02-sed/prepare_q2.sh