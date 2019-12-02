service mysql start

while [ -z "$(netstat -l | grep mysql)" ]
do
	echo "waiting for the mysql server to start..."
	sleep 1
done

mysql < /usr/share/phpmyadmin/sql/create_tables.sql

mysql -e 'CREATE DATABASE wordpress;'
mysql < /tmp/wordpress-dump.sql

mysql -e 'CREATE USER "unicorn"@"localhost" IDENTIFIED BY "unicorn";'
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "unicorn"@"localhost" WITH GRANT OPTION;'
mysql -e 'CREATE USER "phpmyadmin"@"localhost" IDENTIFIED BY "K^f29D!ocXbfcIAZ%Jc4uF$Xz";'
mysql -e 'GRANT ALL PRIVILEGES ON phpmyadmin.* TO "phpmyadmin"@"localhost";'
mysql -e 'CREATE USER "wordpress"@"localhost" IDENTIFIED BY "bICI88tGcv4Ta#Kz$fZ9gJyve";'
mysql -e 'GRANT ALL PRIVILEGES ON wordpress.* TO "wordpress"@"localhost";'
mysql -e 'FLUSH PRIVILEGES;'

service mysql stop
exit 0
