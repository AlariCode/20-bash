#!/bin/bash

cat /home/moon/calculator.sh | grep percentage | grep "()"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует функцию percentage' && exit 1
fi

expect /tmp/assets/calculator-test.sh 5 10 50 | grep 20

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт умеет считать проценты' && exit 1
fi


clear && echo "Вопрос решен"

bash /labs/06-03-functions/prepare_q8.sh