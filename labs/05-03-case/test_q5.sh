#!/bin/bash

expect /tmp/assets/calculator-test.sh  5 7 13 | grep 10

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не обновлён" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-03-case/prepare_q6.sh