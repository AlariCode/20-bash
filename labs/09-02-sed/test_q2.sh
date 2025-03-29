#!/bin/bash
cd /home/moon/

bash -c "[[ -x \"/home/moon/book-fixer.sh\" ]]"

if [ $? -ne 0 ]; then
    clear && echo 'Скрипт не исполняемый' && exit 1
fi

rm /home/moon/life-of-pi.txt /home/moon/alice-in-wonderland.txt

echo 2 | /home/moon/book-fixer.sh "/home/moon/mixed-book.txt" "/home/moon/life-of-pi.txt"
echo 1 | /home/moon/book-fixer.sh "/home/moon/mixed-book.txt" "/home/moon/alice-in-wonderland.txt"

cat /home/moon/life-of-pi.txt | tr -d '\n' | tr -d ' ' | grep 'Mysufferingleftmesadandgloomy.Academicstudyandthesteady,mindfulpracticeofreligionslowlywroughtmebacktolife.Ihavekeptupwithwhatsomepeoplewouldconsidermystrangereligiouspractices.Afteroneyearofhighschool,IattendedtheUniversityofTorontoandtookadouble-majorBache'

if [ $? -ne 0 ]; then
    clear && echo 'В файле life-of-pi.txt неверный контент' && exit 1
fi

cat /home/moon/alice-in-wonderland.txt | tr -d '\n' | tr -d ' ' | grep 'Alicewasbeginningtogetverytiredofsittingbyhersisteronthebank,andofhavingnothingtodo:onceortwiceshehadpeepedintothebookhersisterwasreading,butithadnopicturesorconversationsinit'

if [ $? -ne 0 ]; then
    clear && echo 'В файле alice-in-wonderland.txt неверный контент' && exit 1
fi

clear && echo "Вопрос решен"

bash /labs/09-02-sed/prepare_q3.sh