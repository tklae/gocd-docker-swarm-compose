Example for setting up go.cd using docker swarm and compose.

#Versioning

* Only tested on OSX 10.10 using
    * Docker version 1.8.1
    * docker-machine version 0.4.1
    * docker-compose version: 1.4.0
* We're using the setup for local development using docker machine as this is intended to be a proof of concept (at least for me) first

#Goal

**As a** development team that needs a build pipeline  
**I want** to setup an internal go.cd server with multiple agents across multiple VMs as easily as possible  
**so that** I can start development using continuous integration immediately.


#Usage

* Setup up a local swarm: ./swarmSetup.sh (./swarmDestroy.sh will remove all VMs created via this script)
