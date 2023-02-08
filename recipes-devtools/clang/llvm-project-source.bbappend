FILESEXTRAPATHS:prepend := "${THISDIR}/clang:"

MAJOR_VER = "15"
MINOR_VER = "0"
PATCH_VER = "0"

SRCREV = "d6cf181a8df6a7925660b2332e3ab7dbcfd08145"
BRANCH = "main"

SRC_URI = "\
    ${BASEURI} \
    file://llvm-config \
    file://libunwind.pc.in \
    file://0001-Merge-four-Custom-CSR-cache-instruction.patch \
    file://0002-add-pref-instruction.patch \
    file://0003-add-multilib-v-b-support-for-baremetal-toolchain.patch \
    file://0004-set-default-march-to-rv64imafcd_zba_zbb_zbc_zbs-and-.patch \
    file://0005-support-b-letter-in-march-string.patch \
    file://0006-set-clang-default-dwarf-version-to-4.patch \
    file://0007-set-clang-default-march-to-rv64gc.patch \
    file://0008-change-baremetal-multilib-directory-name-to-align-wi.patch \
    file://0001-libcxxabi-Find-libunwind-headers-when.patch \
    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
    file://0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
    file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
    file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
    file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
    file://0008-clang-Prepend-trailing-to-sysroot.patch \
    file://0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
    file://0010-clang-Define-releative-gcc-installation-dir.patch \
    file://0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
    file://0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch \
    file://0013-Check-for-atomic-double-intrinsics.patch \
    file://0014-libcxx-Add-compiler-runtime-library-to-link-step-for.patch \
    file://0015-clang-llvm-cmake-Fix-configure-for-packages-using-fi.patch \
    file://0016-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
    file://0017-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
    file://0018-clang-Use-python3-in-python-scripts.patch \
    file://0019-For-x86_64-set-Yocto-based-GCC-install-search-path.patch \
    file://0020-llvm-Do-not-use-find_library-for-ncurses.patch \
    file://0021-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch \
    file://0022-compiler-rt-Use-mcr-based-barrier-on-armv6.patch \
    file://0023-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
    file://0024-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
    file://0025-compiler-rt-Link-scudo-with-SANITIZER_CXX_ABI_LIBRAR.patch \
    file://0026-compiler-rt-Link-scudo-standalone-with-libatomic-on-.patch \
    file://0027-libunwind-Added-unw_backtrace-method.patch \
    file://0029-clang-Do-not-use-install-relative-libc-headers.patch \
    file://0030-clang-Fix-how-driver-finds-GCC-installation-path-on-.patch \
    file://0032-Correct-library-search-path-for-OpenEmbedded-Host.patch \
    file://0033-lldb-Link-with-libatomic-on-x86.patch \
    file://0034-clang-exclude-openembedded-distributions-from-settin.patch \
    file://0035-compiler-rt-Enable-__int128-for-ppc32.patch \
    "
