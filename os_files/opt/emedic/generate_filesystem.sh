#!/bin/Bash

FILE_NAME=magento-`date +"%Y-%m-%d_%H-%M"`.tar
cd /var/www/html
tar cf ../$FILE_NAME . --exclude "./pub/static" --exclude "./pub/var/cache" --exclude "./pub/var/composer_home" --exclude "./pub/var/generation" --exclude "./pub/var/page_cache" --exclude "./pub/var/view_preprocessed" --exclude "./pub/media/catalog/product"
tar -rf ../$FILE_NAME pub/static/.htaccess
gzip ../$FILE_NAME
aws s3 cp ../${FILE_NAME}.gz s3://emedic360-build-artifacts/magento-filesystem/${FILE_NAME}.gz
rm ../${FILE_NAME}.gz