FROM nginx:stable AS NGINX_SSL

ENV NGINX_CONF /etc/nginx/conf.d

WORKDIR $NGINX_CONF

RUN  apt-get update \
      && apt-get install -y cron certbot python-certbot-nginx bash wget nano \
      && rm -rf /var/lib/apt/lists/* \
      && echo "PATH=$PATH" > /etc/cron.d/certbot-renew  \
      && echo "@monthly certbot renew --nginx >> /var/log/cron.log 2>&1" >>/etc/cron.d/certbot-renew \
      && crontab /etc/cron.d/certbot-renew

ADD default.conf $NGINX_CONF

VOLUME /etc/letsencrypt
VOLUME /var/www/certbot

CMD [ "sh", "-c", "cron && nginx -g 'daemon off;'" ]
