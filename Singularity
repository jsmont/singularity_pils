BootStrap:docker
from: jsola/bsc_base:mn4

%setup
    
    echo "Adding files to container"
    cp -r ./app $SINGULARITY_ROOTFS/opt/

%post
    
    source /opt/imports.sh
    echo "In post"
    cd /opt/app
    make

%environment
    export app_path=/opt/app    

%runscript   
 
    export $*

    source /opt/imports.sh

    

    if [ -z ${TRACE+"1"} ]; then
        if [ -z ${DLB+"1"} ]; then    
            echo "Executing"
            $app_path/mpi_ompss_pils $app_path/loads 1 2 500
        else 
            echo "Executing with DLB"
            $app_path/dlb.sh $app_path/mpi_ompss_pils $app_path/loads 1 2 500
        fi
    else 
        if [ -z ${DLB+"1"} ]; then
            echo "Executing and tracing"
            $app_path/trace.sh $app_path/mpi_ompss_pils $app_path/loads 1 2 500
        else 
            echo "Executing and tracing with DLB"
            $app_path/trace_dlb.sh $app_path/mpi_ompss_pils $app_path/loads 1 2 500
        fi
    fi

    nanox-bindings
