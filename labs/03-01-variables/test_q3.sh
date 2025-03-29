#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/show-memory-state.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

/home/moon/show-memory-state.sh | grep total | grep used | grep free | grep shared

if [ $? -ne 0 ]; then
    clear && echo "Скрипт show-memory-state.sh имеет неверный вывод" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-01-variables/prepare_q4.sh