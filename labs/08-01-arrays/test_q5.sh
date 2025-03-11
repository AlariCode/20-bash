#!/bin/bash

bash -c "[[ -x \"/home/moon/resolver.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

printf '%s\n\t%s\n\t%s\n' 'xzl' 'bu01'  'stop' | /home/moon/resolver.sh | tr -d ' ' | grep 'Noentryforxzl'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

printf '%s\n\t%s\n\t%s\n' 'xzl' 'bu01'  'stop' | /home/moon/resolver.sh | tr -d ' ' | grep 'Ipforbu01:172.20.236.20'

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/08-01-arrays/prepare_q6.sh