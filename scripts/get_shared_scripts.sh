#!/bin/bash

echo 'Cloning Shared Scripts repository...'

if [[ -d "shared-scripts" ]]; then
  rm --recursive --force shared-scripts
fi  

git clone https://github.com/john-morsley/shared-scripts.git

exit 0