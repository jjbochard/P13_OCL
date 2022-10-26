# Choose official python image
FROM python:3.9-slim-buster

ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /ocl

# Copy the app in WORKDIR
COPY . /ocl/

# Install requirements
RUN pip install -r requirements.txt
RUN python manage.py migrate
# Expose port 80 to be accessible
EXPOSE 8000

CMD python3 manage.py runserver 0.0.0.0:8000
