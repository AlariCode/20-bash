#!/bin/bash
cd /home/moon/

rm -rf /tmp/errors_warnings.txt

/home/moon/log_analyse.sh xz 2> /tmp/errors_warnings.txt

echo $? | grep 20

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не выходит с кодом ошибки 20' && exit 1
fi

cat /tmp/errors_warnings.txt | grep "There is no xz"

if [ $? -ne 0 ]; then
    clear && echo 'Сообщение скрипта не отправляется в stderr' && exit 1
fi

clear && echo "Вопрос решен"