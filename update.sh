#!/bin/bash

git pull
docker-compose down
docker-compose up --build -d
