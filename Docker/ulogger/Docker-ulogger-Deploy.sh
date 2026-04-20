#!/bin/bash

# Create a directory for ulogger data
mkdir -p /home/<user>/ulogger-data/

# Run the ulogger container 
docker run --name ulogger -p 8080:80 -v /home/<user>/ulogger-data/:/data -d bfabiszewski/ulogger
