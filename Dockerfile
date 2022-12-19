FROM tomcat:alpine
LABEL maintainer=”msrikanth@gmail.com”
COPY ./sample.war /usr/local/tomcat/webapps
COPY ./newpage.war /usr/local/tomcat/webapps

