#!/bin/sh

# Formats
# Ninjago: $(echo "$title" | cut -d : -f 2) $(echo "$title" | cut -d : -f 1)

AUTHCODE=${1-$AUTHCODE}

usage() {
  echo "Usage: $0 <authcode>"
  echo "  <authcode> - the authcode from Audible"
  echo "  <authcode> is optional, if not provided, the value of the environment variable AUTHCODE will be used"
  exit 1
}

if [ -z "$AUTHCODE" ]; then
  usage
fi

TARGET_DIR=./converted

ls *.aax | \
xargs -I {} \
AAXtoMP3 --opus \
    --single \
    --level 10 \
    --file-naming-scheme '$(echo "$title" | cut -d : -f 2) $(echo "$title" | cut -d : -f 1)' \
    --dir-naming-scheme "$TARGET_DIR" \
    --authcode $AUTHCODE \
    {}