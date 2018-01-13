#!/bin/bash

set -e

setEnvs () {
  cf set-env "$1" CF_USERNAME "${CF_USERNAME}"
  cf set-env "$1" CF_PASSWORD "${CF_PASSWORD}"
  cf set-env "$1" CF_API_ENDPOINT "${CF_API_ENDPOINT}"
  cf set-env "$1" WATERMARK "${WATERMARK}"
}

echo "Logging into CF..."
cf api https://api."${CF_SYS_DOMAIN}" --skip-ssl-validation
cf auth "${CF_DEPLOY_USERNAME}" "${CF_DEPLOY_PASSWORD}"