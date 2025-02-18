require recipes-devtools/gcc/gcc-${PV}.inc
require recipes-devtools/gcc/gcc-source.inc

EXCLUDE_FROM_WORLD = "1"

EXTRA_OECONF:append:riscv64 = " --with-arch=rv64gcb --with-abi=lp64d CFLAGS_FOR_TARGET="-O2 -mcmodel=medany -march=rv64gcb" CXXFLAGS_FOR_TARGET="-O2 -mcmodel=medany -march=rv64gcb" "
