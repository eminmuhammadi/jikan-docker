FROM php:8.1.1-apache-buster

ENV	COMPOSER_ALLOW_SUPERUSER	1

RUN	apt-get update && apt-get install -y \
	openssl \
	git \
	unzip \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer --version

RUN	git clone https://github.com/eminmuhammadi/jikan-rest.git . \
	&& composer require 'composer/package-versions-deprecated' \
	&& composer install --ignore-platform-reqs --prefer-dist --no-progress --classmap-authoritative  --no-dev --no-interaction --optimize-autoloader \
	&& composer update jikan-me/jikan

ADD	.env	/run-jikan.sh	./

EXPOSE 60080

ENTRYPOINT	["./run-jikan.sh"]
