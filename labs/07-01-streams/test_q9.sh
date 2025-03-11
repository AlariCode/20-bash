#!/bin/bash

bash /home/moon/limits.sh 2>&1 | grep "No such" && bash /home/moon/limits.sh

if [ $? -eq 0 ]; then
    clear && echo 'Скрипт не отлавливает ошибки внутри pipe своим кодом выхода' && exit 1
fi

grep pipefail /home/moon/limits.sh

if [ $? -ne 0 ]; then
    clear && echo 'Не используется pipefail' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/07-01-streams/prepare_q10.sh