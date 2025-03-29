#!/bin/bash
cd /home/moon/

cat books-dev.csv | grep '.jpg' | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'В файле books-dev.csv остались упоминания jpg' && exit 1
fi

cat books-dev.csv | grep '.webp' | wc -l | grep 4993

if [ $? -ne 0 ]; then
    clear && echo 'В файле books-dev.csv неверное количество webp' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   