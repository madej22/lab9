server
{
	listen 80;
	root /var/www/html;
	location /
	{
		try_files $uri /index.php$is_args$args;
	}
	location ~ ^/.+\.php(/|$)
	{
		fastcgi_pass php:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
}