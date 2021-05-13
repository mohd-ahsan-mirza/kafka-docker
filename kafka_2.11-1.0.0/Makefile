list-topics:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --list
create-topic:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic $(topic) --partitions $(p) --replication-factor $(r) --if-not-exists
describe-topics:
	@./bin/kafka-topics.sh --describe --topic $(topic) --zookeeper localhost:2181
describe-topics-with-overrides:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --describe --topics-with-overrides
console-producer:
	@./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic)
file-producer:
	@./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic) < $(file)
key-value-producer:
	@./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic) --property parse.key=true --property key.separator=$(sep)
key-value-consumer:
	@./bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $(topic) --formatter kafka.tools.DefaultMessageFormatter --property print.key=true --property print.value=true --from-beginning
console-consumer:
	@./bin/kafka-console-consumer.sh --topic $(topic) --from-beginning --bootstrap-server localhost:9092
increase-partitions:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic $(topic) --partitions $(p)
increase-retention-period:
	@./bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $(topic) --add-config retention.ms=$(ret)
get-topic-config:
	@./bin/kafka-configs.sh --describe --zookeeper localhost:2181 --entity-type topics --entity-name $(topic)
purge-topic:
	@./bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $(topic) --add-config retention.ms=10
	@sleep 300
	@./bin/kafka-configs.sh --zookeeper localhost:2181 --alter --entity-type topics --entity-name $(topic) --delete-config retention.ms
delete-topic:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic $(topic)