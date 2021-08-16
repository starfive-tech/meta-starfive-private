FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += " \
file://0002-testsuite-Require-gnu-tm-support-for-pr94856.C.patch \
file://0003-RISC-V-Add-shorten_memrefs-pass.patch \
file://0004-RISC-V-Update-march-parser.patch \
file://0005-RISC-V-Handle-implied-extension-for-march-parser.patch \
file://0006-Fix-alignment-for-local-variable-PR90811.patch \
file://0007-RISC-V-Optimize-si-to-di-zero-extend-followed-by-lef.patch \
file://0008-RISC-V-Make-__divdi3-handle-div-by-zero-same-as-hard.patch \
file://0009-RISC-V-Normalize-arch-string-in-driver-time.patch \
file://0010-RISC-V-Preserve-arch-version-info-during-normalizing.patch \
file://0011-RISC-V-Handle-multi-letter-extension-for-multilib-ge.patch \
file://0012-testsuite-Adjust-gfortran.dg-pr95690.f90-line-number.patch \
file://0013-RISC-V-fix-a-typo-in-riscv.h.patch \
file://0014-Fix-build-failure-with-zstd-versio9n-1.2.0-or-older.patch \
file://0015-RISC-V-Define-__riscv_cmodel_medany-for-PIC-mode.patch \
file://0016-RISC-V-Add-support-for-mcpu-option.patch \
file://0017-RISC-V-Handle-implied-extension-in-multilib-generato.patch \
file://0018-RISC-V-Extend-syntax-for-the-multilib-generator.patch \
file://0019-RISC-V-Refine-riscv_parse_arch_string.patch \
file://0020-RISC-V-Add-configure-option-with-multilib-generator-.patch \
file://0021-RISC-V-Check-multiletter-extension-has-more-than-1-l.patch \
file://0022-RISC-V-Mark-non-export-symbol-static-and-const-in-ri.patch \
file://0023-RISC-V-Enable-ifunc-if-it-was-supported-in-the-binut.patch \
file://0024-RISC-V-Handle-implied-extension-in-canonical-orderin.patch \
file://0025-RISC-V-Support-zicsr-and-zifencei-extension-for-marc.patch \
file://0026-RISC-V-Support-version-controling-for-ISA-standard-e.patch \
file://0027-Fix-print_multilib_info-when-default-arguments-appea.patch \
file://0028-RISC-V-Always-define-MULTILIB_DEFAULTS.patch \
file://0029-RISC-V-Drop-some-commited-accidentally-code.patch \
file://0030-RISC-V-Canonicalize-with-arch.patch \
file://0031-RISC-V-Explicitly-call-python-when-using-multilib-ge.patch \
file://0032-Add-TARGET_COMPUTE_MULTILIB-hook-to-override-multi-l.patch \
file://0033-RISC-V-Implement-TARGET_COMPUTE_MULTILIB.patch \
file://0034-PR-target-97682-Fix-to-reuse-t1-register-between-cal.patch \
file://0035-soft-fp-Support-more-fp16-operation.patch \
file://0036-soft-fp-Implement-more-soft-fp16-functions.patch \
file://0037-RISC-V-Support-zfh-extension.patch \
file://0038-RISC-V-Set-default-version-for-zfh-to-0.1.patch \
file://0039-Add-VECTOR_TUPLE_MODES_WITH_PREFIX-in-genmodes.patch \
file://0040-RISC-V-Support-vector-intrinsic-functions.patch \
file://0041-riscv-bitmanip-Support-for-B-ext.patch \
file://0042-SiFive-CLIC-patches-for-preemptible-and-stack-swappi.patch \
file://0043-Implement-compact-code-model.patch \
file://0044-Adjust-testcase-for-compact-code-model.patch \
file://0045-WORKAROUND-Do-not-define-MULTILIB_DEFAULTS.patch \
file://0046-RISC-V-Handle-more-multi-lib-option-than-arch-abi.patch \
file://0047-RISC-V-Fix-python3-compatibility-for-multilib-genera.patch \
file://0048-RISC-V-Move-class-riscv_subset_list-and-riscv_subset.patch \
file://0049-RISC-V-Implement-new-style-of-architecture-extension.patch \
file://0050-RISC-V-Remove-duplicated-define-for-zfh.patch \
file://0051-Fix-zext.w-pattern.patch \
file://0052-riscv-bitmanip-Fix-the-operand-order-of-addu.w.patch \
file://0053-Fix-MacOS-build.patch \
file://0054-Update-asm-pattern-to-RVB-0.93.patch \
file://0055-Bump-version-of-RVB-to-0.93.patch \
file://0056-Fix-match_score-for-other-cond.patch \
file://0057-Fix-riscv_check_other_cond-for-non-multi-lib-build.patch \
file://0058-Add-more-comment-for-riscv_check_other_cond.patch \
file://0059-Do-not-install-riscv_vector.h-and-riscv_vector_itr.h.patch \
file://0060-Avoid-to-use-same-temp-register-to-adjust-stack-poin.patch \
file://0001-Yocto-patch-for-arch-canonicalize-to-use-python3.patch \
file://0001-Fix-compilation-issue-when-building-multilib.patch \
"
EXTRA_OECONF_append_riscv64 = " --with-arch=rv64gcv_zba_zbb --with-cmodel=medany"