function simple_summ{
  sum=$(( $1 + $2 ))
}

result=$(simple_summ 3 5)
echo "The result is $result"