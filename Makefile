.PHONY: copy
copy:
	cp -r *.web client-web
	cp -r *.api server-api

.PHONY: up
up: copy
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: logs
logs:
	docker compose logs -f

.PHONY: build
build: copy
	docker compose build

.PHONY: fix-sql
fix-sql:
	sed -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g' -i dumps.db/*.sql
