user := simple-dockerfiles

.BASE: default
default:
	@echo 'Hello $(user)'

.BASE: build_base_ubuntu_spark
build_base_ubuntu_spark:
	docker build -t "spark-master:Dockerfile" spark-master

.BASE: deploy_base_ubuntu_spark
deploy_base_ubuntu_spark:
	docker run --name spark-master -p 7077:7077 -p 8081:8081 -it spark-master:Dockerfile

.BASE: clean
clean:
	docker system prune -f
	docker volume prune -f
	docker image prune -f
	docker network prune -f
	docker builder prune -f
	docker container prune -f
	docker system prune --volumes -f
