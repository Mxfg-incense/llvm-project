; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

;
; SQABS (sve2_int_un_pred_arit)
;

; Check movprfx is not inserted when dstReg == srcReg
define <vscale x 16 x i8> @sqabs_i8_dupreg(<vscale x 16 x i8> %a) #0 {
; CHECK-LABEL: sqabs_i8_dupreg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    sqabs z0.b, p0/m, z0.b
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32 31)
  %ret = tail call <vscale x 16 x i8> @llvm.aarch64.sve.sqabs.nxv16i8(<vscale x 16 x i8> poison, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %a)
  ret <vscale x 16 x i8> %ret
}

; Check movprfx is inserted when passthru is undef
define <vscale x 16 x i8> @sqabs_i8_undef(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) #0 {
; CHECK-LABEL: sqabs_i8_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32 31)
  %ret = tail call <vscale x 16 x i8> @llvm.aarch64.sve.sqabs.nxv16i8(<vscale x 16 x i8> poison, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %ret
}

; Check movprfx is inserted when predicate is all active, making the passthru dead
define <vscale x 16 x i8> @sqabs_i8_active(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) #0 {
; CHECK-LABEL: sqabs_i8_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32 31)
  %ret = tail call <vscale x 16 x i8> @llvm.aarch64.sve.sqabs.nxv16i8(<vscale x 16 x i8> %a, <vscale x 16 x i1> %pg, <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %ret
}

; Check movprfx is not inserted when predicate is not all active, making the passthru used
define <vscale x 16 x i8> @sqabs_i8_not_active(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) #0 {
; CHECK-LABEL: sqabs_i8_not_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sqabs z0.b, p0/m, z1.b
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %pg.to = tail call <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv2i1(<vscale x 2 x i1> %pg)
  %ret = tail call <vscale x 16 x i8> @llvm.aarch64.sve.sqabs.nxv16i8(<vscale x 16 x i8> %a, <vscale x 16 x i1> %pg.to, <vscale x 16 x i8> %b)
  ret <vscale x 16 x i8> %ret
}

define <vscale x 8 x i16> @sqabs_i16_dupreg(<vscale x 8 x i16> %a) #0 {
; CHECK-LABEL: sqabs_i16_dupreg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    sqabs z0.h, p0/m, z0.h
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32 31)
  %ret = tail call <vscale x 8 x i16> @llvm.aarch64.sve.sqabs.nxv8i16(<vscale x 8 x i16> poison, <vscale x 8 x i1> %pg, <vscale x 8 x i16> %a)
  ret <vscale x 8 x i16> %ret
}

define <vscale x 8 x i16> @sqabs_i16_undef(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) #0 {
; CHECK-LABEL: sqabs_i16_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32 31)
  %ret = tail call <vscale x 8 x i16> @llvm.aarch64.sve.sqabs.nxv8i16(<vscale x 8 x i16> poison, <vscale x 8 x i1> %pg, <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %ret
}

define <vscale x 8 x i16> @sqabs_i16_active(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) #0 {
; CHECK-LABEL: sqabs_i16_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32 31)
  %ret = tail call <vscale x 8 x i16> @llvm.aarch64.sve.sqabs.nxv8i16(<vscale x 8 x i16> %a, <vscale x 8 x i1> %pg, <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %ret
}

define <vscale x 8 x i16> @sqabs_i16_not_active(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) #0 {
; CHECK-LABEL: sqabs_i16_not_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sqabs z0.h, p0/m, z1.h
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %pg.to = tail call <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv2i1(<vscale x 2 x i1> %pg)
  %pg.from = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> %pg.to)
  %ret = tail call <vscale x 8 x i16> @llvm.aarch64.sve.sqabs.nxv8i16(<vscale x 8 x i16> %a, <vscale x 8 x i1> %pg.from, <vscale x 8 x i16> %b)
  ret <vscale x 8 x i16> %ret
}

