FROM php:7.4-apache-buster

ENV	COMPOSER_ALLOW_SUPERUSER	1

RUN	apt-get update && apt-get install -y \
	openssl \
	git \
	unzip \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
	&& composer --version

RUN	git clone https://github.com/eminmuhammadi/jikan-rest.git . \
	&& composer require 'composer/package-versions-deprecated' \
	&& composer install --prefer-dist --no-progress --classmap-authoritative  --no-interaction \
	&& composer update jikan-me/jikan

ADD	.env	/run-jikan.sh	./

EXPOSE 60080

ENTRYPOINT	["./run-jikan.sh"]
