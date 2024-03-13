require recipes-devtools/gcc/gcc-${PV}.inc
require gcc-cross.inc

EXTRA_OECONF:append:riscv64 = " --with-arch=rv64gcb --with-abi=lp64d CFLAGS_FOR_TARGET="-O2 -mcmodel=medany -march=rv64gcb" CXXFLAGS_FOR_TARGET="-O2 -mcmodel=medany -march=rv64gcb" "
