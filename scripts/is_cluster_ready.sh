#!/usr/bin/env sh

echo "CURRENT: ${CURRENT}"
echo "ROOT: ${ROOT}"

KUBE_CONFIG_FOLDER="${CURRENT}/K8s"
echo "KUBE_CONFIG_FOLDER: ${KUBE_CONFIG_FOLDER}"

COMMON_KUBERNETES="${CURRENT}/${ROOT}/../common-kubernetes"
echo "COMMON_KUBERNETES: ${COMMON_KUBERNETES}"

bash ${COMMON_KUBERNETES}/scripts/is_cluster_ready.sh ${KUBE_CONFIG_FOLDER}

exit 0