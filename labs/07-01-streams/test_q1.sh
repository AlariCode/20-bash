#!/bin/bash

bash -c "[[ -x \"/home/moon/err-redirect.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

rm /tmp/stdout.txt  /tmp/stderr.txt
/home/moon/err-redirect.sh > /tmp/stdout.txt 2> /tmp/stderr.txt 

cat /tmp/stdout.txt | grep 'This is a standard output'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт неверно выводит stdout' && exit 1
fi

cat /tmp/stderr.txt | grep 'This is an error message'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт неверно выводит stderr' && exit 1
fi

clear && echo "Вопрос решен"