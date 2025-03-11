#!/bin/bash

cat /home/moon/prepare-and-deploy | grep while

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует while" && exit 1
fi

cat /home/moon/prepare-and-deploy | grep mkdir \
&& cat /home/moon/prepare-and-deploy | grep builder-connect \
&& cat /home/moon/prepare-and-deploy | grep builder-creds \
&& cat /home/moon/prepare-and-deploy | grep builder-repo \
&& cat /home/moon/prepare-and-deploy | grep builder-build \
&& cat /home/moon/prepare-and-deploy | grep builder-test \
&& cat /home/moon/prepare-and-deploy | grep builder-deploy \
&& cat /home/moon/prepare-and-deploy | grep builder-status

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует команды сборщика" && exit 1
fi

sh -c "export PATH=$PATH:/home/moon; labtest prepare-and-deploy frontend" | awk -v RS='^$' 'END{exit !(index($0,"success") && index($0,"frontend"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидалось" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/05-02-while-loop/prepare_q2.sh