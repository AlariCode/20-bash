#!/bin/bash
cd /home/moon/

cat /home/moon/mcq3.txt | grep 'Vendor of Camry is Toyota'

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt нет правильного ответа' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'None' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'USB vendor ID not defined' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

cat /home/moon/mcq3.txt | grep 'Vendor of Vesta is Lada' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле mcq3.txt есть неправильный ответ' && exit 1
fi

clear && echo "Вопрос решен"