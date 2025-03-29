#!/bin/bash
cd /home/moon/

usermod -s /bin/bash moon

/home/moon/change_shell.sh moon /bin/sh && grep moon /etc/passwd | grep bin/sh

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт работает неверно' && exit 1
fi

clear && echo "Вопрос решен"