FROM node:10-alpine

# ENV ADDICT_VERSION 1.1.1

RUN apk add --no-cache python python-dev python3 python3-dev \
    linux-headers build-base bash git ca-certificates && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

EXPOSE 3000

WORKDIR /app
COPY . .

# RUN npm install "addict@$ADDICT_VERSION" \
#         && npm cache clear --force
RUN npm install

ENTRYPOINT [ "node", "./bin/index.js" ]