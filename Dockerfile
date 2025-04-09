ARG PYTHON_VERSION=3.10-slim-bullseye

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app

WORKDIR /app

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/

# Setup GDAL
RUN apt-get update &&\
    apt-get install -y binutils libproj-dev gdal-bin python3-gdal
        
COPY . /app

EXPOSE 8000

CMD ["/bin/bash", "entrypoint.sh"]
