#!/bin/bash
cd /home/moon/

[ -f /home/moon/average.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла average.sh' && exit 1
fi

bash /home/moon/average.sh 3 1 4 | grep "2.666"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не показывает среднее для 3, 1, 4' && exit 1
fi

bash /home/moon/average.sh 3 3 6 | grep 4

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не показывает среднее для 3, 3, 6' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"