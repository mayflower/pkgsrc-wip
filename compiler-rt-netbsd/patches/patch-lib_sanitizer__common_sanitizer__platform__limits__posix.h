$NetBSD$

--- lib/sanitizer_common/sanitizer_platform_limits_posix.h.orig	2018-12-07 22:43:42.614681158 +0000
+++ lib/sanitizer_common/sanitizer_platform_limits_posix.h
@@ -1426,6 +1426,7 @@ struct __sanitizer_cookie_io_functions_t
 
   extern const int si_SEGV_MAPERR;
   extern const int si_SEGV_ACCERR;
+  extern const unsigned fpos_t_sz;
 }  // namespace __sanitizer
 
 #define CHECK_TYPE_SIZE(TYPE) \
