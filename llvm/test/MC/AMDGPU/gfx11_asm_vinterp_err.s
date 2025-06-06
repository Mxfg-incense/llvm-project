// NOTE: Assertions have been autogenerated by utils/update_mc_test_checks.py UTC_ARGS: --unique --version 5
// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1100 -mattr=+real-true16 %s 2>&1 | FileCheck %s -check-prefix=GCN-ERR --implicit-check-not=error: --strict-whitespace
// RUN: not llvm-mc -triple=amdgcn -mcpu=gfx1200 -mattr=+real-true16 %s 2>&1 | FileCheck %s -check-prefix=GCN-ERR --implicit-check-not=error: --strict-whitespace

//===----------------------------------------------------------------------===//
// VINTERP src operands must be VGPRs.
// Check that other operand kinds are rejected by assembler.
//===----------------------------------------------------------------------===//

v_interp_p10_f32 v0, s1, v2, v3
// GCN-ERR: :[[@LINE-1]]:22: error: invalid operand for instruction

v_interp_p10_f32 v0, v1, s2, v3
// GCN-ERR: :[[@LINE-1]]:26: error: invalid operand for instruction

v_interp_p10_f32 v0, v1, v2, s3
// GCN-ERR: :[[@LINE-1]]:30: error: invalid operand for instruction

v_interp_p2_f32 v0, 1, v2, v3
// GCN-ERR: :[[@LINE-1]]:21: error: invalid operand for instruction

v_interp_p2_f32 v0, v1, 2, v3
// GCN-ERR: :[[@LINE-1]]:25: error: invalid operand for instruction

v_interp_p2_f32 v0, v1, v2, 3
// GCN-ERR: :[[@LINE-1]]:29: error: invalid operand for instruction

v_interp_p10_f16_f32 v0, s1, v2, v3.l
// GCN-ERR: :[[@LINE-1]]:26: error: invalid operand for instruction

v_interp_p10_f16_f32 v0, v1.l, s2, v3.l
// GCN-ERR: :[[@LINE-1]]:32: error: invalid operand for instruction

v_interp_p10_f16_f32 v0, v1.l, v2, s3
// GCN-ERR: :[[@LINE-1]]:36: error: invalid operand for instruction

v_interp_p2_f16_f32 v0.l, 1, v2, v3.l
// GCN-ERR: :[[@LINE-1]]:27: error: invalid operand for instruction

v_interp_p2_f16_f32 v0.l, v1.l, 2, v3.l
// GCN-ERR: :[[@LINE-1]]:33: error: invalid operand for instruction

v_interp_p2_f16_f32 v0.l, v1.l, v2, 3
// GCN-ERR: :[[@LINE-1]]:37: error: invalid operand for instruction
