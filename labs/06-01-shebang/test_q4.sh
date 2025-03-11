#!/bin/bash

bash -c "[[ -x \"/home/moon/loop.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

cat /home/moon/loop.sh | grep bash

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не указан shebang' && exit 1
fi

/home/moon/loop.sh | egrep '12|13|14|15|16|17|18|19|20|21' | sort -u | wc -l | grep 10

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не работает как предполагалось' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-01-shebang/prepare_q5.sh