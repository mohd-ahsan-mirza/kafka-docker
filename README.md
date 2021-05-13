# Description
Simple kafka service setup using docker and a wrapper for some of the most common Kafka cli commands

# Usage

## Service

### To start the service
`make build`

### To shut down the service
`make clean`

## Kafka commands

### List Topics
`make list-topics`

### Create topic
`make create-topic topic={topic name} r={replication-factor} p={partitions}`

### Describe topics
`make describe-topics topic={topic name}`

### List Kafka topics (with configuration values) that have specific configuration overrides
`make describe-topics-with-overrides`

### Produce a message to a Kafka topic using command prompt
`make console-producer topic={topic name}`

### Produce messages to the topic from the file
`make file-producer topic={topic name} file={file path}`

### Produce messages to Kafka with both key and value
`make key-value-producer topic={topic name} sep={separator between key and value}`

### Consume a Kafka topic
`make console-consumer topic={topic name}`

### Consume a Kafka topic and show both key and value
`make key-value-consumer topic={topic name}`
