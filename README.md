# nginx-cloudflare-cache

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/ratisbonacoding/nginx-cloudflare-cache)

This image can be used as a base image for webservers that utilize Cloudflare's cache to reduce traffic hitting the actual server.

## How it works

When starting the container, this image will attempt to purge the Cloudflare cache and then start NGINX with `nginx -g "daemon off;"`, just like in the official NGINX image. See [`entrypoint.sh`](./entrypoint.sh) for the whole script.

## Environment variables

| Variable                 | Description                             |
| ------------------------ | --------------------------------------- |
| `CLOUDFLARE_ZONE_ID`     | The v4 zone id for your Cloudflare site |
| `CLOUDFLARE_PURGE_TOKEN` | Your API token to purge a site's cache  |

## License

This repository is released under the [MIT license](LICENSE).
