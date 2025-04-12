FROM openjdk:11-jre-slim
WORKDIR /opt/traccar
COPY . /opt/traccar
RUN wget https://github.com/traccar/traccar/releases/download/v5.0/traccar-linux-5.0.tar.gz
RUN tar -xvzf traccar-linux-5.0.tar.gz
EXPOSE 5055
CMD ["./traccar", "start"]
