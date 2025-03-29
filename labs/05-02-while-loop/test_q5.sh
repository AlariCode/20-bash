#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/calculator.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

expect /labs/05-02-while-loop/assets/calculator-test.sh 1 123 123 | grep 246

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не может складывать' && exit 1
fi

expect /labs/05-02-while-loop/assets/calculator-test.sh 2 202 123 | grep 79

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт может вычитать' && exit 1
fi

expect /labs/05-02-while-loop/assets/calculator-test.sh 3 540 12 | grep 6480

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт может умножать' && exit 1
fi

expect /labs/05-02-while-loop/assets/calculator-test.sh 4 540 12 | grep 45

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт может делить' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   