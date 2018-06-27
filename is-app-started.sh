#!/bin/sh
APP_NAME=$1
shift

echo "Checking if application $APP_NAME reports status STARTED..."

APP_INFO=$(/node_modules/.bin/anypoint-cli $@ runtime-mgr cloudhub-application describe-json $APP_NAME)
APP_STATUS=$(echo $APP_INFO | jq '.status')

echo "($ANYPOINT_ENV): Application $APP_NAME is $APP_STATUS"

echo $APP_INFO | jq -e '(.status == "STARTED")'