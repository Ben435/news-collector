FROM openjdk:11.0.3-jdk-stretch

# Add the built war to the container
ADD build/libs/news-*.war news.war

# Run the war file
ENTRYPOINT ["java","-jar","./news.war"]
