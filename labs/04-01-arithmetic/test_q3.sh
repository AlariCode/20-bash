#!/bin/bash
cd /home/moon/

[ -f /home/moon/price-calculator.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла price-calculator.sh' && exit 1
fi

bash /home/moon/price-calculator.sh 3 5 | grep "TOTAL:" | grep 15

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не показывает общее произведение 3 items по 5' && exit 1
fi

bash /home/moon/price-calculator.sh 10 2 | grep "TOTAL:" | grep 20

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не показывает общую произведение 10 items по 2' && exit 1
fi

clear && echo "Вопрос решен"