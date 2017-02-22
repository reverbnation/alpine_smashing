# Smashing Alpine Container (new dashing name)
Run [Smashing](http://dashing.io/) in a minimal [Alpine](https://alpinelinux.org/about/) [Docker](http://docker.io/) container.

Using alpine image. The container size has been reduced from about 800MB to about 200MB.

This container assumes the presence of a smashing repository that was mounted in by another sidecar container like git-sync.  The default location for the repo is /etc/git_repo/smashing

## Build (optional)

```git clone https://github.com/reverbnation/alpine_smashing.git```

```cd alpine_smashing```

```docker build -t alpine_smashing . ```

## Run
```docker run -d -p 8080:3030 reverbnation/alpine_smashing```

And point your browser to [http://localhost:8080/](http://localhost:8080/)


## Configuration
### Custom smashing port
If you want smashing to use a custom port inside the container, e g 8080, use the environment variable `$PORT`:

```docker run -d -e PORT=8080 -p 80:8080 reverbnation/alpine_smashing```

### Gems
To install gems, supply the gem name(s) as an environment variable:

```docker run -d -e GEMS=instagram -e WIDGETS=5278790 -p 8080:3030 reverbnation/alpine_smashing```

This example installs the [Instagram photos by location](https://gist.github.com/mjamieson/5278790) widget,
which depends on the instagram gem. Multiple gems and widgets can be supplied like so:

```docker run -d -e GEMS="mysql instagram" -e WIDGETS=5278790 -p 8080:3030 reverbnation/alpine_smashing```

Note: This is a fork of the dockerfile-alpine-smashing. Read about that [here](https://github.com/rgcamus/dockerfile-alpine_smashing)

## Thanks
- [@rgcamus](https://github.com/rgcamus), original author of the Dockerfile)
- [@frvi](https://github.com/frvi), original author of run.sh)
- [@mattgruter](https://github.com/mattgruter), awesome contributions!
- [@rowanu](https://github.com/rowanu), [Hotness Widget](https://gist.github.com/rowanu/6246149).
- [@munkius](https://github.com/munkius), [fork](https://gist.github.com/munkius/9209839) of Hotness Widget.
- [@chelsea](https://github.com/chelsea), [Random Aww](https://gist.github.com/chelsea/5641535).

## License
Distributed under the MIT license
