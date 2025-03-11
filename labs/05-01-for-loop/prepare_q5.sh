#!/bin/bash


cp /labs/05-01-for-loop/assets/apps.txt /home/moon/; cp /labs/05-01-for-loop/assets/count-requests.sh /home/moon/count-requests.sh;
chmod +x /home/moon/count-requests.sh; chown moon:moon /home/moon/count-requests.sh; sudo mkdir -p /var/log/apps/; sudo chown moon:moon /var/log/apps/; 

cp /labs/05-01-for-loop/assets/ci-runners_app.log /labs/05-01-for-loop/assets/federation_app.log /labs/05-01-for-loop/assets/manager_app.log /labs/05-01-for-loop/assets/object-store_app.log /var/log/apps/;