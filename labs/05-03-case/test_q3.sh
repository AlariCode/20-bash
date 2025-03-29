#!/bin/bash
cd /home/moon/

cat /home/moon/print-month-name.sh | awk -v RS='^$' 'END{exit !(index($0,"case") && index($0,"esac"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует case" && exit 1
fi

bash /home/moon/print-month-name.sh 4 | grep April

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-03-case/prepare_q4.sh