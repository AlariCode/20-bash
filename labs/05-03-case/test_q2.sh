#!/bin/bash

[ -f /home/moon/linux-pkg-info.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла linux-pkg-info.sh' && exit 1
fi

bash /home/moon/linux-pkg-info.sh Debian | grep apt

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается для Debian" && exit 1
fi

bash /home/moon/linux-pkg-info.sh Ubuntu | grep apt

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается для Ubuntu" && exit 1
fi

bash /home/moon/linux-pkg-info.sh Arch | grep pacman

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается для Arch" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-03-case/prepare_q3.sh