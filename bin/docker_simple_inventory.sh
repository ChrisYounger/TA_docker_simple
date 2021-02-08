#!/bin/bash
# docker inspect $(docker ps -aq) | jq -c -M -r ".[]"
docker inspect $(docker ps -aq) | jq -c -M -r '.[] |delpaths([paths | select(.[-1] | strings | startswith("Env"))])'