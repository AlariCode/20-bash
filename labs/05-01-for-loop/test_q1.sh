#!/bin/bash
cd /home/moon/

echo "Внимание, тестирование с циклами может занимать до минуты"

[ -f /home/moon/multi-deploy.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла multi-deploy.sh' && exit 1
fi

sh -c "export PATH=$PATH:/home/moon; labtest multi-deploy.sh" | awk -v RS='^$' 'END{exit !(index($0,"success") && index($0,"db-subsystem") && index($0,"backend") && index($0,"frontend") && index($0,"load-balancer") && index($0,"monitoring"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидалось" && exit 1
fi

cat /home/moon/multi-deploy.sh | grep for

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не использует for" && exit 1
fi


clear && echo "Вопрос решен"

bash /labs/05-01-for-loop/prepare_q2.sh