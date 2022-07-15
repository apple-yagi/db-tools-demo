
.PHONY: schemaspy
schemaspy:
	docker run --rm -v $(PWD)/docs:/output --net="host" \
	schemaspy/schemaspy:6.1.0 -t pgsql -host localhost:15432 \
	-db study-meeting -u student -p password \
	-connprops useSSL\\\\=false -all
