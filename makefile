build-local:
	DOCKER_BUILDKIT=1 docker build -t ocl_local_django -f Docker/local/django/Dockerfile .

local:
	docker run -t -i -p 8000:8000 ocl_local_django

hub:
	docker pull jeremybochard/ocl
	docker run env-file .env -t -i -p 8000:8000 jeremybochard/ocl 

test:
	docker run -t -i -p 8000:8000 ocl_local_django pytest
