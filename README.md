# How to build Dockerfile
Go into the directory that contains the Dockerfile and run below command:
(You don't need http_proxy if you are not behind a proxy)
`docker build --build-arg http_proxy=http://194.138.0.5:9400 -t rabbitmq1:latest .`

# Creating a local network 
Run below command to create an internal network
`docker network create -d bridge --subnet rabbit-clusterrabbit-cluster`

# Running RabbitMQ docker images using the internal network
Run below command to start RabbitMQ nodes
`docker run --network rabbit-cluster --hostname r1 -P --name r1 rabbitmq1:latest`