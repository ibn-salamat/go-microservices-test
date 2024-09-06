DB_DSN?="postgres://postgres:password@localhost:5432/users?sslmode=disable"
MIGRATIONS_DIR?="./user-service/migrations"

up:
	docker-compose up -d
down:
	docker-compose down

migrate_up:
	@migrate -verbose -path ${MIGRATIONS_DIR} -database ${DB_DSN} up

migrate_down:
	@migrate -verbose -path ${MIGRATIONS_DIR} -database ${DB_DSN} down

migrate_create:
	@migrate create -dir ${MIGRATIONS_DIR} -ext sql -seq ${name}