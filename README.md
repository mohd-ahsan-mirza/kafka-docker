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

