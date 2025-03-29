#!/bin/bash
cd /home/moon/

bash /home/moon/price-calculator.sh 4 5 1 7 | grep "TOTAL:" | grep 27

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не показывает общую сумму 4 item1 по 5 и 1 item2 по 7' && exit 1
fi

bash /home/moon/price-calculator.sh 4 5 1 7 | grep "ITEM1:" | grep 20

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не показывает общую сумму 4 item1 по 5' && exit 1
fi

bash /home/moon/price-calculator.sh 4 5 1 7 | grep "ITEM2:" | grep 7

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не показывает общую сумму 1 item2 по 7' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/04-01-arithmetic/prepare_q5.sh