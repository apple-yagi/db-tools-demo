DB_HOST = localhost
DB_PORT = 15432
DB_NAME = study-meeting
DB_USER = student
DB_PASS = password

.PHONY: schemaspy
schemaspy:
	docker run --rm -v $(PWD)/docs:/output --net="host" \
	schemaspy/schemaspy:6.1.0 -t pgsql -host $(DB_HOST):$(DB_PORT) \
	-db $(DB_NAME) -u $(DB_USER) -p $(DB_PASS) \
	-connprops useSSL\\\\=false -all
