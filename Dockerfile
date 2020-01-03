# use a node base image
FROM node:7-onbuild
#FROM localhost:5000/my-registry
#ARG REPO_LOCATION=localhost:5000


# set maintainer
LABEL maintainer "miiro@getintodevops.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
