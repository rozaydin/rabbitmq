rabbitmq-server&
echo "server started ..."
sleep 5 
rabbitmqctl start_app
echo "application started ..."
rabbitmqctl add_user admin admin 
rabbitmqctl set_user_tags admin administrator
echo "provisioning performed ..."
wait