/* Find the first set bit in a 'long long' word.

   Copyright (C) 2011-2022 Free Software Foundation, Inc.

   This file is free software: you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as
   published by the Free Software Foundation; either version 2.1 of the
   License, or (at your option) any later version.

   This file is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#define FUNC ffsll
#define TYPE long long int
#define GCC_BUILTIN __builtin_ffsll
#ifdef _WIN64
# define MSVC_BUILTIN _BitScanForward64
#endif
#include "ffsl.h"