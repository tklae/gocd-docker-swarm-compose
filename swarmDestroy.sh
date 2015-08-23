#!/bin/bash

source "$(dirname $0)/colorfulOutput.sh"

echogreen "Removing all VMs created via ./swarmSetup.sh"
docker-machine rm swarm-agent-00
docker-machine rm swarm-agent-01
docker-machine rm swarm-master
docker-machine rm swarmSetupBaseBox

echored 'You should point docker back to a valid machine name, for example using: eval "$(docker-machine env default)"'