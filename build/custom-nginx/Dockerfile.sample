FROM bitnami/node:12-prod

RUN mkdir -p /home/frappe/frappe-bench/sites/assets; \
    mkdir -p /home/frappe/frappe-bench/apps; \
    install_packages git python2
COPY ./clone_app.sh /clone_app
COPY ./install_apps.sh /install_apps

RUN /clone_app frappe https://github.com/frappe/frappe.git version-12
RUN /clone_app [app] [repo]
RUN /install_apps

FROM frappe/erpnext-nginx:v12.10.0

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo "rsync -a --delete /var/www/html/assets/erpnext /assets" >> /rsync
RUN echo -n "\n[app]" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
