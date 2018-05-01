#!/usr/bin/env bash
set -e
program=$(realpath $0)
DIR=$(dirname $program)
# usage
usage="$program -t <image_name> -f <Dockerfile_base> [-h]"
BUILD_DIR=/tmp/docker/build
mkdir -p $BUILD_DIR

while getopts "t:f:h" arg
do
    case "$arg" in
        t) # image name
            image_name=$OPTARG
            ;;
        f) # Dockerfile base
            Dockerfile_base=$OPTARG
            ;;
        h) # help
            echo $usage
            exit 0
            ;;
        *) # err
            echo "unknow options"
            echo $usage
            exit 1
            ;;
    esac
done

if [ -z "$image_name" ] || [ -z "$Dockerfile_base" ]; then
    echo "Arguments are incomplete"
    echo $usage
    exit 1
fi

# replace the git name and email.
cp $Dockerfile_base $BUILD_DIR/Dockerfile
cp $DIR/entrypoint.sh $BUILD_DIR/ && chmod +x $BUILD_DIR/entrypoint.sh

# build docker image
echo "Build image in $BUILD_DIR"
docker build -t $image_name $BUILD_DIR
rm -rf $BUILD_DIR/*
