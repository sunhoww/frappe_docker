#!/bin/bash

frappe_dir="/home/frappe/frappe-bench/apps/frappe"

for app in /home/frappe/frappe-bench/apps/*; do
    if [[ "$app" != "$frappe_dir" ]] && [[ -f "$app/package.json" ]]; then
        cd $app
        npm install
    fi
done

cd "$frappe_dir"
yarn
yarn production
rm -fr node_modules
yarn install --production=true

chmod +x /rsync

rm /home/frappe/frappe-bench/sites/apps.txt
