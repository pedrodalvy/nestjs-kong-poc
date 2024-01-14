dev:
	docker compose up -d app_dev
	docker compose up -d kong
.PHONY: app_local

prod:
	docker compose up -d app_prod --build
	docker compose up -d kong
.PHONY: prod

down:
	docker compose rm -f -s -v
.PHONY: down
