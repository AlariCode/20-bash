#!/bin/bash
cd /home/moon/

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

ls -l /home/moon/prepare-and-deploy | grep x

if [ $? -ne 0 ]; then
    clear && echo "Нет разрешений на запуск у prepare-and-deploy" && exit 1
fi

labtest prepare-and-deploy | grep success

if [ $? -ne 0 ]; then
    clear && echo "Скрипт не работает" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/02-01-first-script/prepare_q2.sh