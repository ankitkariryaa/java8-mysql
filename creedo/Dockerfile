FROM mysql:5.6

#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

# A few problems with compiling Java from source:
#  1. Oracle.  Licensing prevents us from redistributing the official JDK.
#  2. Compiling OpenJDK also requires the JDK to be installed, and it gets
#       really hairy.

RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
                vim \
                less   

RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV JAVA_VERSION 8u91
ENV JAVA_DEBIAN_VERSION 8u91-b14-1~bpo8+1

# see https://bugs.debian.org/775775
# and https://github.com/docker-library/java/issues/19#issuecomment-70546872
ENV CA_CERTIFICATES_JAVA_VERSION 20140324

RUN set -x \
	&& apt-get update \
	&& apt-get install -y \
		openjdk-8-jdk="$JAVA_DEBIAN_VERSION" \
		ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" \
	&& rm -rf /var/lib/apt/lists/* \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

# see CA_CERTIFICATES_JAVA_VERSION notes above
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

# If you're reading this and have any feedback on how this image could be
#   improved, please open an issue or a pull request so we can discuss it!
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

#RUN mkdir -p /Creedo/ && cd /Creedo/ && wget https://bitbucket.org/realKD/creedo/downloads/Creedo-0.3.1-executable.zip && unzip Creedo* && mv Creedo-0.3.1-executable Creedo && cd Creedo && wget https://bitbucket.org/realKD/creedo/downloads/Creedo-0.4.0-SNAPSHOT-war-exec.jar && mkdir workspaces
ADD Creedo-0.4-SNAPSHOT-executable /Creedo/executable
ADD readinbox.sh /Creedo/readinbox.sh 
RUN mkdir /Creedo/inbox && chmod +x /Creedo/readinbox.sh
CMD ["mysqld"]
