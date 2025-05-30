// -*- C++ -*-
//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef _LIBCPP___CXX03___ITERATOR_NEXT_H
#define _LIBCPP___CXX03___ITERATOR_NEXT_H

#include <__cxx03/__assert>
#include <__cxx03/__config>
#include <__cxx03/__iterator/advance.h>
#include <__cxx03/__iterator/iterator_traits.h>
#include <__cxx03/__type_traits/enable_if.h>

#if !defined(_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER)
#  pragma GCC system_header
#endif

_LIBCPP_BEGIN_NAMESPACE_STD

template <class _InputIter, __enable_if_t<__has_input_iterator_category<_InputIter>::value, int> = 0>
inline _LIBCPP_HIDE_FROM_ABI _InputIter
next(_InputIter __x, typename iterator_traits<_InputIter>::difference_type __n = 1) {
  // Calling `advance` with a negative value on a non-bidirectional iterator is a no-op in the current implementation.
  // Note that this check duplicates the similar check in `std::advance`.
  _LIBCPP_ASSERT_PEDANTIC(__n >= 0 || __has_bidirectional_iterator_category<_InputIter>::value,
                          "Attempt to next(it, n) with negative n on a non-bidirectional iterator");

  std::advance(__x, __n);
  return __x;
}

_LIBCPP_END_NAMESPACE_STD

#endif // _LIBCPP___CXX03___ITERATOR_NEXT_H
