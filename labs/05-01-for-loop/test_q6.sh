#!/bin/bash

rm -rf /home/moon/texts; mkdir /home/moon/texts; cd /home/moon/texts; 
touch kube-for-beginners.txt docker-for-beginners.txt terraform-for-beginners.txt ansible-for-beginners.txt linux-for-beginners.doc scripts-for-beginners-txt.htm; 
chown -R moon:moon /home/moon/*

[ -f /home/moon/rename-texts.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла rename-texts.sh' && exit 1
fi

cd /home/moon; 

bash rename-texts.sh && ls /home/moon/texts | awk -v RS='^$' 'END{exit !(index($0,"kube-for-beginners.md") && index($0,"docker-for-beginners.md") && index($0,"terraform-for-beginners.md") && index($0,"ansible-for-beginners.md") && index($0,"linux-for-beginners.doc") && index($0,"scripts-for-beginners-txt.htm"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт работает неверно" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   