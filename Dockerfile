# Choose official python image
FROM python:3.9

# setup env vars
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /ocl

# Copy the app in WORKDIR
COPY . /ocl/

# Install requirements
RUN pip install -r requirements.txt

# Allow port
EXPOSE 8000
ENV PORT 8000

# Run server localy
CMD python manage.py runserver 0.0.0.0:$PORT
