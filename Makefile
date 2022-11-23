# help by https://makefiletutorial.com/
# successeful example https://itnext.io/docker-makefile-x-ops-sharing-infra-as-code-parts-ea6fa0d22946
# all our targets are phony (no files to check)
.PHONY: help build start stop

help:
	@echo ''
	@echo 'Usage: make [TARGET] [OPTIONS]?'
	@echo 'Targets:'
	@echo '	build		build docker containers'
	@echo '	start		start containers'
	@echo '	stop		stop containers'
	@echo '	sh		attach to container shell s=backend|frontend|persistent|temporary default=backend'
	@echo '					example: make s=backend sh'
	@echo '	log		attach to container stdout,stderr s=backend|frontend|persistent|temporary default=backend'
	@echo '					example: make s=backend log'
	@echo ''

USER_ID := $(shell id -u)
USER_NAME := $(shell id -un)
GROUP_ID := $(shell id -g)
GROUP_NAME := $(shell id -gn)
export USER_ID
export USER_NAME
export GROUP_ID
export GROUP_NAME

# we install npm dependencies to have it in host filesystem (for IDE)
_install-backend:
	docker compose run backend yarn install

_install-frontend:
	docker compose run frontend yarn install

_build:
	docker compose build --no-cache

build: _build _install-backend _install-frontend

start:
	docker compose up -d --remove-orphans

stop: 
	docker compose down

s = backend
sh:
	docker compose exec $(s) sh

log:
	docker compose logs -f $(s)


run:
	docker compose run $(s) $(c)
