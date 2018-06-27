#!/bin/bash
set -e

case $1 in
    "" | help | exit | version | account | api-mgr | cloudhub | designcenter | exchange | runtime-mgr | use )
        set -- /node_modules/.bin/anypoint-cli "$@"
        ;;
esac

# else default to run whatever the user wanted like "bash" or "sh"
exec "$@"