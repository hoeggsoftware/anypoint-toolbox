#!/bin/sh
APP_NAME=$1
FILE=$2
shift 2

APP_TABLE=$( /node_modules/.bin/anypoint-cli runtime-mgr cloudhub-application list -f Application -o text)

APP_LIST=$( echo "$APP_TABLE" | sed "1d" )
APP_NAMES=$( echo "$APP_LIST" | cut -d' ' -f1 )
if $(echo "$APP_NAMES" | cut -d' ' -f1 | grep -qw $APP_NAME)
then
    echo "Redeploying $APP_NAME: $FILE"
    COMMAND=modify
else
    echo "Deploying $APP_NAME: $FILE"
    COMMAND=deploy
fi

/node_modules/.bin/anypoint-cli runtime-mgr cloudhub-application $COMMAND $APP_NAME $FILE $@