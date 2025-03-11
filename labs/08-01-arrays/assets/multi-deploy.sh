#!/bin/bash

declare -a tasks

for task in db-subsystem backend frontend load-balancer monitoring
do
  bash /home/moon/prepare-and-deploy $task
done