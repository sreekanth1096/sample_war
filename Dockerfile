FROM tomcat:alpine
LABEL maintainer=”msrikanth@gmail.com”
COPY ./webapp.war /usr/local/tomcat/webapps

