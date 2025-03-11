#!/usr/bin/env bash

# Этот скрипт получает директорию в качестве аргумента
# Далее копируется все файлы из текущей директории в целевую, создавая копии как <filename>_bu
# Например 'my-pic.jpg' будет забэкаплен как 'my-pic.jpg_bu'

test $# -eq 0 && echo "no folder" && exit 1

mkdir ./$1
for i in *
do 
  [ -f "$i" ] && cp "$i" "./$1/${i}_bu"
done

ls -la "$1"