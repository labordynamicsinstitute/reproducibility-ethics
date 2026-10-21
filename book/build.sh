#!/bin/bash
# Build the book with Jupyter Book 2 (mystmd), always inside a container.
#   ./build.sh          -> static HTML in book/_build/html
#   ./build.sh start    -> live preview at http://localhost:3000
# On the host, this re-invokes itself inside $NODE_IMAGE; inside a container
# (e.g., the GitHub Actions job), it runs the build directly.
set -e
cd "$(dirname "$0")"

NODE_IMAGE=node:22
JB_VERSION=2.1.7

if [[ ! -f /.dockerenv && -z "$IN_CONTAINER" ]]; then
  mkdir -p ../.cache/npm
  [[ "$1" == "start" ]] && EXTRA="-it -p 3000:3000 -p 3100:3100"
  exec docker run --rm $EXTRA -u "$(id -u):$(id -g)" \
    -e HOME=/tmp -e npm_config_cache=/tmp/.npm -e BASE_URL \
    -v "$PWD/../.cache/npm":/tmp/.npm -v "$PWD":/book -w /book \
    $NODE_IMAGE ./build.sh "$@"
fi

# The theme server must bind where the HTML exporter fetches from
export HOST=${HOST:-127.0.0.1}

node scripts/make-bibliography.mjs

if [[ "$1" == "start" ]]; then
  HOST=0.0.0.0 npx -y jupyter-book@$JB_VERSION start
else
  npx -y jupyter-book@$JB_VERSION build --html
fi
