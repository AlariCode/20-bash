#!/bin/bash

bash -c "[[ -x \"/home/moon/shopping-list.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

echo -ne 'zen\nintergalactic\nsave' | /home/moon/shopping-list.sh | tr -d ' ' | grep 'Sortedshoppinglist:intergalacticzen'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"