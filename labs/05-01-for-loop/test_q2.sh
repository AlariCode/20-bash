#!/bin/bash
echo "Внимание, тестирование с циклами может занимать до минуты"

[ -f /home/moon/multi-deploy.sh ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет файла multi-deploy.sh' && exit 1
fi

sh -c "export PATH=$PATH:/home/moon; labtest multi-deploy.sh" | awk -v RS='^$' 'END{exit !(index($0,"success") && index($0,"dev-sandbox") && index($0,"stage-sandbox") && index($0,"preprod-sandbox"))} '

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидалось" && exit 1
fi

clear && echo "Вопрос решен"