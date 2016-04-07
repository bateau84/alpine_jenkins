# alpine_jenkins

This builds Jenkins on an alpine based image.
It downloads Jenkins (and docker) on runtime (to keep image size to a minimum).

To controll jenkins and docker version use environment variables JENKINS_VERSION(=1.642.2) and DOCKER_VERSION(=1.10.2).
There is no DinD (Docker in Docker) in this image. To build docker images you need to mount local docker.sock to container (-v /var/run/docker.sock:/var/run/docker.sock).

Jenkins starts by the user "abc". The ID and GID can be controlled by enviroment variable PUID and PGID. In addition you can set PAGID to prepend additionaly 1 group to the user (example 999 Docker group for docker.sock). The home directory is by default /home/abc. This can be changed with PHOME enviroment variable.

To change Java options on jenkins start use enviroment variable JAVA_OPTS.
To change Jenkins options on start use enviroment variable JENKINS_OPTS.

JENKINS_HOME is defailt /opt/jenkins_home. this enviroment variable can be changed.
