#!/usr/bin/env bash
set -e
# ccache
export CCACHE_DIR=/tmp/ccache
export USE_CCACHE=1
if [ ! -z "$GIT_NAME" ] && [ ! -z "$GIT_EMAIL" ]; then
    git config --global user.name $GIT_NAME
    git config --global user.email $GIT_EMAIL
else
    echo "GIT_NAME or GIT_EMAIL do not set."
fi

exec "$@"
