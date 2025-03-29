#!/bin/bash
cd /home/moon/

cat /home/moon/books-dev.csv | grep -i rowling | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле books-dev.csv остались упоминания rowling' && exit 1
fi


cat /home/moon/books-dev.csv | wc -l | grep 4993

if [ $? -ne 0 ]; then
    clear && echo 'В файле books-dev.csv неверное количество строк' && exit 1
fi

clear && echo "Вопрос решен"