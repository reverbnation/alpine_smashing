
.PHONY:	all build push

PREFIX=quay.io/reverbnation
PROJECT=$(shell basename $(CURDIR) | sed s/_/-/)
TAG=$(shell git rev-parse --short HEAD)

all: build push

build:
	docker build --pull -t $(PREFIX)/$(PROJECT):$(TAG) .

push:
	docker push $(PREFIX)/$(PROJECT):$(TAG)
