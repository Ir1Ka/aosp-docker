# aosp-docker
AOSP build docker image.

## Usage
If you create a image named test/test:last, and your code is in the /code directory,
you can use this command to run the image to access your local code.

    docker run --rm -it -v /code:/data test/test:last
