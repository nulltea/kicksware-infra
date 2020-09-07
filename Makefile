stack:
	docker-compose build;
	docker-compose down;
	docker-compose up -d;

mongo-backup:
	docker exec mongo mongodump -u $(MONGO_USER) -p $(MONGO_PASSWORD) --authenticationDatabase admin --db=sneakerResaleDB  --out=/backup || echo "mongo down - backup impossible";

mongo-restore:
	docker exec mongo mongorestore -u $(MONGO_USER) -p $(MONGO_PASSWORD) --authenticationDatabase admin ./backup;
