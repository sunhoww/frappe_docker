#!/bin/bash

APP_NAME=${1}
APP_REPO=${2}
APP_BRANCH=${3}

apps_dir="/home/frappe/frappe-bench/apps"
sites_dir="/home/frappe/frappe-bench/sites"

[ "${APP_BRANCH}" ] && BRANCH="-b ${APP_BRANCH}"

cd $apps_dir
git clone --depth 1 ${APP_REPO} ${BRANCH} ${APP_NAME}

if [[ "${APP_NAME}" != "frappe" ]] && [[ "${APP_NAME}" != "erpnext" ]]; then
    if [[ -f "$apps_dir/${APP_NAME}/package.json" ]]; then
        cd $apps_dir/${APP_NAME}
        npm install
    fi
fi

mkdir -p $sites_dir/assets/${APP_NAME}
cp -R $apps_dir/${APP_NAME}/${APP_NAME}/public/* $sites_dir/assets/${APP_NAME}

echo "${APP_NAME}" >> $sites_dir/apps.txt
echo "rsync -a --delete /var/www/html/assets/${APP_NAME} /assets" >> /rsync