# Choose official python image
FROM python:3.9-slim-buster

# setup env vars
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /ocl

# Copy the app in WORKDIR
COPY . /ocl/

# Install requirements
RUN pip install -r requirements.txt
RUN python manage.py migrate

# Allow port
EXPOSE 8000

# Run server localy
CMD python3  manage.py runserver 0.0.0.0:8000
