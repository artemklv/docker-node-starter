FROM node:16-alpine

RUN echo "fs.inotify.max_user_instances=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
RUN echo "fs.inotify.max_queued_events=524288" >> /etc/sysctl.conf

ARG USER_ID
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

# RUN apk add imagemagick  graphicsmagick

### mac os fix: change user group used in mac os
RUN apk --no-cache add shadow
RUN groupmod -g 2020 dialout

RUN deluser node
RUN addgroup -g $GROUP_ID $GROUP_NAME  \
  && adduser -u $USER_ID -G $GROUP_NAME -h /home/project --disabled-password $USER_NAME

ENV NPM_CONFIG_PREFIX=/home/project/.npm-global
ENV PATH=$PATH:/home/project/.npm-global/bin
ENV YARN_CACHE_FOLDER=/home/project/.cache-yarn

USER $USER_NAME

WORKDIR /home/project/frontend

RUN npm i -g yarn 

COPY . .
