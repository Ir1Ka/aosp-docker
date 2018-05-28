#!/usr/bin/env bash
set -e
program=$(realpath $0)
DIR=$(dirname $program)
# usage
usage="$program -t <image_name> -f <Dockerfile_base> [-h]"

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

cp $Dockerfile_base Dockerfile

# build docker image
docker build -t $image_name .
