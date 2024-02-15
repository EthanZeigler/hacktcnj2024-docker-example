# HACKTCNJ 2024 Docker Example Project

## Downloading this code
On your computer, cd to wherever you want to store this demo. run `git clone https://github.com/EthanZeigler/hacktcnj2024-docker-example` there. The code should download.

## Docker Setup
Ensure you have docker installed in one way or another. This can either be the
[desktop version](https://www.docker.com/products/docker-desktop/) or
command-line version, but I'd recommend desktop for anyone inexperienced with it.

Once that's done and you've started docker, cd into the directory containing `pyproject.toml`. Run `docker build . -f python-django/docker/Dockerfile -t hacktcnj2024`. This creates a docker image, or a snapshot of your project named `hacktcnj2024`. Images are just a template. They themselves cannot run code.

To make a runnable system based on the image, we need a container. Unlike images, containers can be executed. To do so, run `docker run --rm -it hacktcnj2024`. `-it` means we want an interactive terminal session to this container. `hacktcnj2024` is the image we want to make a container from. `--rm` causes the container to automatically self-destruct when stopped. Remove this if that's not what you want, however keep in mind that containers are not supposed to save files or changes within themselves. They're intended to be disposable.

## Running Django locally (outside docker)
While you can develop from within a docker container, that goes beyond the scope
of this talk. If you want to run this code outside docker, you'll need to
install both python >=3.10 and the poetry package manager.

**Windows users**, you'll want to install python from the windows store. Microsoft
has done a great job making that package work with very few issues. After that,
install poetry via running `python3 -m pip install poetry`.

**MacOS users**: You can install a up-to-date version of python through homebrew.
Then install poetry by running `python3 -m pip install poetry`. Do note that MacOS
has a built-in version of python already installed, so your python command
may not be `python3`. Ask for help if you need it.

**Linux users**: You'll know.


Once you've finished this, run `poetry install` in the same directory as
the `pyproject.toml` file. Poetry handles _everything_. It will create the venv,
install the correct package versions into that venv, and ensure that anything
else needed is handled.

Next, run `poetry shell` to make your shell recognize `python` as the correct python
installation with all the project dependencies loaded.


