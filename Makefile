user := TP4

.BASE: default
default:
	@echo 'Hello $(user)'

.BASE: build_base_rhel_spark
build_base_rhel_spark:
	docker build -t "base:Dockerfile" base-rhel-spark

.BASE: deploy_base_rhel_spark
deploy_base_rhel_spark:
	docker run --name base-rhel-spark -p 7077:7077 -p 8080:8080 -it base:Dockerfile

.BASE: build_base_rhel
build_base_rhel:
	docker build -t "base:Dockerfile" base-rhel

.BASE: deploy_base_rhel
deploy_base_rhel:
	docker run --name base-rhel -it base:Dockerfile

.BASE: build_base_ubuntu
build_base_ubuntu:
	docker build -t "base:Dockerfile" base-ubuntu

.BASE: deploy_base_ubuntu
deploy_base_ubuntu:
	docker run --name base-ubuntu -it base:Dockerfile