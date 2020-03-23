FROM nginxinc/nginx-unprivileged:alpine

# we need to be root to install packages
USER root

RUN apk --no-cache add curl
COPY entrypoint.sh /

# nginx uses this uid https://github.com/nginxinc/docker-nginx-unprivileged
USER 101

CMD [ "sh", "/entrypoint.sh"]
