# crocoddyl-docker

Docker Container for running Crocoddyl Optimal Control Library.

## Building the Docker Image

Go to the repository directory i.e *crocoddyl-docker*. This directory contains the **Dockerfile**

From this directory, run the following command:

```
docker build -t crocodocker:latest .
```

*Important: Run the docker build command from the directory that contains the Dockerfile!!* 

Then run the docker container as you normally would.

## Running the Docker Container using the Docker Image

To make the running of the container easier, a *runDockerWithGUI.sh* bash script is included that contains the `docker run` commnad with all the arguments required for running the GUI on linux. For Windows/macOS, this script will probably not work.

```
sh runDockerWithGUI.sh
```

This script will open an interactive terminal interface to the crocoddyl docker container.

## To check if everything worked correctly:

- No errors during `docker build` command.
- Run `gepetto-gui` command in the container terminal and see if the gui opens.

