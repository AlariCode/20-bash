echo $(percentage 50 100)

function percentage() {
  value=$1
  total=$2
  percent=$(( 100 * $value / $total ))
  echo $percent
}