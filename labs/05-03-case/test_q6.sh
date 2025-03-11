#!/bin/bash

bash /home/moon/print-color.sh blue | grep "Valid options are red and green"

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не имеет 'Valid options are red and green'" && exit 1
fi

bash /home/moon/print-color.sh red | grep "this is red"

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не имеет 'this is red'" && exit 1
fi

bash /home/moon/print-color.sh green | grep "this is green"

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не имеет 'this is green'" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   