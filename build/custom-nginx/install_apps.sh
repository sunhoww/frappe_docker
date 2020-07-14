#!/bin/bash

cd /home/frappe/frappe-bench/apps/frappe
yarn
yarn production
rm -fr node_modules
yarn install --production=true

chmod +x /rsync

rm /home/frappe/frappe-bench/sites/apps.txt
