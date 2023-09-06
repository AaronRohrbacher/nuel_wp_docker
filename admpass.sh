CUR_DIR=`dirname "$0"`
cd $CUR_DIR
CUR_DIR=`pwd`

if ! [ $LSWS_USERNAME ]; then
        echo "Not setting Litespeed Webserver credentials."; exit;
fi
if ! [ $LSWS_PASSWORD ]; then
        echo "Not setting Litespeed Webserver credentials."; exit;
fi

ENCRYPT_PASS=`$CUR_DIR/../fcgi-bin/admin_php -q $CUR_DIR/htpasswd.php $LSWS_PASSWORD`

echo "$LSWS_USERNAME:$ENCRYPT_PASS" > $CUR_DIR/../conf/htpasswd 
if [ $? -eq 0 ]; then
        echo "Litespeed Webserver credentials are set. Enjoy the Nuel experience!"
fi