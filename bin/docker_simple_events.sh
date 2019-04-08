#!/bin/bash
docker events | grep -v "container top\|container exec_start\|container exec_die\|container exec_create"
