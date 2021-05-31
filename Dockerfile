FROM ubuntu:18.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip

COPY webapp/app/requirements.txt /tmp/app/
WORKDIR /tmp/app
RUN pip install -qr requirements.txt
COPY webapp/app/*.py /opt/webapp/
EXPOSE 5000

WORKDIR /opt/webapp
CMD ["python", "app.py"]