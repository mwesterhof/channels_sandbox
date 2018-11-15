# not meant to be production-ready, just dockerizing this for docker-compose
FROM python:3.7.1-alpine3.8

LABEL maintainer="m.westerhof@lukkien.com"
EXPOSE 8000/tcp

RUN apk add build-base
RUN mkdir -p /opt/application/
ADD . /opt/application
RUN pip install -r /opt/application/requirements.txt
RUN /opt/application/manage.py migrate --noinput

ENTRYPOINT ["/opt/application/manage.py", "runserver", "0.0.0.0:8000"]
