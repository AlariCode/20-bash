#!/bin/bash

[ -f /usr/share/nginx/html/public/app/Providers/AppServiceProvider.php ]

if [ $? -ne 0 ]; then
    clear && echo 'Нет AppServiceProvider.php' && exit 1
fi

sudo sed -i '/forceScheme/d' /usr/share/nginx/html/public/app/Providers/AppServiceProvider.php