#!/bin/bash
if [[ -z "$FRONTEND_COMMAND" ]]; then
  exec "$@"
else
  bash -c "$FRONTEND_COMMAND"
fi

