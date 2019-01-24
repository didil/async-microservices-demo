rabbitmqadmin -u guest -p guest declare vhost name=async-microservices-demo
rabbitmqadmin -u guest -p guest declare user name=appuser password=123456 tags=
rabbitmqadmin -u guest -p guest declare permission vhost=async-microservices-demo user=appuser configure=.* write=.* read=.*
rabbitmqadmin -u guest -p guest --vhost=async-microservices-demo declare exchange  name=processing type=direct durable=true
rabbitmqadmin -u guest -p guest --vhost=async-microservices-demo declare queue name=processing.requests durable=true
rabbitmqadmin -u guest -p guest --vhost=async-microservices-demo declare binding source=processing destination=processing.requests routing_key=request
rabbitmqadmin -u guest -p guest --vhost=async-microservices-demo declare queue name=processing.results durable=true
rabbitmqadmin -u guest -p guest --vhost=async-microservices-demo declare binding source=processing destination=processing.results routing_key=result