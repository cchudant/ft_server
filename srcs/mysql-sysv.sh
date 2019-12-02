#!/bin/sh

NAME=mysql
DAEMON=/usr/bin/mysqld_safe
ARGS='--default-authentication-plugin=mysql_native_password'
PIDFILE=/var/run/mysql.pid

case "$1" in
	start)
		start-stop-daemon --start --quiet --make-pidfile --background \
				--pidfile "$PIDFILE" --exec "$DAEMON" --name "$NAME" -- $ARGS
		;;
	stop)
		start-stop-daemon --stop --signal QUIT --quiet \
				--remove-pidfile --retry=TERM/30/KILL/5 \
				--pidfile "$PIDFILE" --exec "$DAEMON" --name "$NAME"
		;;
	*)
		echo "Usage: $0 {start|stop}"
		exit 5
esac
