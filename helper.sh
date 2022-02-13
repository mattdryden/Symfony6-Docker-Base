#!/bin/bash
source .env
params="$@"
usage="$(basename "$0")
options:
      setup                    initial setup
      name                     replaces name of project from default to whatever you want
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
    docker exec -it ${containerName:-default}-php $2
}

function console_command() {
    docker_command "" "bin/console $2"
}

while [ $# -gt 0 ]; do
  key="$1"

  case $key in
    setup)
      ./$0 name $2
      ./$0 docker:build
      ./$0 docker:up
      ./$0 composer:install
      shift # past argument
      shift # past value
      ;;
    name)
      sed -i "s/@*-mysql:3306/@$2-mysql:3306/g" src/.env
      sed -i "s/containerName=.*/containerName=$2/" .env
      shift # past argument
      shift # past value
      ;;
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
      docker_command $params
      shift # past value
      ;;
    symfony:console)
      shift # past argument
      console_command $params
      shift # past value
      ;;
    symfony:migrate)
    console_command "" "doctrine:migrations:migrate --no-interaction --allow-no-migration"
      shift # past argument
      shift # past value
      ;;
    symfony:fixtures)
      console_command "" "doctrine:fixtures:load -n"
      shift # past argument
      shift # past value
      ;;
    composer:install)
      shift # past argument
      docker_command "" "composer install"
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

