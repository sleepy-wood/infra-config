.PHONY: up
up:
	cp *.web client-web
	cp *.api server-api
	docker compose up -d

.PHONY: fix-sql
fix-sql:
	sed -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g' -i dumps/*.sql
