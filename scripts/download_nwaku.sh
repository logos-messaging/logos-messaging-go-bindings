#!/usr/bin/env bash
set -euo pipefail

VERSION="${VERSION:-v0.36.0}"
NWAKU_DIR="../third_party/nwaku"
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
EXT="so"

if [ ! -d "$NWAKU_DIR" ]; then
  echo "Error: Directory $NWAKU_DIR does not exist. Please create it first."
  exit 1
fi

case "$OS" in
  darwin) OS="darwin" ;;
  linux) OS="linux" ;;
  *) echo "Unsupported OS: $OS"; exit 1 ;;
esac

case "$ARCH" in
  x86_64|amd64) ARCH="x86_64" ;;
  arm64|aarch64) ARCH="arm64" ;;
  *) echo "Unsupported ARCH: $ARCH"; exit 1 ;;
esac

URL_BASE="https://github.com/waku-org/nwaku/releases/download"
URL="${URL_BASE}/${VERSION}/libwaku-${VERSION}-${OS}-${ARCH}.${EXT}"
HEADER_URL="${URL_BASE}/${VERSION}/libwaku.h"

echo "Downloading nwaku $VERSION for $OS-$ARCH..."

echo "Downloading library header from $HEADER_URL"
curl -sfL -o "$NWAKU_DIR/libwaku.h" "$HEADER_URL"

echo "Downloading library binary from $URL"
curl -sfL -o "$NWAKU_DIR/libwaku.${EXT}" "$URL"