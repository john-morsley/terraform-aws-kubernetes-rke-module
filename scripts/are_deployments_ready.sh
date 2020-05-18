#!/bin/sh

echo "KUBE_CONFIG_FOLDER: ${KUBE_CONFIG_FOLDER}"
echo "CURRENT_FOLDER: ${CURRENT_FOLDER}"

bash ${CURRENT_FOLDER}/../common-kubernetes/scripts/are_deployments_ready.sh ${KUBE_CONFIG_FOLDER}

exit 0