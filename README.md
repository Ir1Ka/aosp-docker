# aosp-docker
AOSP build docker image.

## Usage
If you create a image named test/test:last, and your code is in the /code directory,
you can use this command to run the image with access your local code.

    docker run --rm -it -v /code:/data test/test:last

You should assign GIT\_NAME and GIT\_EMAIL environment variable.
They will be used to set git user and email.
Otherwise, if you need to use related git functions in the container,
you need to configure them manually.

If your name is *testuser* and your email is *testuser@email.com*,
you can use this command to run image with access your local code
and configure git automatically.

    docker run --rm -it -v /code:/data -e GIT_NAME=testuser -e GIT_EMAIL=testuser@email.com test/test:last
