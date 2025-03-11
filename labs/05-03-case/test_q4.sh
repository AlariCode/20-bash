#!/bin/bash

bash -c "[[ -x \"/home/moon/calculator.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

cat /home/moon/calculator.sh | grep -v "if"

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт использует if" && exit 1
fi

cat /home/moon/calculator.sh | awk -v RS='^$' 'END{exit !(index($0,"case") && index($0,"esac"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует case" && exit 1
fi

expect /tmp/assets/calculator-test.sh 1 123 123 | grep 246

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается при сложении" && exit 1
fi

expect /tmp/assets/calculator-test.sh 2 202 123| grep 79

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается при вычитании" && exit 1
fi

expect /tmp/assets/calculator-test.sh 3 540 12 | grep 6480

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается при умножении" && exit 1
fi

expect /tmp/assets/calculator-test.sh 4 540 12 | grep 45

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается при делении" && exit 1
fi

clear && echo "Вопрос решен"