FROM ubuntu:18.04
RUN apt-get update 
RUN apt-get -y install htop
RUN apt-get -y install wget
RUN apt-get -y install gnupg
RUN apt-get -y install vim
RUN apt-get -y install dos2unix
RUN apt-get install -y iputils-ping

# Install RabbitMQ latest
RUN wget -qO - "https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc" | apt-key add -
# RUN apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA"
RUN apt-get -y install apt-transport-https
COPY --chown=root ./bintray.rabbitmq.list /etc/apt/sources.list.d/

# install erlang and rabbitmq
RUN apt-get update
RUN apt-get -y install erlang-nox rabbitmq-server

EXPOSE 15672/tcp
EXPOSE 1883/tcp
EXPOSE 5672/tcp
EXPOSE 15675/tcp

# upload rabbitmq configuration
COPY --chown=root ./rabbitmq.conf /etc/rabbitmq/
# RUN dos2unix /etc/rabbitmq/rabbitmq.conf

# RUN echo 'vm_memory_high_watermark.relative = 0.7' >> /etc/rabbitmq/rabbitmq.conf
# RUN echo 'hipe_compile = true' >> /etc/rabbitmq/rabbitmq.conf
# RUN echo 'num_acceptors.tcp = 50' >> /etc/rabbitmq/rabbitmq.conf
# RUN echo 'channel_max = 1' >> /etc/rabbitmq/rabbitmq.conf


# RUN chmod 600 /etc/rabbitmq/rabbitmq.conf
# upload erlang cookie

RUN echo "cookie" > $HOME/.erlang.cookie
RUN chmod 600 $HOME/.erlang.cookie
RUN cp $HOME/.erlang.cookie /var/lib/rabbitmq/.erlang.cookie
# RUN ls -lart /var/lib/rabbitmq/.erlang.cookie

# enable rabbitmq plugins
RUN rabbitmq-plugins enable rabbitmq_auth_backend_cache rabbitmq_auth_backend_http rabbitmq_event_exchange rabbitmq_management rabbitmq_mqtt rabbitmq_web_dispatch rabbitmq_web_mqtt
COPY ./rabbit.sh /
RUN chmod +x /rabbit.sh

# start rabbitmq 
# RUN rabbitmq-server -detached
# RUN rabbitmqctl start_app  && sleep 5 
# RUN rabbitmqctl status
# RUN rabbitmqctl add_user admin admin && rabbitmqctl set_user_tags admin administrator

CMD ["/bin/bash", "/rabbit.sh"]
