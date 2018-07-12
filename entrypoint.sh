#!/usr/bin/env bash
set -e
# ccache
export CCACHE_DIR=/data/.ccache
export USE_CCACHE=1

# Exec the init script if it exist.
if [ -x "/data/$INIT_SCRIPT" ]; then
    /data/$INIT_SCRIPT
fi

exec "$@"
