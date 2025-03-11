cd /var/log/apps/

echo -e " Log name \tGET \tPOST \tPATCH \tHEAD \tPUT \tDELETE "
echo -e "---------------------------------------------------------------"

get_requests=$(cat manager_app.log | grep "GET" | wc -l)
post_requests=$(cat manager_app.log | grep "POST" | wc -l)
patch_requests=$(cat manager_app.log | grep "PATCH" | wc -l)
head_requests=$(cat manager_app.log | grep "HEAD" | wc -l)
put_requests=$(cat manager_app.log | grep "PUT" | wc -l)
delete_requests=$(cat manager_app.log | grep "DELETE" | wc -l)

echo -e " manager \t${get_requests} \t${post_requests} \t${patch_requests} \t ${head_requests} \t${put_requests} \t${delete_requests}"