#!/bin/bash

echo 'Cloning Shared Scripts repository...'

echo "SHARED_SCRIPTS_FOLDER: ${SHARED_SCRIPTS_FOLDER}"

git clone https://github.com/john-morsley/shared-scripts.git \
  ${SHARED_SCRIPTS_FOLDER}

exit 0