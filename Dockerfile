From ubuntu:latest
Maintainer marketamerica shopping.portal
Run apt-get update -y && apt-get install wget default-jdk -y
Run java --version
RUN mkdir /opt/tomcat/
Run wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
Run tar -xzf apache-tomcat-9.0.55.tar.gz
Run mv apache-tomcat-9.0.55/* /opt/tomcat/.
Run rm -rf apache-tomcat-9.0.55.tar.gz
Run sed -i '56 i <role rolename="manager-gui"/> <role rolename="admin-gui"/> <user username="tomcat" password="s3cret" roles="manager-gui"/> <user username="deployer" password="s3cret" roles="manager-script,admin-gui"/>' /opt/tomcat/conf/tomcat-users.xml > sed_out
Run sed -i '21s/^/<!-- /; 22s/$/ -->/' /opt/tomcat/webapps/host-manager/META-INF/context.xml > sed_out
Run sed -i '21s/^/<!-- /; 22s/$/ -->/' /opt/tomcat/webapps/manager/META-INF/context.xml > sed_out
WORKDIR /opt/tomcat
Expose 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
