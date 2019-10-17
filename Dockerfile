FROM ruby:2.4-alpine

MAINTAINER Steve Jernigan <sjernigan@reverbnation.com>

RUN apk update && apk upgrade
RUN apk add curl wget bash ruby ruby-bundler nodejs tzdata git

RUN echo "gem: --no-document" > /etc/gemrc

ARG native_code_gems="bundler http smashing json sanitize unf_ext"

RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev libxml2-dev libxslt-dev && \
    gem install $native_code_gems && \
    apk del build_deps

ENV PORT 3030
EXPOSE $PORT

ARG smahing_repo_path=/etc/git_repo/smashing
WORKDIR $smahing_repo_path
CMD ["./run.sh"]
