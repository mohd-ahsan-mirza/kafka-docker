all:
	@echo ""
	@cat README.md
	@echo ""
build:
	docker-compose up -d
clean:
	docker-compose down
list-topics:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --list
create-topic:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic $(topic) --partitions $(p) --replication-factor $(r) --if-not-exists
describe-topics:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --describe --topic $(topic) --zookeeper localhost:2181
describe-topics-with-overrides:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --describe --topics-with-overrides
console-producer:
	@./kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic)
file-producer:
	@./kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic) < $(file)
key-value-producer:
	@./kafka_2.11-1.0.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic) --property parse.key=true --property key.separator=$(sep)
key-value-consumer:
	@./kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $(topic) --formatter kafka.tools.DefaultMessageFormatter --property print.key=true --property print.value=true --from-beginning
console-consumer:
	@./kafka_2.11-1.0.0/bin/kafka-console-consumer.sh --topic $(topic) --from-beginning --bootstrap-server localhost:9092
increase-partitions:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic $(topic) --partitions $(p)
get-topic-config:
	@./kafka_2.11-1.0.0/bin/kafka-configs.sh --describe --zookeeper localhost:2181 --entity-type topics --entity-name $(topic)
update-retention-period:
	@./kafka_2.11-1.0.0/bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $(topic) --add-config retention.ms=$(period)
reset-retention-period:
	@./kafka_2.11-1.0.0/bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $(topic) --delete-config retention.ms
purge-topic:
	@make update-retention-period topic=$(topic) period=1000
	@echo "Sleeping for 5 mins"
	@sleep 300
	@make reset-retention-period topic=$(topic)
delete-topic:
	@./kafka_2.11-1.0.0/bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic $(topic)