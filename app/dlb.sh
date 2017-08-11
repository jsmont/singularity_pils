#!/bin/bash

echo "Running on singularity"
export LD_LIBRARY_PATH=/opt/nanox/install/lib/performance:$LD_LIBRARY_PATH
export LD_PRELOAD=/opt/dlb/install/lib/libdlb_mpi_instr.so

export LB_TRACE_ENABLED=NO

export NX_ARGS+=" --thread-manager=dlb --enable-dlb --force-tie-master"
export LB_POLICY="auto_LeWI_mask"
export LB_LEND_MODE="block"

echo "LD_PRELOAD = $LD_PRELOAD"
echo "NX_ARGS = $NX_ARGS"
echo "EXTRAE_CONFIG_FILE = $EXTRAE_CONFIG_FILE"

$*
