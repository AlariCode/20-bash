#!/bin/bash

cat /home/moon/calculator.sh | grep read_numbers | grep "()"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует функцию read-numbers' && exit 1
fi

expect /tmp/assets/calculator-test.sh 1 123 123 | grep 246

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не умеет складывать' && exit 1
fi

expect /tmp/assets/calculator-test.sh 2 202 123| grep 79

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не умеет вычитать' && exit 1
fi

expect /tmp/assets/calculator-test.sh 3 540 12 | grep 6480

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не умеет умножать' && exit 1
fi

expect /tmp/assets/calculator-test.sh 4 540 12 | grep 45

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не умеет делить' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-03-functions/prepare_q7.sh