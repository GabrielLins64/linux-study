<h1>Linux Study</h1>

Repository for the study of Linux. This Markdown contains theory, practices and references.

---

<h2>Index</h2>

- [Theory](#theory)
  - [What is Linux](#what-is-linux)
    - [Popular distributions (distros)](#popular-distributions-distros)
  - [What is Unix](#what-is-unix)
  - [What is an Operating System](#what-is-an-operating-system)
  - [What is a Kernel](#what-is-a-kernel)
  - [Who is Linus Torvalds](#who-is-linus-torvalds)
  - [The GNU Project](#the-gnu-project)
- [Practice](#practice)
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

# Theory

## What is Linux

Linux is a family of open-source [unix](#what-is-unix)-like [operating systems](#what-is-an-operating-system) based on the Linux [kernel](#what-is-a-kernel), developed by Linus Torvalds. [Linux distributions](#popular-distributions-distros) includes the Linux kernel and supporting system software and libraries, many of which are provided by the [GNU Project](#the-gnu-project).

### Popular distributions (distros)

<a href="https://ubuntu.com/">
<img src="https://img.shields.io/badge/ubuntu-%23cf4f00.svg?style=for-the-badge&logo=ubuntu&logoColor=white" style="border-radius: 5px"/>
</a><br>

<a href="https://www.debian.org/index.pt.html">
<img src="https://img.shields.io/badge/debian-%23ffffff.svg?style=for-the-badge&logo=debian&logoColor=a10083" style="border-radius: 5px"/>
</a><br>

<a href="https://archlinux.org/">
<img src="https://img.shields.io/badge/arch-%23333.svg?style=for-the-badge&logo=archlinux&logoColor=08c" style="border-radius: 5px"/>
</a><br>

<a href="https://www.kali.org/">
<img src="https://img.shields.io/badge/kali-%231b51ad.svg?style=for-the-badge&logo=kalilinux&logoColor=fff" style="border-radius: 5px"/>
</a><br>

<a href="https://www.linuxmint.com/">
<img src="https://img.shields.io/badge/mint-%2348ae55.svg?style=for-the-badge&logo=linuxmint&logoColor=fff" style="border-radius: 5px"/>
</a><br>

---

## What is Unix

Unix is a family of multitasking, multiuser computer [operating systems](#what-is-an-operating-system) that derive from the original AT&T Unix, whose development started at the Bell Labs research center by Ken Thompson, Dennis Ritchie, and others.

---

## What is an Operating System

An operating system (OS) is system software that manages computer hardware, software resources, and provides common services for computer programs. For hardware functions such as input and output and memory allocation, the operating system acts as an intermediary between programs and the computer hardware, although the application code is usually executed directly by the hardware and frequently makes system calls to an OS function or is interrupted by it.

---

## What is a Kernel

The kernel is a computer program at the core of a computer's operating system and has complete control over everything in the system. It is the "portion of the operating system code that is always resident in memory", and facilitates interactions between hardware and software components. A full kernel controls all hardware resources (e.g. I/O, memory, Cryptography) via device drivers, arbitrates conflicts between processes concerning such resources, and optimizes the utilization of common resources e.g. CPU & cache usage, file systems, and network sockets. On most systems, the kernel is one of the first programs loaded on startup (after the bootloader). It handles the rest of startup as well as memory, peripherals, and input/output (I/O) requests from software, translating them into data-processing instructions for the central processing unit.

---

## Who is Linus Torvalds

<img align="right" src="assets/torvalds.jpeg" width="300" height="350" style="margin: 0 10px">

<p style="text-align: justify;">
Linus Benedict Torvalds is a Finnish-American software engineer who is the creator and, historically, the main developer of the Linux kernel, used by Linux distributions and other operating systems such as Android. He also created the distributed version control system Git and the scuba dive logging and planning software Subsurface.
</p>

<span style="clear: both; display: block"></span>

---

## The GNU Project

<img align="right" src="assets/gnu-mascot.png" width="300" height="350" style="margin: 0 10px">

<p style="text-align: justify;">
The GNU Project is a free software, mass collaboration project that Richard Stallman announced on September 27, 1983. Its goal is to give computer users freedom and control in their use of their computers and computing devices by collaboratively developing and publishing software that gives everyone the rights to freely run the software, copy and distribute it, study it, and modify it. GNU software grants these rights in its license.
</p>

<span style="clear: both; display: block"></span>

---

# Practice

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

[4] [Wikipedia](https://en.wikipedia.org/)
