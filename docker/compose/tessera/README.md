
# Deploy a Local private channel
This guide allows you to set up a **local private chanel**  for testing and development purposes. After completing the node deployment, you can also follow our complementary   guide to send a private transaction. This node is a local and isolated one, so you are not connected to the LACChain Networks. In order to deploy a node in the LACChain Networks, you can use our Installation private channel Using Ansible,  Using Dockers, and  Using Kubernettes. 



## Minimum System Requirements

Recommended hardware features for Tessera node:

| Recommended Hardware  | On Pro-Testnet |
|:---:|:---:|
| CPU | 2 vCPUs | 
| RAM Memory | 8 GB | 
| Hard Disk  | 200 GB SSD |


## Clone Repository

To configure and deploy your node, you must clone this git repository in your machine.

```bash
$ git clone https://github.com/LACNet-Networks/besu-networks
```

## Install Docker and Docker compose

Make sure you have Docker and Docker-compose installed on machine. If not, you can install them following the instructions to [install docker](https://docs.docker.com/engine/install/centos/) and [docker-compose](https://docs.docker.com/compose/install/).


## Run private network
Execute the following command to run your containers:

```bash
$ cd besu-networks/docker/compose/tessera/
```
this network has 3 besu nodes with private channel using tessera.

run following command:

```bash
$ docker-compose up -d
```

> **Note** : Keep in mind that a `172.16.238.0/24` subnet is created by docker and ip assigned to the containers on subnet. If this subnet is already in use you can change it in the docker-compose.yml file.

## Verify your private channel
Check if the node validator is produced blocks by getting the log of the Besu containter
```bash
$ docker-compose logs -f besu1
```
Check if the node writers are syncing blocks by getting the log of the Besu containter
```bash
$ docker-compose logs -f besu2
$ docker-compose logs -f besu3
```
Check if the nodes tessera are  polling round.
```bash
$ docker-compose logs -f tessera1
$ docker-compose logs -f tessera2
$ docker-compose logs -f tessera3
```

## Stop your private channel
If you want or need to stop your private channel, please execute one of the following commands:
```bash
$ docker-compose down
```
Or:
```bash
$ docker compose down
```

## Next steps
Now you can continue send private tansaction in your private channel following this [guide](https://github.com/LACNetNetworks/samples/tree/feature/tessera/tessera).