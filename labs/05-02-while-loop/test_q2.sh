#!/bin/bash

bash /home/moon/print-numbers.sh 10 | grep 10

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидалось" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-02-while-loop/prepare_q3.sh