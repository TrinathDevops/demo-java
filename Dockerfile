FROM tomcat:8
MAINTAINER kishan <kishanbommi@gmail.com>

# Debugging tools: A few ways to handle debugging tools.
# Trade off is a slightly more complex volume mount vs keeping the image size down.
#RUN apt-get update && \
#  apt-get install -y \
#    net-tools \
#    tree \
#    vim && \
#  rm -rf /var/lib/apt/lists/* && apt-get clean && apt-get purge
COPY /var/lib/jenkins/workspace/dockerapp/target/demo.war /usr/local/tomcat/webapps
RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh
EXPOSE 8080
CMD ["catalina.sh", "run"]
