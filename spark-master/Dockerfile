FROM redhat/ubi9:latest
RUN yum -y update && yum -y upgrade
RUN yum install java-17-openjdk -y

COPY . /deployments

WORKDIR /deployments

RUN tar -xvf spark-4.1.0-bin-hadoop3.tgz

RUN ln -s /deployments/spark-4.1.0-bin-hadoop3 /opt/spark

RUN useradd spark

RUN mkdir /opt/spark/logs

RUN chown -R spark:spark /opt/spark*

USER spark

ENV SPARK_MASTER_HOST=0.0.0.0
ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8081
ENV SPARK_NO_DAEMONIZE=true

EXPOSE 7077
EXPOSE 8081

WORKDIR /opt/spark

CMD ["./sbin/start-master.sh"]