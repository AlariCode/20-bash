#!/bin/bash

bash -c "[[ -x \"/home/moon/to-upcase.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

echo test dd | bash /home/moon/to-upcase.sh | grep DD | grep TEST

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/08-01-arrays/prepare_q2.sh