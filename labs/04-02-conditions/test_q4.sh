#!/bin/bash
cd /home/moon/

[ -f /home/moon/compare-strings.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла compare-strings.sh' && exit 1
fi

bash /home/moon/compare-strings.sh | grep -i "Zero length"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо с пустыми аргументами' && exit 1
fi

bash /home/moon/compare-strings.sh | grep -i "Zero length"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо с одним пустым аргументом' && exit 1
fi

bash /home/moon/compare-strings.sh asd qwe | awk -v RS='^$' 'END{exit !(index($0,"same length") && index($0,"not the same"))} '

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо с одной и той же длиной' && exit 1
fi

bash /home/moon/compare-strings.sh asd qw | grep -i "1 is longer"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо разной длиной' && exit 1
fi

bash /home/moon/compare-strings.sh asd qwe1 | grep -i "2 is longer"

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо разной длиной' && exit 1
fi

bash /home/moon/compare-strings.sh asd asd | awk -v RS='^$' 'END{exit !(index($0,"same length") && index($0,"same content"))} '

if [ $? -ne 0 ]; then
    clear && echo 'Cкрипт не работает как надо с одной и той же длиной и одинаковым контентом' && exit 1
fi

clear && echo "Вопрос решен"