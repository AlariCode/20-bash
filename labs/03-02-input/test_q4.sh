#!/bin/bash

cat /home/moon/show-vendor.sh | awk -v RS='^$' 'END{exit !(index($0,"$1") && index($0,"$2"))} '

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует $1 и $2' && exit 1
fi

/home/moon/show-vendor.sh Opel Kadett > /tmp/output4
cat /tmp/output4 | grep "Vendor of Kadett is Opel"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-02-input/prepare_q5.sh