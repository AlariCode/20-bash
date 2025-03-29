#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/get_names.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

rm  -rf /home/moon/names.txt

/home/moon/get_names.sh dataset.csv

cat /home/moon/names.txt | wc -l | grep 499

if [ $? -ne 0 ]; then
    clear && echo 'В файле names.txt неверное количество строк' && exit 1
fi

cat /home/moon/names.txt | grep ',' | wc -l | grep -w 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле неверные данные' && exit 1
fi

cat /home/moon/names.txt | grep '/games/boxart' | wc -l | grep -w 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле неверные данные' && exit 1
fi

sed '155q;d' /home/moon/names.txt | grep Skyrim

if [ $? -ne 0 ]; then
    clear && echo 'В файле неверные данные' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/09-01-awk/prepare_q2.sh