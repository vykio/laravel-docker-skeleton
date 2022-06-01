# The default environment file
ENVIRONMENT_FILE=$(shell pwd)/.env

PHP_CONTAINER=app
NGINX_CONTAINER=webserver
DB_CONTAINER=db

up:
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml stop

build:
	docker-compose -f docker-compose.yml build

run-mysql:
	docker-compose -f docker-compose.yml exec $(DB_CONTAINER) bash

generate-keys:
	docker-compose -f docker-compose.yml exec $(PHP_CONTAINER) php artisan key:generate
	docker-compose -f docker-compose.yml exec $(PHP_CONTAINER) php artisan config:cache

migrate:
	docker-compose -f docker-compose.yml exec $(PHP_CONTAINER) php artisan migrate

tinker:
	docker-compose -f docker-compose.yml exec $(PHP_CONTAINER) php artisan tinker
