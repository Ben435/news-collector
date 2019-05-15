FROM openjdk:11.0.3-jdk-stretch

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Add the built war to the container
ADD build/libs/news-*.war news.war

# Run the war file
ENTRYPOINT ["java","-jar","./news-0.0.1-SNAPSHOT.war"]
