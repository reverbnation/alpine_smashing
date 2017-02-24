FROM ruby:alpine:latest
#FROM alpine:latest

MAINTAINER Steve Jernigan <sjernigan@reverbnation.com>

RUN apk update && apk upgrade
RUN apk add curl wget bash
RUN apk add ruby ruby-bundler nodejs

# Needed for make native extensions
#RUN apk add ruby-dev g++ musl-dev make
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
    sudo -iu app bundle install --path vendor/bundle && \
    apk del  build_deps

RUN echo "gem: --no-document" > /etc/gemrc
RUN gem install bundler

ARG smahing_repo_path=/etc/git_repo/smashing

WORKDIR $smahing_repo_path

ENV PORT 3030
EXPOSE $PORT

CMD ["./run.sh"]
