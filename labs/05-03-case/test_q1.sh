#!/bin/bash

bash /home/moon/print-car-brand.sh | grep "Audi brand is from Germany"

if [ $? -ne 0 ]; then
    clear &&  echo "Скрипт не работает как ожидается" && exit 1
fi

clear && echo "Вопрос решен"