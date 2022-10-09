build:
	docker build -t ocl_image .

django:
	docker run -p 8000:8000 ocl_image