define <vscale x 4 x i32> @sqabs_i32_dupreg(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: sqabs_i32_dupreg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    sqabs z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.sqabs.nxv4i32(<vscale x 4 x i32> poison, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @sqabs_i32_undef(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: sqabs_i32_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.sqabs.nxv4i32(<vscale x 4 x i32> poison, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @sqabs_i32_active(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: sqabs_i32_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.sqabs.nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @sqabs_i32_not_active(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: sqabs_i32_not_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sqabs z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %pg.to = tail call <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv2i1(<vscale x 2 x i1> %pg)
  %pg.from = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> %pg.to)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.sqabs.nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg.from, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 2 x i64> @sqabs_i64_dupreg(<vscale x 2 x i64> %a) #0 {
; CHECK-LABEL: sqabs_i64_dupreg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sqabs z0.d, p0/m, z0.d
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %ret = tail call <vscale x 2 x i64> @llvm.aarch64.sve.sqabs.nxv2i64(<vscale x 2 x i64> poison, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %a)
  ret <vscale x 2 x i64> %ret
}

define <vscale x 2 x i64> @sqabs_i64_undef(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) #0 {
; CHECK-LABEL: sqabs_i64_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %ret = tail call <vscale x 2 x i64> @llvm.aarch64.sve.sqabs.nxv2i64(<vscale x 2 x i64> poison, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %ret
}

define <vscale x 2 x i64> @sqabs_i64_active(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) #0 {
; CHECK-LABEL: sqabs_i64_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    sqabs z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %ret = tail call <vscale x 2 x i64> @llvm.aarch64.sve.sqabs.nxv2i64(<vscale x 2 x i64> %a, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %ret
}

define <vscale x 2 x i64> @sqabs_i64_not_active(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b, <vscale x 2 x i1> %pg) #0 {
; CHECK-LABEL: sqabs_i64_not_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    sqabs z0.d, p0/m, z1.d
; CHECK-NEXT:    ret
  %ret = tail call <vscale x 2 x i64> @llvm.aarch64.sve.sqabs.nxv2i64(<vscale x 2 x i64> %a, <vscale x 2 x i1> %pg, <vscale x 2 x i64> %b)
  ret <vscale x 2 x i64> %ret
}

;
; URECPE (sve2_int_un_pred_arit_s)
;

define <vscale x 4 x i32> @urecpe_i32_dupreg(<vscale x 4 x i32> %a) #0 {
; CHECK-LABEL: urecpe_i32_dupreg:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    urecpe z0.s, p0/m, z0.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.urecpe.nxv4i32(<vscale x 4 x i32> poison, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %a)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @urecpe_i32_undef(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: urecpe_i32_undef:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    urecpe z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.urecpe.nxv4i32(<vscale x 4 x i32> poison, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @urecpe_i32_active(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: urecpe_i32_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    movprfx z0, z1
; CHECK-NEXT:    urecpe z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.urecpe.nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

define <vscale x 4 x i32> @urecpe_i32_not_active(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: urecpe_i32_not_active:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    urecpe z0.s, p0/m, z1.s
; CHECK-NEXT:    ret
  %pg = tail call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %pg.to = tail call <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv2i1(<vscale x 2 x i1> %pg)
  %pg.from = tail call <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1> %pg.to)
  %ret = tail call <vscale x 4 x i32> @llvm.aarch64.sve.urecpe.nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i1> %pg.from, <vscale x 4 x i32> %b)
  ret <vscale x 4 x i32> %ret
}

declare <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32)
declare <vscale x 8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32)
declare <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32)
declare <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32)

declare <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv8i1(<vscale x 8 x i1>)
declare <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv4i1(<vscale x 4 x i1>)
declare <vscale x 16 x i1> @llvm.aarch64.sve.convert.to.svbool.nxv2i1(<vscale x 2 x i1>)

declare <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1>)
declare <vscale x 4 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv4i1(<vscale x 16 x i1>)
declare <vscale x 2 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv2i1(<vscale x 16 x i1>)

declare <vscale x 16 x i8> @llvm.aarch64.sve.sqabs.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i1>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.sqabs.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i1>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.sqabs.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i1>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.sqabs.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i1>, <vscale x 2 x i64>)

declare <vscale x 4 x i32> @llvm.aarch64.sve.urecpe.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i1>, <vscale x 4 x i32>)

attributes #0 = { nounwind "target-features"="+sve2" }
