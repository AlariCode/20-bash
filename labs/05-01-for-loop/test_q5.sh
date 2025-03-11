#!/bin/bash

cat /home/moon/count-requests.sh | awk -v RS='^$' 'END{exit !(index($0,"for") && index($0,"do") && index($0,"done"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует цикл for" && exit 1
fi

bash /home/moon/count-requests.sh | grep manager | grep 17 | grep 16 | grep 20 | grep 15 | grep 13

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт работает неверно с 'manager'" && exit 1
fi

bash /home/moon/count-requests.sh | grep ci-runners | grep 13 | grep 6 | grep 14 | grep 11 | grep 5 | grep 10

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт работает неверно с 'ci-runners'" && exit 1
fi

bash /home/moon/count-requests.sh | grep object-store | grep 78 | grep 76 | grep 90 | grep 100 | grep 89 | grep 66

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт работает неверно с 'object-store'" && exit 1
fi

bash /home/moon/count-requests.sh | grep federation | grep 6 | grep 0 | grep 9 | grep 5 | grep 8

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт работает неверно с 'federation'" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-01-for-loop/prepare_q6.sh