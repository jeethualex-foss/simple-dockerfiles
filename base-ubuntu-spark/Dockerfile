FROM ubuntu:latest

RUN apt-get -y update && apt -y upgrade

RUN apt-get install default-jdk -y

COPY . /deployments
#COPY ./spark-master.service /etc/systemd/system/spark-master.service
#COPY ./spark-slave.service.service /etc/systemd/system/spark-slave.service.service

WORKDIR /deployments

#RUN curl https://downloads.apache.org/spark/spark-4.1.0/spark-4.1.0-bin-hadoop3.tgz  -O spark-4.1.0-bin-hadoop3.tgz

RUN tar -xvf spark-4.1.0-bin-hadoop3.tgz

RUN ln -s /deployments/spark-4.1.0-bin-hadoop3 /opt/spark

RUN useradd spark

RUN mkdir /opt/spark/logs

#RUN chown -R spark:spark /opt/spark*

RUN chmod -Rf 777 /opt/spark

USER spark

ENV SPARK_MASTER_HOST=0.0.0.0
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8081
ENV SPARK_NO_DAEMONIZE=true

EXPOSE 7077
EXPOSE 8081

WORKDIR /opt/spark

CMD ["./sbin/start-master.sh"]