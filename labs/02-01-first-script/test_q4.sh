#!/bin/bash
cd /home/moon/

rm -rf /home/moon/vendors

cd /home/moon; bash /home/moon/create-directory2.sh > /tmp/output2

if [ $? -ne 0 ]; then
    clear && echo "Скрипт не работает" && exit 1
fi

ls /home/moon/vendors | grep Toyota \
&& ls /home/moon/vendors | grep Ford \
&& ls /home/moon/vendors | grep Lada

if [ $? -ne 0 ]; then
    clear && echo "Файлы не созданы" && exit 1
fi

cat /home/moon/vendors/Toyota/models.txt | grep Camry \
&& cat /home/moon/vendors/Ford/models.txt | grep Transit \
&& cat /home/moon/vendors/Lada/models.txt | grep Vesta

if [ $? -ne 0 ]; then
    clear && echo "Неверный контент в файлах" && exit 1
fi

cat /tmp/output2 | grep "load average"

if [ $? -ne 0 ]; then
    clear && echo "Не верный вывод в скрипте" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"