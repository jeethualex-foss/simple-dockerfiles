user := simple-dockerfiles

.BASE: default
default:
	@echo 'Hello $(user)'

.BASE: build_spark_master
build_spark_master:
	docker build -t "spark-master:Dockerfile" spark-master

.BASE: deploy_spark_master
deploy_spark_master:
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
