FROM brennovich/protobuf-tools

RUN apk add --update \
    nodejs \
    nodejs-npm \
    inotify-tools && \
    mkdir ~/.npm && \
    mkdir -p /opt/generated && \
    npm i -g ts-protoc-gen

WORKDIR /opt/proto

COPY ./protoc-watch.sh /opt/
RUN chmod +x /opt/protoc-watch.sh

ENTRYPOINT /opt/protoc-watch.sh