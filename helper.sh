#!/bin/bash
usage="$(basename "$0")
options:
      docker:build             build docker image
      docker:up                bring up containers
      docker:down              bring down containers
      docker:run               run command on container
      symfony:console          run command in symfony console on container
      symfony:migrate          run symfony migration on container
      symfony:fixtures         run symfony fixtures on container
      composer:install         install composer packages on container
      help                     shows this"

function docker_command() {
    docker exec -it default-php $@
}

function console_command() {
    docker_command bin/console "$@"
}

while [ $# -gt 0 ]; do
  key="$1"

  case $key in
    docker:build)
      docker-compose build
      shift # past argument
      shift # past value
      ;;
    docker:up)
      docker-compose up -d
      shift # past argument
      shift # past value
      ;;
    docker:down)
     docker-compose down
      shift # past argument
      shift # past value
      ;;
    docker:run)
      shift # past argument
      docker_command "$@"
      shift # past value
      ;;
    symfony:console)
      shift # past argument
      console_command "$@"
      shift # past value
      ;;
    symfony:migrate)
    console_command "$@" doctrine:migrations:migrate --no-interaction --allow-no-migration
      shift # past argument
      shift # past value
      ;;
    symfony:fixtures)
      console_command "$@" doctrine:fixtures:load -n
      shift # past argument
      shift # past value
      ;;
    composer:install)
      shift # past argument
      docker_command "composer install $@"
      shift # past value
      ;;
    help)
      echo "$usage"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      echo "Unknown option"
      shift # past argument
      ;;
  esac
done

if [ -z "$key" ]; then
    echo "$usage"
fi

