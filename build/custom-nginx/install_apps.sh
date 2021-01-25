#!/bin/bash

mkdir -p /home/frappe/frappe-bench/sites/assets
mkdir -p /home/frappe/frappe-bench/apps

/get_app frappe https://github.com/frappe/frappe version-12
/get_app erpnext https://github.com/frappe/erpnext version-12
/redress

/get_app [app] [repo]

cd /home/frappe/frappe-bench/apps/frappe
yarn
yarn production
rm -fr node_modules
yarn install --production=true

chmod +x /rsync
