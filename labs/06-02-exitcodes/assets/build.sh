set -e

task_name=$1

mkdir $task_name

builder-connect $task_name
builder-creds $task_name
builder-repo $task_name
builder-build $task_name
builder-test $task_name
builder-deploy $task_name

current_status=$(builder-status $task_name)

echo "The status of build is $current_status"

if  [ $current_status = "failed" ]
then
    builder-debug  $task_name
fi