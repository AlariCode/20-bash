#!/bin/bash

[ -f /home/moon/check_dir.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла check_dir.sh' && exit 1
fi

rm -rf /home/moon/project-diamond && sh /home/moon/check_dir.sh | grep -i 'No directory'

if [ $? -ne 0 ]; then
    clear && echo "Cкрипт не работает, если директория не существует" && exit 1
fi

mkdir -p /home/moon/project-diamond && sh /home/moon/check_dir.sh | grep -i 'Directory OK' && rm -rf /home/moon/project-diamond

if [ $? -ne 0 ]; then
    clear && echo "Cкрипт не работает, если директория существует" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-01-variables/prepare_q2.sh