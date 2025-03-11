#!/bin/bash

bash -c "[[ -x \"/home/moon/emails.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

/home/moon/emails.sh | tr -d '\n' | tr -d ' ' | grep "Alena'semailisalena@rotoro.corpDiego'semailispapaya@rotoro.corpIren'semailisiro4ka@gmail.comVova'semailisvolodya@rotoro.corp"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/08-01-arrays/prepare_q7.sh