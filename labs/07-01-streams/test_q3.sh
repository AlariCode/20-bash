#!/bin/bash

rm -rf /tmp/errors_warnings.txt

cat /home/moon/errors_warnings.txt | grep level=warning && cat errors_warnings.txt | grep level=error

if [ $? -ne 0 ]; then
    clear && echo 'errors_warnings.txt не содержит события уровней warning и error' && exit 1
fi

cat /home/moon/errors_warnings.txt | grep level=info | wc -l | grep 0

if [ $? -ne 0 ]; then
    clear && echo 'errors_warnings.txt содержит события уровеня info' && exit 1
fi

clear && echo "Вопрос решен"