# pull official base image
FROM python:3.8.5-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

# install psycopg2 dependencies
RUN apt-get update \
  && apt-get -y install gcc postgresql \
  && apt-get clean


# copy project
COPY . .
RUN pip install -r requirements.txt
RUN ls

# collect static files
RUN python manage.py collectstatic --no-input