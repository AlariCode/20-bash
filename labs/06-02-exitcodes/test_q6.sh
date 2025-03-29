#!/bin/bash
cd /home/moon/

cat /home/moon/backup-file.sh | grep set | grep v | grep n

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует set' && exit 1
fi

cd /home/moon; 
rm -rf /home/moon/test_test /tmp/test; bash /home/moon/backup-file.sh test_test 2> /tmp/test; 
cat /tmp/test | awk -v RS='^$' 'END{exit !(index($0,"echo") && index($0,"mkdir") && index($0,"for") && index($0,"ls"))} '

if [ $? -ne 0 ]; then
    clear && echo "В скрипте не хватает команд" && exit 1
fi

ls -al /home/moon/ | grep test_test | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo "Скрипт исполнялся в рабочем режиме" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   