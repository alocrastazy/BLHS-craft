FROM openjdk:8-jre
WORKDIR /app
COPY . .
RUN chmod +x main.sh
CMD ["bash", "main.sh"]