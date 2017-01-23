#!/bin/bash
set -e

if [ "$1" = 'analyze' ]; then
	tail -f /dev/null
fi

exec "$@"