#!/bin/sh

# teardown_containers
#
# clear out containers of any remnants of the application
#
# example usage: teardown_containers
teardown_containers() {
  local environment=$1

  case $environment in
    'development')
      rm -rf db.sqlite3 # clear away data by blowing away the database
      docker-compose down -v
    ;;
  esac
}

# setup_containers
#
# set up containers to run application
#
# example usage: setup_containers
setup_containers() {
  local environment=$1

  case $environment in
    'development')
      docker-compose build
      docker-compose run app //bin/sh scripts/setup_app.sh
    ;;
  esac
}
