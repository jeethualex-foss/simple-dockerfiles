user := simple-dockerfiles

.BASE: default
default:
	@echo 'Hello $(user)'

.BASE: build_base_ubuntu_spark
build_base_ubuntu_spark:
	docker build -t "spark-master:Dockerfile" base-ubuntu-spark

.BASE: deploy_base_ubuntu_spark
deploy_base_ubuntu_spark:
	docker run --name spark-master -p 7077:7077 -p 8081:8081 -it spark-master:Dockerfile

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

.BASE: clean
clean:
	docker system prune -f
	docker volume prune -f
	docker image prune -f
	docker network prune -f
	docker builder prune -f
	docker container prune -f
	docker system prune --volumes -f
