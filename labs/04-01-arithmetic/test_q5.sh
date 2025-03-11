#!/bin/bash

bash /home/moon/square.sh | grep area | grep 18

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не показывает площадь' && exit 1
fi

clear && echo "Вопрос решен"