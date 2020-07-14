FROM frappe/erpnext-worker:v12.10.0

RUN install_app [app] [repo]

# Google Cloud Storage interoperablity
RUN sed -i "s/list_objects_v2/list_objects/" /home/frappe/frappe-bench/commands/push_backup.py