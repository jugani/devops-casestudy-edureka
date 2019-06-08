FROM tomcat
ADD addressbook.war /usr/local/tomcat/webapps
CMD "catalina.sh" "run"
