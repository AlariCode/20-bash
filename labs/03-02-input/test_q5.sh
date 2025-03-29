#!/bin/bash
cd /home/moon/

cat /home/moon/backup-file.sh | grep "\$1"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не использует $1' && exit 1
fi

rm -rf /home/moon/prepare-and-deploy_bu; 
bash /home/moon/backup-file.sh prepare-and-deploy && ls prepare-and-deploy_bu

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/03-02-input/prepare_q6.sh