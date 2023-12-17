python3 -m venv .venv #creating virtual environment for the site


.\.venv\scripts\activate #to activate the virtual environment.  Console becomes:   (.venv) C:\repos\monarch-entry-only\.venv [main ≡ +2 ~0 -0 !]> 
deactivate #jump out of virtual environment

pip freeze #shows packages installed (respects virutal environment)
pip freeze > requirements.txt #will generate requirements.txt for our docker file

pip install django #install django
pip install python-decouple #install decouple for environment variables
pip install mysqlclient #install mysql connector for mariadb

python -m pip install --upgrade pip # upgrade pip

python manage.py runserver 127.0.0.1:8001 #to spin up the local server

python manage.py migrate  #to apply migrations for packages

python manage.py createsuperuser #to create our first super user on the local database

python manage.py makemigrations monarchsite #this creates our migrations using the models.py in our site

python manage.py sqlmigrate monarchsite 0001 #used to see the SQL of the migration

python manage.py migrate #actually applies the migrations our database

python manage.py loaddata 'monarchsite/fixtures/initial_data.json' #loads fixture data

python manage.py collectstatic --noinput #not sure this is needed yet, don't have static files

choco install docker-desktop

docker stop $(docker ps -q)
docker buildx build -t monarchsite . #builds an image into the docker desktop image registry

docker run --env-file .env -d -p 8080:8000 monarchsite:latest  #runs image in detached mode
# http://localhost:8080/
# http://localhost:8080/monarchs

#http://localhost:8001/monarchs
#http://localhost:8080/monarchs/


docker container prune -f 
docker image prune -f

