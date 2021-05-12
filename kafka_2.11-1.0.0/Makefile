list-topics:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --list
create-topic:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic $(topic) --partitions $(p) --replication-factor $(r) --if-not-exists
describe-topics:
	@./bin/kafka-topics.sh --describe --topic $(topic) --zookeeper localhost:2181
console-producer:
	@./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $(topic)
console-consumer:
	@./bin/kafka-console-consumer.sh --topic $(topic) --from-beginning --bootstrap-server localhost:9092
increase-partitions:
	@./bin/kafka-topics.sh --zookeeper localhost:2181 --alter --topic $(topic) --partitions $(p)
