#!/bin/bash

bash -c "[[ -x \"/home/moon/create_vendor_files.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

rm -rf /home/moon/UAZ; /home/moon/create_vendor_files.sh && ls /home/moon/UAZ

if [ $? -ne 0 ]; then
    clear && echo "Скрипт create_vendor_files.sh работает неверно" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"