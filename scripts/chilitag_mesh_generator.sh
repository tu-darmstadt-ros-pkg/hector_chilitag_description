#!/bin/bash

BASE_DIR=$(dirname $(readlink -f $0))
MESHES_DIR=$(readlink -f $BASE_DIR/../meshes)

FIRST_ID=$1
if [ -z $FIRST_ID ]; then
    echo "usage $0 FIRST_ID [COUNT]"
    exit 1
fi

COUNT=$2
if [ -z $COUNT ]; then
    COUNT=1
fi
LAST_ID=$((FIRST_ID+COUNT-1))

for ((CHILITAG_ID=$FIRST_ID;CHILITAG_ID<=$LAST_ID;CHILITAG_ID++)); do
    # create chilitag png
    (cd ${MESHES_DIR}; chilitags-creator ${CHILITAG_ID} 15)
    # insert chilitag id into template
    CHILITAG_ID="${CHILITAG_ID}" envsubst < "${MESHES_DIR}/chilitag_template.dae" > "${MESHES_DIR}/chilitag${CHILITAG_ID}.dae"
done
