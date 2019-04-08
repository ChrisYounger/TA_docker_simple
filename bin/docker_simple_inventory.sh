#!/bin/bash
docker inspect $(docker ps -aq) | jq -c -M -r ".[]"
