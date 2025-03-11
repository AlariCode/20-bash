#!/bin/bash

while true
do
  echo "1. Add"
  echo "2. Subsctract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  read -p "Enter your option: " option

  case "$option" in
    1)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 + $number2 ))
        ;;
    2)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 ))
        ;;
    3)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 ))
        ;;
    4)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
        ;;
    5)
        break
        ;;
  esac

done