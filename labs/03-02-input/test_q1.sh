#!/bin/bash
cd /home/moon/

cat /home/moon/prepare-and-deploy | grep '\$1'

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте prepare-and-deploy не использована $1' && exit 1
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

labtest prepare-and-deploy backend > /tmp/output1

cat /tmp/output1 | awk -v RS='^$' 'END{exit !(index($0,"success") && index($0,"backend"))} ' || cat /tmp/output1 | awk -v RS='^$' 'END{exit !(index($0,"launching") && index($0,"backend"))} '

if [ $? -ne 0 ]; then
    clear && echo 'Скрип работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-02-input/prepare_q2.sh