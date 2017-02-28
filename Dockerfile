FROM centos:7

ENV JAVA_VERSION 8u112
ENV JAVA_BUILD_VERSION b15

RUN yum update -y && \
	yum install -y wget curl tar unzip git && \
	wget --no-cookies --no-check-certificate \
	  --header "cookie: gpw_e24=http%3a%2f%2fwww.oracle.com%2f; oraclelicense=accept-securebackup-cookie" \
	     "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" && \
	     yum localinstall -y /jdk-${JAVA_VERSION}-linux-x64.rpm && \
    rm -f /jdk-${JAVA_VERSION}-linux-x64.rpm && \
	yum clean all

ENV JAVA_HOME /usr/java/latest

WORKDIR /

CMD ["bash"]
