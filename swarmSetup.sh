#!/bin/bash

source "$(dirname $0)/colorfulOutput.sh"

#Create a base machine to work from (most people already have one set up, let's just create one to be sure)
echogreen "Creating base machine named: swarmSetupBaseBox"
docker-machine create -d virtualbox swarmSetupBaseBox
#Point docker client to the newly created base box
eval "$(docker-machine env swarmSetupBaseBox)"
#Create a swarm image and save the output to extract the discovery token
swarmCreateOutputText=${docker run swarm create}
#Extract the last line which is the discovery token (this could have been done in the previous step but we want to see the full output)
discoveryToken=${echo $swarmCreateOutputText | tail -n1}
echogreen "Swarm discovery token is $discoveryToken"

echogreen "Creating swarm master (swarm-master)"
docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://$discoveryToken swarm-master

echogreen "Creating first swarm node (swarm-agent-00)"
docker-machine create -d virtualbox --swarm --swarm-discovery token://$discoveryToken swarm-agent-00
echogreen "Creating second swarm node (swarm-agent-01)"
docker-machine create -d virtualbox --swarm --swarm-discovery token://$discoveryToken swarm-agent-01

echogreen "Switching docker to point to swarm-master"
eval $(docker-machine env --swarm swarm-master)

echogreen "Showing some info to verify setup"
docker info
docker ps -a
