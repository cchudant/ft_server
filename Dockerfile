# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchudant <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/28 19:56:41 by cchudant          #+#    #+#              #
#    Updated: 2019/12/02 16:56:40 by cchudant         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER Charles Chudant (cchudant@student.42.fr)

ARG AUTOINDEX=on

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget procps net-tools

# Install phpMyAdmin

RUN cd /tmp && \
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
	tar -xvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
	rm phpMyAdmin*.tar.gz && \
	mv phpMyAdmin* /usr/share/phpmyadmin && \
	mkdir /etc/phpmyadmin

# Install mysql

RUN apt-get install -y lsb-release gnupg

RUN cd /tmp && \
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb && \
	DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config* && \
	rm mysql-apt-config*

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

COPY srcs/mysql-sysv.sh /etc/init.d/mysql

RUN chmod +x /etc/init.d/mysql

RUN apt-get install -y php php-fpm php-mysqli php-pear php-mbstring \
	php-gettext php-common php-phpseclib php-mysql

# Install WordPress

RUN apt-get install -y wordpress curl

# Install nginx

RUN apt-get install -y nginx

# Setup phpMyAdmin

COPY srcs/phpmyadmin-config.php /usr/share/phpmyadmin/config.inc.php

RUN ln -s /usr/share/phpmyadmin /var/www/phpmyadmin && \
	groupadd phpmyadmin && \
	useradd -g phpmyadmin phpmyadmin

COPY srcs/php-fpm-phpmyadmin.conf /etc/php/7.3/fpm/pool.d/phpmyadmin_pool.conf

RUN touch /var/log/php-fpm-phpmyadmin.log && \
	chmod 777 /var/log/php-fpm-phpmyadmin.log

# Setup mysql

COPY srcs/setup_mysql.sh /tmp/setup_mysql.sh
COPY srcs/wordpress-dump.sql /tmp/wordpress-dump.sql

RUN bash /tmp/setup_mysql.sh && \
	rm /tmp/setup_mysql.sh /tmp/wordpress-dump.sql

# Setup wordpress

COPY srcs/wordpress-config.php /etc/wordpress/config-default.php

RUN ln -s /usr/share/wordpress /var/www/wordpress && \
	groupadd wordpress && \
	useradd -g wordpress wordpress

COPY srcs/php-fpm-wordpress.conf /etc/php/7.3/fpm/pool.d/wordpress_pool.conf

RUN touch /var/log/php-fpm-wordpress.log && \
	chmod 777 /var/log/php-fpm-wordpress.log

# Setup nginx

COPY srcs/nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s/autoindex off/autoindex ${AUTOINDEX}/" /etc/nginx/nginx.conf

COPY srcs/ssl-cert.key /etc/ssl/private/nginx-cert.key
COPY srcs/ssl-cert.crt /etc/ssl/certs/nginx-cert.crt

RUN rm -rf /var/www/html

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	tail -f /dev/null

EXPOSE 80 443
