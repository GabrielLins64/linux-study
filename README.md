<h1>Linux Study</h1>

Repository for the study of Linux Kernel. This Markdown contains theory and references. On this repository you will find out what Linux is, 

---

<h2>Index</h2>

- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
  - [Creating the docker container from scratch](#creating-the-docker-container-from-scratch)
  - [Create the Docker container from a Dockerfile](#create-the-docker-container-from-a-dockerfile)
  - [Configuring the container](#configuring-the-container)
- [Understanding permissions](#understanding-permissions)
  - [Useful tool for permission calculator](#useful-tool-for-permission-calculator)
- [Basic commands](#basic-commands)
  - [ls](#ls)
  - [whoami](#whoami)
  - [cd](#cd)
  - [mkdir](#mkdir)
  - [rm](#rm)
  - [ln](#ln)
  - [pwd](#pwd)
  - [touch](#touch)
  - [echo](#echo)
  - [tail](#tail)
  - [chmod](#chmod)
  - [groupadd](#groupadd)
- [Shell Scripting](#shell-scripting)
- [References](#references)

---

## Dependencies

- [Docker](https://docs.docker.com/engine/install/)

---

## Getting Started

### Creating the docker container from scratch

If you don't want to create the docker container from scratch see the [next topic](#create-the-docker-container-from-a-dockerfile). But if you want to create the container from scratch, continue reading.

Pull the docker image for Debian 11:

```shell
$ docker pull debian:bullseye
```

Create and run the container:

```shell
$ docker run -d -it --name linux-study-container debian:bullseye
```

Check if the container was created, and get its id:

```shell
$ docker ps
```

Copy the scripts directory to the container:

```shell
$ docker cp scripts <container_id>:/home/scripts
```

Get into the container with:

```shell
$ docker exec -it linux-study-container /bin/bash
```

From inside of the container, update and install the procps* and some basic commands

```shell
$ apt update && apt install -y procps less tree man sudo vim
```

***procps**: command-line and full-screen utilities for navigating procfs &ndash; a "pseudo"-filesystem dynamically generated by the kernel to give information about the status of entries in your process table

### Create the Docker container from a Dockerfile

Create the image from the Dockerfile:

```shell
$ docker build -t linux-study-img .
```

Check the created image:

```shell
$ docker image ls
```

Run a container from that image:

```shell
$ docker run -d -it --name linux-study-container linux-study-img
```

### Configuring the container

Get into the container with:

```shell
$ docker exec -it linux-study-container bash
```

Create an user:

```shell
$ adduser <username>
```

Add the user to the sudo group:

```shell
$ usermod -aG sudo <username>
```

Show all users:

```shell
$ less /etc/passwd
```

Change user to the created user:

```shell
$ su <username>
```

Or:

```shell
$ sudo -u <username> -s
```

*In order to get back into root user, just hit `CTRL + D` or type `$ exit`.

## Understanding permissions

### Useful tool for permission calculator

[chmod Calculator](https://chmod-calculator.com/)

---

## Basic commands

[Complete Reference](linux-commands-cheat-sheet-by-pnap.pdf)

### ls

### whoami

### cd

### mkdir

### rm

### ln

### pwd

### touch

### echo

### tail

### chmod

### groupadd

---

## Shell Scripting

---

## References

[1] [Miguel Nischor](https://github.com/mgnischor)

[2] [Debian](https://www.debian.org/)

[3] [Docker documentation](https://docs.docker.com/)

[4] []()
