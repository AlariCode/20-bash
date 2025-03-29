#!/bin/bash
cd /home/moon/

cat /home/moon/calculation.sh | awk -v RS='^$' 'END{exit !(index($0,"+") && index($0,"-") && index($0,"*") && index($0,"/"))} '

if [ $? -ne 0 ]; then
    clear && echo 'В скрипте не использованы арифметические операции' && exit 1
fi

bash /home/moon/calculation.sh | grep Sum | grep 30

if [ $? -ne 0 ]; then
    clear &&  echo "Сумма не работает" && exit 1
fi

bash /home/moon/calculation.sh | grep Difference | grep 10

if [ $? -ne 0 ]; then
    clear &&  echo "Разность не работает" && exit 1
fi

bash /home/moon/calculation.sh | grep Product | grep 200

if [ $? -ne 0 ]; then
    clear &&  echo "Произведение не работает" && exit 1
fi

bash /home/moon/calculation.sh | grep Quotient | grep 2

if [ $? -ne 0 ]; then
    clear &&  echo "Частное не работает" && exit 1
fi

clear && echo "Вопрос решен"