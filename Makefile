APP=payment
THIS_DIR:=`pwd`
# not using compose
all:
	make build
	make run
build:
	docker build --no-cache -t ${APP}:latest -f ./.docker/Dockerfile .
run:
	docker rm -f ${APP}
	docker run --name ${APP} -v ${THIS_DIR}/src:/usr/src/app -d -p 80:3000 ${APP} "rails server -b 0.0.0.0"
down:
	docker down ${APP}
start:
	docker start ${APP}
restart:
	docker restart ${APP}
stop:
	docker stop ${APP}
exec:
	docker exec -it ${APP} /bin/bash
ps:
	docker ps -a | grep ${APP}

# using compose
cbuild:
	cd .docker && docker compose build --no-cache
cup:
	cd .docker && docker compose up -d
cstart:
	cd .docker && docker compose start
cstop:
	cd .docker && docker compose stop
crestart:
	cd .docker && docker compose restart
cdown:
	cd .docker && docker compose down
cps:
	cd .docker && docker compose ps
