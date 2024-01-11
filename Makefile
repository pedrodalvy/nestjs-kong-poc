up:
	docker compose up -d app_dev
.PHONY: app_local

prod:
	docker compose up -d app_prod
.PHONY: prod

down:
	docker compose rm -f -s -v
.PHONY: down
