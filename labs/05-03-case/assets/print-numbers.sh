target_number=$1
current_number=0
while [ $current_number -lt $target_number ]
  echo $(( current_number++ ))
done