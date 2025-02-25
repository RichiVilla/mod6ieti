# Usa Maven con OpenJDK 17 basado en Eclipse Temurin
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Construye la aplicación con Maven (sin ejecutar tests para acelerar el build)
RUN mvn clean package -DskipTests

# Cambia a una imagen más ligera de OpenJDK 17 para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo en el nuevo contenedor
WORKDIR /app

# Copia el archivo JAR de la aplicación al contenedor
COPY --from=build /app/target/IETI_RaylwayApp-1.0-SNAPSHOT.jar app.jar
COPY --from=build /app/src/main/resources/application.properties application.properties

# Exponer el puerto que utilizará la aplicación
EXPOSE 8080

# Define el comando de inicio de la aplicación
CMD ["java", "-jar", "IETI_RaylwayApp-1.0-SNAPSHOT.jar"]
