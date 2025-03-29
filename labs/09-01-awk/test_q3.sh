#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/file_analyzer.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

/home/moon/file_analyzer.sh dataset.csv | grep 500 && /home/moon/file_analyzer.sh dataset.csv | grep 14

if [ $? -ne 0 ]; then
    clear && echo 'В выводе неверное количество строк или колонок' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/09-01-awk/prepare_q4.sh