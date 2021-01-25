# Google Cloud Storage interoperablity
sed -i "s/conn.upload_file(filename, bucket, destpath)/conn.upload_file(filename, bucket, destpath, Config=boto3.s3.transfer.TransferConfig(multipart_threshold=5 * 1024 ** 3))/" /home/frappe/frappe-bench/commands/utils.py
sed -i "s/list_objects_v2/list_objects/" /home/frappe/frappe-bench/commands/push_backup.py

echo "Redressed"
