# Asynchronous Microservices with RabbitMQ and Node.js

## Setup
After Provisioning RabbitMQ, run
````
npm install
node rabbit_mq_setup.js
cd web-service
node web-service.js
// in a different terminal
cd processor-service 
node processor-service.js
````

In a third terminal, send a request to test the processing:
````
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"data":"my-data"}' \
  http://localhost:3000/api/v1/processData
````

You should see the results in the web service terminal after a few seconds:
````
Results saved
requestId: x , resultsData: my-data-processed

````
