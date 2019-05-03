#!/bin/bash
while getopts ":hi" opt; do
  case ${opt} in
    h )
      echo "Usage:"
      echo "-h          Display this message"
      echo "-i          Initialize new database"
      exit 0
      ;;
    i )
      docker volume rm mongodata
      ;;
  esac
done

# Create mongodata volume.  Will do nothing if volume exists
docker volume create mongodata

# start application stack
docker-compose -c .\docker-compose.yml acme
