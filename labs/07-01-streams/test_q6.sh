#!/bin/bash

[ -f /home/moon/ss.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла ss.sh' && exit 1
fi

bash -c "[[ -x \"/home/moon/ss.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

cat /home/moon/ss.sh | grep '<<' | grep DELIMITER

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует heredoc и DELIMITER' && exit 1
fi

rm -rf /home/moon/heredoc.txt 
bash /home/moon/ss.sh

head -n 1 /home/moon/heredoc.txt | grep 'Shell Scripts'

if [ $? -ne 0 ]; then
    clear && echo 'Первая строка в heredoc.txt неверная' && exit 1
fi

head -n 2 /home/moon/heredoc.txt | grep 'Multiline'

if [ $? -ne 0 ]; then
    clear && echo 'Вторая строка в heredoc.txt неверная' && exit 1
fi

head -n 3 /home/moon/heredoc.txt | grep 'Heredocs question1'

if [ $? -ne 0 ]; then
    clear && echo 'Третья строка в heredoc.txt неверная' && exit 1
fi

clear && echo "Вопрос решен"