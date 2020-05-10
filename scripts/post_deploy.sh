#!/bin/bash

set -euo pipefail

# Re remove exited containers & prune images in order to avoid running out of disk space
REMOVE_STALE_CONTAINERS="
  STALE_CONTAINERS=\$(docker container ls --all --quiet --filter exited=1)
  [ -z \"\${STALE_CONTAINERS}\" ] && echo \"No stale containers to remove\" \
    || \${STALE_CONTAINERS} | xargs docker container rm
"
PRUNE_IMAGES="yes | docker image prune"

# We use 'ssh' instead of 'doctl compute ssh' to be able to bypass key checking.
ssh -i ~/.ssh/deploy_rsa -oStrictHostKeyChecking=no \
  ${DEPLOY_USER}@${IP_ADDRESS} \
  "
    ${REMOVE_STALE_CONTAINERS}
    ${PRUNE_IMAGES}
  "
