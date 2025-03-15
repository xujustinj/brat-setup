#!/bin/bash

set -e

BASE_DIR="${HOME}/brat"
BRAT_DIR="${BASE_DIR}/brat-1.3p1"
DOWNLOAD_URL='https://github.com/nlplab/brat/archive/refs/tags/v1.3p1.tar.gz'
TAR_GZ_PATH="${BASE_DIR}/brat-v1.3p1.tar.gz"
USERNAME="editor"
PASSWORD="annotate"
ADMIN_EMAIL=""

# download and extract brat if it doesn't exist yet
if [ -d "${BRAT_DIR}" ]; then
  echo "brat installation already exists at ${BRAT_DIR}"
else
  echo "brat installation does not exist at ${BRAT_DIR}"

  set -x
  mkdir --parent "${BASE_DIR}"
  wget "${DOWNLOAD_URL}" --output-document="${TAR_GZ_PATH}"
  tar --extract --ungzip --file="${TAR_GZ_PATH}" --directory="${BASE_DIR}"
  rm "${TAR_GZ_PATH}"
  set +x
fi

cd "${BRAT_DIR}"

# run install.sh if it hasn't been run yet
if [ ! -f "${BRAT_DIR}/config.py" ]; then
  set -x
  printf "${USERNAME}\n${PASSWORD}\n${ADMIN_EMAIL}" | bash "${BRAT_DIR}/install.sh"
  set +x
fi

# starts the brat server on port 8001
set -x
python2 "${BRAT_DIR}/standalone.py"
set +x
