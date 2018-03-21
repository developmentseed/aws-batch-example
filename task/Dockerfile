FROM node:8

RUN apt-get update && \
    apt-get install -y \
        python \
        python-dev \
        python-pip \
        python-setuptools \
        groff \
        less \
    && pip install --upgrade awscli \
    && apt-get clean

WORKDIR task
ADD package.json package.json
RUN npm install
COPY task.sh .