#!/bin/bash

set -ex

BASE_DIR="${HOME}/brat"
BRAT_DIR="${BASE_DIR}/brat-1.3p1"
DOWNLOAD_URL='https://github.com/nlplab/brat/archive/refs/tags/v1.3p1.tar.gz'
TAR_GZ_PATH="${BASE_DIR}/brat-v1.3p1.tar.gz"

USERNAME="editor"
PASSWORD="annotate"
ADMIN_EMAIL=""

echo "${BRAT_DIR}"
if [ -d "${BRAT_DIR}" ]; then
  echo "brat installation already exists."
else
  echo "brat installation does not exist."

  mkdir --parent "${BASE_DIR}"
  wget "${DOWNLOAD_URL}" --output-document="${TAR_GZ_PATH}"
  tar --extract --ungzip --file="${TAR_GZ_PATH}" --directory="${BASE_DIR}"
  rm "${TAR_GZ_PATH}"
fi

cd "${BRAT_DIR}"

if [ ! -f "${BRAT_DIR}/config.py" ]; then
  printf "${USERNAME}\n${PASSWORD}\n${ADMIN_EMAIL}" | bash "${BRAT_DIR}/install.sh"
fi

# starts the brat server on port 8001
python2 "${BRAT_DIR}/standalone.py"
