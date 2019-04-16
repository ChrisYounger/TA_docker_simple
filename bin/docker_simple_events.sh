#!/bin/bash
docker events | grep --line-buffered -v "container top\|container exec_start\|container exec_die\|container exec_create"
