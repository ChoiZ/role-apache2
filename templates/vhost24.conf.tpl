# Default Apache virtualhost template

ServerName {{ apache.servername }}

{% for vhost in apache.apache_vhosts %}
<VirtualHost *:80>
    ServerAdmin {{ vhost.serveradmin }}
    DocumentRoot {{ vhost.docroot }}
    ServerName {{ vhost.servername }}
{% if vhost.serveralias is defined %}
    ServerAlias {{ vhost.serveralias }}
{% endif %}

    <Directory {{ vhost.docroot }}>
        AllowOverride All
        Options -Indexes +FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
{% endfor %}
