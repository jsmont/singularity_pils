
CC = smpcc
CFLAGS = --ompss --instrument
CPPFLAGS = -I/apps/OPENMPI/2.0.1/INTEL/include/openmpi/opal/mca/hwloc/hwloc172/hwloc/include -I/apps/OPENMPI/2.0.1/INTEL/include/openmpi/opal/mca/event/libevent2021/libevent -I/apps/OPENMPI/2.0.1/INTEL/include/openmpi/opal/mca/event/libevent2021/libevent/include -I/apps/OPENMPI/2.0.1/INTEL/include -I/apps/OPENMPI/2.0.1/INTEL/include/openmpi -pthread
LDFLAGS = -pthread -Wl,-rpath -Wl,/apps/OPENMPI/2.0.1/INTEL/lib -Wl,--enable-new-dtags -L/apps/OPENMPI/2.0.1/INTEL/lib -lmpi --instrument

mpi_ompss_pils: mpi_ompss_pils.c
	$(CC) $^ -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

.PHONY: clean
clean:
	rm -f mpi_ompss_pils
