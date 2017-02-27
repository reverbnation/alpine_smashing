FROM ruby:alpine
#FROM alpine:latest

MAINTAINER Steve Jernigan <sjernigan@reverbnation.com>

RUN apk update && apk upgrade
RUN apk add curl wget bash
RUN apk add ruby ruby-bundler nodejs

RUN echo "gem: --no-document" > /etc/gemrc

ARG native_code_gems="bundler http eventmachine json smashing sanitize"

# Needed for make native extensions
#RUN apk add ruby-dev g++ musl-dev make
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
    gem install $native_code_gems && \
    apk del  build_deps

ENV PORT 3030
EXPOSE $PORT

ARG smahing_repo_path=/etc/git_repo/smashing
WORKDIR $smahing_repo_path
CMD ["./run.sh"]
