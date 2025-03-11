#!/bin/bash

bash /home/moon/summ.sh | grep "The result"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как ожидалось' && exit 1
fi

clear && echo "Вопрос решен"

