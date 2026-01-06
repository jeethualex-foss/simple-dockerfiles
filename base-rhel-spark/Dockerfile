FROM redhat/ubi9:latest

RUN yum -y update

RUN yum -y upgrade

RUN yum install java-17-openjdk -y

COPY . /deployments
#COPY ./spark-master.service /etc/systemd/system/spark-master.service
#COPY ./spark-slave.service.service /etc/systemd/system/spark-slave.service.service

WORKDIR /deployments

#RUN curl https://downloads.apache.org/spark/spark-4.1.0/spark-4.1.0-bin-hadoop3.tgz

RUN tar -xvf spark-4.1.0-bin-hadoop3.tgz

RUN ln -s /deployments/spark-4.1.0-bin-hadoop3 /opt/spark

RUN useradd spark

RUN mkdir /opt/spark/logs

#RUN chown -R spark:spark /opt/spark*

RUN chmod -Rf 777 /opt/spark

USER spark

ENV SPARK_MASTER_HOST=0.0.0.0
ENV SPARK_MASTER_PORT=7777
ENV SPARK_MASTER_WEBUI_PORT=8081
ENV SPARK_NO_DEMONIZE=true

CMD ["sh", "/opt/spark/sbin/start-master.sh"]