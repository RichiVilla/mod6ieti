# Usa Maven con OpenJDK 17 basado en Eclipse Temurin
FROM maven:3.8.6-eclipse-temurin-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de tu proyecto al directorio de trabajo
COPY . .

# Construye tu aplicación con Gradle
RUN gradle build --no-daemon

# Cambia a una imagen más ligera de OpenJDK 17 para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR de tu aplicación al directorio de trabajo
COPY --from=build /app/build/libs/<nombre_jar_generado>.jar .
COPY --from=build /app/src/main/resources/application.properties .

# Exponer el puerto que utilizará la aplicación
EXPOSE 8080

# Define el comando de inicio de la aplicación
CMD ["java", "-jar", "IETI_Raylway-1.0-SNAPSHOT.jar"]
