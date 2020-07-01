create-image:
	# command: make create-image version="1.0.0"
	@[ "${version}" ] || ( echo ">> var version is not set"; exit 1 )
	docker build -t brunoferreiras/maratona-full-cycle:${version} .
	docker push brunoferreiras/maratona-full-cycle:${version}

up:
	docker-compose up -d

stop:
	docker-compose stop
	
down:
	docker-compose down