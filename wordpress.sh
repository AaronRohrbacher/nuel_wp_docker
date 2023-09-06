WORDPRESS=/var/www/vhosts/localhost/html
if [ ! -f "$WORDPRESS/wp-config.php" ]; then
        echo "Beginning WordPress installation. Please wait."
        wp core download --allow-root --path="$WORDPRESS"
        wp core config --allow-root --path="$WORDPRESS" --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --url=$WORDPRESS_SITEURL
else
        echo "Using existing WordPress installation. Enjoy the Nuel experience!"
fi
