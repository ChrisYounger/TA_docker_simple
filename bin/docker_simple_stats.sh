#!/bin/bash
command_date=$(date +%s)
docker stats --no-stream=true --format "$command_date\t{{.ID}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}"
