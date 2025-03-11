#!/bin/bash

rm -f /tmp/output_curl

timeout 15s bash /home/moon/limits.sh > /tmp/output_curl

all=$(cat /tmp/output_curl | wc -l)

checked=$(cat /tmp/output_curl | grep ^http | grep "directory'$" | wc -l)

if [ $all -ne $checked ]; then
    clear && echo 'Скрипт не работает как предполагалось' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   