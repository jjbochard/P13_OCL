build:
	DOCKER_BUILDKIT=1 docker build -t ocl_local_django -f Dockerfile .

django:
	docker-compose -f docker-compose.yml up django

test:
	docker-compose -f docker-compose.yml run --rm django pytest -s
