#!/usr/bin/env sh

echo "-------------------------------------------------------------------------------"

echo "CURRENT: ${CURRENT}"
echo "ROOT: ${ROOT}"

echo "-------------------------------------------------------------------------------"

KUBE_CONFIG_FOLDER="${CURRENT}/K8s"
echo "KUBE_CONFIG_FOLDER: ${KUBE_CONFIG_FOLDER}"

COMMON_KUBERNETES="${CURRENT}/${ROOT}/../common-kubernetes"
echo "COMMON_KUBERNETES: ${COMMON_KUBERNETES}"

echo "-------------------------------------------------------------------------------"

bash ${COMMON_KUBERNETES}/scripts/are_deployments_ready.sh ${KUBE_CONFIG_FOLDER}

exit 0