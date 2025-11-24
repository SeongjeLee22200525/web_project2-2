# Tomcat 9 + Java 17 이미지 사용
FROM tomcat:9.0-jdk17-openjdk

# 기본 webapps 제거 (ROOT.war만 넣기 위해)
RUN rm -rf /usr/local/tomcat/webapps/*

# Maven에서 빌드된 WAR 파일을 Tomcat ROOT로 배포
COPY target/WebProject2-2-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
