# alpine_jenkins

##### Info
This builds Jenkins on an alpine based image.
It downloads Jenkins (and docker) on runtime (to keep image size to a minimum).  
This also allows for more custom options to be set.

To controll jenkins and docker versions use environment variables **JENKINS_VERSION**(=1.642.2) and **DOCKER_VERSION**(=1.11.0).  
**JENKINS_VERSION** only works with LTS version of jenkins.  
If you want to download weekly build or for instance 2.0 version, you can disrecard **JENKINS_VERSION** variable and use **JENKINS_ALT_VERSION** to set different download url (fex: http://mirrors.jenkins-ci.org/war-rc/2.0/jenkins.war)

There is no DinD (Docker in Docker) in this image. To build docker images you need to mount local docker.sock to container (-v /var/run/docker.sock:/var/run/docker.sock). To stop from downloading docker all together set **DOCKER_DOWNLOAD**(=true) to false.

Jenkins starts by the user "abc". The ID and GID can be controlled by enviroment variable **PUID** and **PGID**. In addition you can set **PAGID** to prepend additionaly 1 group to the user (example 999 Docker group for docker.sock). The home directory is by default /home/abc. This can be changed with **PHOME** enviroment variable.

To change Java options on jenkins start use enviroment variable **JAVA_OPTS**.  
To change Jenkins options on start use enviroment variable **JENKINS_OPTS**.

**JENKINS_HOME** is defailt /opt/jenkins_home. this enviroment variable can be changed.

##### All Enviroment variables and its defaults:
| Variable | Default | Desc. |
|:---------|:--------|:------|
| JENKINS_VERSION | 1.642.4 | Sets what stable version to download |
| JENKINS_ALT_VERSION | 0 | To manually set download url |
| JENKINS_OPTS | "--httpListenAddress=0.0.0.0 --httpPort=8080 -Djava.awt.headless=true" | Startup options for jenkins |
| JENKINS_HOME | "/opt/jenkins_home" | Home directory for jenkins |
| JENKINS_WEB | "/usr/share/jenkins" | Destination to download war file to |
| JAVA_OPTS | "" | Startup options to Java when Jenkins runs |
| DOCKER_VERSION | "1.11.0" | Version of Docker to download |
| DOCKER_DOWNLOAD | "true" | whether or not do download Docker (to decrease startup time) |
| DOCKER_HOST | "unix:///var/run/docker.sock" | Docker host variable to change where docker client will connect. See docker doc for more info. |
| PUID | "1000" | To change UID of user to launch Jenkins |
| PGID | "1000" | To change GID of user to launch Jenkins |
| PAGID | "" | To append additional group (like docker group) to user to launch Jenkins |
| PHOME | "/home/abc" | To change home dir of user to launch Jenkins |


##### Example:  
```bash
docker run -d \
-e PUID=1001 \
-e PGID=1001 \
-e PAGID=999 \
-e PHOME=/opt/jenkins_home \
-e JENKINS_VERSION=1.642.4 \
-e DOCKER_VERSION=1.10.3 \
-e "JAVA_OPTS=-Xmx2048m -Duser.timezone=Europe/Oslo" \
-e "JENKINS_OPTS=--spdy --httpListenAddress=0.0.0.0 --httpPort=8080 -Djava.awt.headless=true" \
-v /some/dir/to/jenkins_conf:/opt/jenkins_home:rw \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
bateau/alpine_jenkins:latest
```
