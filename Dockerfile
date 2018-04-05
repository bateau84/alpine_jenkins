FROM bateau/alpine_openjdk:latest

ENV JENKINS_HOME /opt/jenkins_home
ENV JENKINS_WEB /usr/share/jenkins

ADD . /build

RUN /build/prepare.sh && \
	/build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh
