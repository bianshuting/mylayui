FROM bianshuting/ubuntu:latest

WORKDIR /usr/local
ADD . myspringboot/

EXPOSE 8084

ENTRYPOINT ["java","-jar","/usr/local/myspringboot/target/mylayui-0.0.1-SNAPSHOT.jar"]