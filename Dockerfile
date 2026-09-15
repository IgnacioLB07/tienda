# Etapa 1: Compilación
FROM maven:3.8.5-openjdk-17 as build
workdir /app
copy . .
run mvn -f pom.xml clean package -DskipTests

# Etapa 2: Creación de la imagen final
from openjdk:17.0.1-jdk-slim
workdir /app
copy --from=build /app/target/*.jar ./app.jar
expose 80
entrypoint ["java","-jar","app.jar"]



# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

FROM alpine:latest

CMD ["/bin/sh"]
