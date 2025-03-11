#!/bin/bash

bash /home/moon/vars.sh > /tmp/vars.output

cat /tmp/vars.output  | grep -A3 'HEREDOC' | head -n 2 | grep -w a && cat /tmp/vars.output  | grep -A3 'HEREDOC' | head -n 3 | grep -w b && cat /tmp/vars.output  | grep -A3 'HEREDOC' | head -n 4 | grep -w c

if [ $? -ne 0 ]; then
    clear && echo 'Вывод для HEREDOC неверный' && exit 1
fi

cat /tmp/vars.output  | grep -A3 'HERESTRING' | head -n 2 | grep -w a && cat /tmp/vars.output  | grep -A3 'HERESTRING' | head -n 3 | grep -w b && cat /tmp/vars.output  | grep -A3 'HERESTRING' | head -n 4 | grep -w c

if [ $? -ne 0 ]; then
    clear && echo 'Вывод для HERESTRING неверный' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/07-01-streams/prepare_q9.sh