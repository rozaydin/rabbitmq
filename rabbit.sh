#!/bin/bash
rabbitmq-server&
echo "server started ..."
sleep 1
echo "provisioning performed ..."
sleep 1 
rabbitmqctl start_app
echo "application started ..."
sleep 15
rabbitmqctl add_user admin admin 
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p / ".*" ".*" ".*"
wait