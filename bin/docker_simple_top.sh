#!/bin/bash
command_date=$(date +%s)
for container_id in $(docker ps -q); do
  docker top $container_id | tail -n +2 | sed -E "s/^(.*)$/$command_date\t$container_id\t\1/"
done
