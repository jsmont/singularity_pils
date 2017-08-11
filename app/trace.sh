#!/bin/bash

echo "Running on Singularity"
export EXTRAE_HOME=/opt/extrae/install
export LD_LIBRARY_PATH=/opt/nanox/install/lib/instrumentation:$LD_LIBRARY_PATH

echo $*

source $EXTRAE_HOME/etc/extrae.sh
export LD_PRELOAD="$EXTRAE_HOME/lib/libnanosmpitrace.so"
export EXTRAE_CONFIG_FILE="$app_path/extrae.xml"
export NX_ARGS+=" --instrumentation=extrae --summary"

echo "LD_PRELOAD = $LD_PRELOAD"
echo "NX_ARGS = $NX_ARGS"
echo "EXTRAE_CONFIG_FILE = $EXTRAE_CONFIG_FILE"

$*
