# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Python and Django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies including MySQL client library
RUN apt-get update && \
    apt-get install -y mariadb-client

# Set MySQL client configurations
ENV MYSQLCLIENT_CFLAGS="-I/usr/include/mysql"
ENV MYSQLCLIENT_LDFLAGS="-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

# Set the working directory in the container
WORKDIR /app

# Copy your Django project files into the container
COPY . /app/

# Install the project's dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose the port on which your Django application will run
EXPOSE 8000

# Specify the command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
