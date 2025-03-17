#!/bin/bash

set -ex

BASE_DIR="${HOME}/brat"
BRAT_DIR="${BASE_DIR}/benchmark"
DOWNLOAD_URL='https://github.com/xujustinj/brat-setup/raw/refs/heads/benchmark/benchmark.tar.gz'
TAR_GZ_PATH="${BASE_DIR}/benchmark.tar.gz"

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

# starts the brat server on port 8001
python2 "${BRAT_DIR}/standalone.py"
