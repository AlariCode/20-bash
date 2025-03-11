#!/bin/bash

cat /home/moon/prepare-and-deploy | grep if

if [ $? -ne 0 ]; then
    clear && echo "В скрипте не использован if" && exit 1
fi

cat /home/moon/prepare-and-deploy | grep then

if [ $? -ne 0 ]; then
    clear && echo "В скрипте не использован then" && exit 1
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

sh -c "MUST_FAIL=true FAILURE_REASON=xz123 labtest prepare-and-deploy backend" | awk -v RS='^$' 'END{exit !(index($0,"failed") && index($0,"backend") && index($0,"xz123"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидалось" && exit 1
fi

clear && echo "Вопрос решен"