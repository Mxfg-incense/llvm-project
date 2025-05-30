//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// UNSUPPORTED: c++03, c++11, c++14, c++17

// XFAIL: availability-char8_t_support-missing

// <locale>

// template <> class codecvt<char32_t, char8_t, mbstate_t>

// result out(stateT& state,
//            const internT* from, const internT* from_end, const internT*& from_next,
//            externT* to, externT* to_end, externT*& to_next) const;

#include <cassert>
#include <locale>

int main(int, char**) {
  using F = std::codecvt<char32_t, char8_t, std::mbstate_t>;
  const F& f = std::use_facet<F>(std::locale::classic());
  F::intern_type from[9] = {u's', u'o', u'm', u'e', u' ', u't', u'e', u'x', u't'};
  F::extern_type to[9] = {0};
  std::mbstate_t mbs = {};
  const F::intern_type* from_next = nullptr;
  F::extern_type* to_next = nullptr;
  F::result r = f.out(mbs, from, from + 9, from_next, to, to + 9, to_next);
  assert(r == F::ok);
  assert(from_next - from == 9);
  assert(to_next - to == 9);
  for (unsigned i = 0; i < 9; ++i)
    assert(static_cast<char32_t>(to[i]) == from[i]);
  return 0;
}
