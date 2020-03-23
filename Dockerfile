FROM nginx:alpine

RUN apk --no-cache add curl
COPY entrypoint.sh /

CMD [ "sh", "/entrypoint.sh"]
