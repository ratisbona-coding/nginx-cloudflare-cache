#!/bin/sh

function echo_info() {
  echo "[*] $@"
}

function echo_warn() {
  echo "[!] $@"
}

if [[ "$CLOUDFLARE_ZONE_ID" == "" ]]; then
  echo_warn "skipping cloudflare cache purge"
else
  echo_info "purging cloudflare cache"
  response=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/purge_cache" \
      -H "Authorization: Bearer $CLOUDFLARE_PURGE_TOKEN" \
      -H "Content-Type: application/json" \
      --data '{"purge_everything":true}')

  if [[ "$response" == *"\"success\":true"* ]]; then
    echo_info "successfully purged cache"
  else
    echo_warn "error purging cache"
  fi
fi

echo_info "removing cloudflare tokens from environment"
unset CLOUDFLARE_ZONE_ID
unset CLOUDFLARE_PURGE_TOKEN

echo_info "starting nginx"
exec nginx -g "daemon off;" > /dev/null
