#!/bin/bash

bash /home/moon/calculation.sh 15 5 | grep Sum | grep 20

if [ $? -ne 0 ]; then
    clear &&  echo "Сумма неверна" && exit 1
fi

bash /home/moon/calculation.sh 15 5 | grep Difference | grep 10

if [ $? -ne 0 ]; then
    clear &&  echo "Разность неверна" && exit 1
fi

bash /home/moon/calculation.sh 15 5 | grep Product | grep 75

if [ $? -ne 0 ]; then
    clear &&  echo "Произведение неверно" && exit 1
fi

bash /home/moon/calculation.sh 15 5 | grep Quotient | grep 3

if [ $? -ne 0 ]; then
    clear &&  echo "Частное неверно" && exit 1
fi

bash /home/moon/calculation.sh 18 3 | grep Sum | grep 21

if [ $? -ne 0 ]; then
    clear &&  echo "Сумма неверна" && exit 1
fi

bash /home/moon/calculation.sh 18 3 | grep Difference | grep 15

if [ $? -ne 0 ]; then
    clear &&  echo "Разность неверна" && exit 1
fi

bash /home/moon/calculation.sh 18 3 | grep Product | grep 54

if [ $? -ne 0 ]; then
    clear &&  echo "Произведение неверно" && exit 1
fi

bash /home/moon/calculation.sh 18 3 | grep Quotient | grep 6

if [ $? -ne 0 ]; then
    clear &&  echo "Частное неверно" && exit 1
fi


clear && echo "Вопрос решен"