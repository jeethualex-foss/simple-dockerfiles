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

RUN chmod -Rf 777 /deployments

USER spark

ENV SPARK_MASTER_URL=spark://TL5:7077
ENV SPARK_NO_DAEMONIZE=true

WORKDIR /opt/spark

CMD ["./sbin/start-worker.sh","spark://TL5:7077"]