#!/bin/bash

/home/moon/scripts/print_number4.sh | grep "1 2 3 4 5 6 7 8 9 10"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как предполагалось' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   