#!/bin/bash
cd /home/moon/

[ -f /home/moon/print-month-name.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла print-month-name.sh' && exit 1
fi

bash /home/moon/print-month-name.sh 10 | grep -i october

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо' && exit 1
fi

bash /home/moon/print-month-name.sh | grep -i "no month number"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не пишет "No month number given", если месяц не задан' && exit 1
fi

bash /home/moon/print-month-name.sh 14 | grep -i "invalid month number"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не пишет "Invalid month number given", если месяц не от 1 до 12' && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   