#!/bin/bash
cd /home/moon/

cat /home/moon/prepare-and-deploy | grep make_build | grep "()"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует make_build' && exit 1
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
    clear && echo "В скрипте prepare-and-deploy не хватает команд" && exit 1
fi

labtest prepare-and-deploy backend | awk -v RS='^$' 'END{exit !(index($0,"success") && index($0,"backend"))} '

if [ $? -ne 0 ]; then
    clear && echo "Скрипт prepare-and-deploy не работат как ожидалось" && exit 1
fi

clear && echo "Вопрос решен"

echo "Это конец лабораторной"   