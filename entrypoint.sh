#!/bin/bash
if [ -z "$(ls -A -- "/usr/local/lsws/conf/")" ]; then
	cp -R /usr/local/lsws/.conf/* /usr/local/lsws/conf/
fi
if [ -z "$(ls -A -- "/usr/local/lsws/admin/conf/")" ]; then
	cp -R /usr/local/lsws/admin/.conf/* /usr/local/lsws/admin/conf/
fi
chown 999:999 /usr/local/lsws/conf -R
chown 999:1000 /usr/local/lsws/admin/conf -R

rm /usr/local/lsws/lsphp82/etc/php/8.2/litespeed/php.ini
cp /php.ini /usr/local/lsws/lsphp82/etc/php/8.2/litespeed/

/usr/local/lsws/bin/lswsctrl start
/wordpress.sh

rm /usr/local/lsws/admin/misc/admpass.sh
cp /admpass.sh /usr/local/lsws/admin/misc/
/usr/local/lsws/admin/misc/admpass.sh

$@
while true; do
	if ! /usr/local/lsws/bin/lswsctrl status | /usr/bin/grep 'litespeed is running with PID *' > /dev/null; then
		break
	fi
	sleep 60
done

