# Choose official python image
FROM python:3.9

# setup env vars
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1
ENV PORT 8000

# Set working directory
WORKDIR /ocl

# Copy the app in WORKDIR
COPY . /ocl/

# Install requirements
RUN pip install -r requirements.txt

# Allow port
EXPOSE 8000

# Run server localy
CMD python3  manage.py runserver 0.0.0.0:8000
