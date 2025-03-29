#!/bin/bash
cd /home/moon/

cat /home/moon/prepare-and-deploy | grep exit

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует exit' && exit 1
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

MUST_FAIL=true labtest prepare-and-deploy backend

if [ $? -ne 30 ]; then
    clear && echo "Скрипт prepare-and-deploy падает не с кодом 30" && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/06-02-exitcodes/prepare_q6.sh