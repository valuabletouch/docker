#!/bin/bash

set -eux

if [[ "$*" == node*current/index.js* ]]; then
  baseDir="$GHOST_APP_PATH/content.setup"

  for src in "$baseDir"/*/; do
    src="${src%/}"
    target="$GHOST_CONTENT_PATH/${src#$baseDir/}"

    if [ ! -e "$target" ]; then
      cp -r $src $GHOST_CONTENT_PATH
    fi
  done
fi

exec "$@"