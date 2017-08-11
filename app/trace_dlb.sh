#!/bin/bash

echo "Running on singularity"

export EXTRAE_HOME=/opt/extrae/install
source $EXTRAE_HOME/etc/extrae.sh

export LD_LIBRARY_PATH=/opt/nanox/install/lib/instrumentation:$LD_LIBRARY_PATH
export LD_PRELOAD=/opt/dlb/install/lib/libdlb_mpi_instr.so

export LB_TRACE_ENABLED=NO

export LD_PRELOAD=$LD_PRELOAD:$EXTRAE_HOME/lib/libnanosmpitrace-lb.so
export EXTRAE_CONFIG_FILE="$app_path/extrae.xml"
export NX_ARGS+=" --instrumentation=extrae --summary"
export NX_ARGS+=" --thread-manager=dlb --enable-dlb --force-tie-master"
export LB_POLICY="auto_LeWI_mask"
export LB_LEND_MODE="block"

echo "LD_PRELOAD = $LD_PRELOAD"
echo "NX_ARGS = $NX_ARGS"
echo "EXTRAE_CONFIG_FILE = $EXTRAE_CONFIG_FILE"

$*
