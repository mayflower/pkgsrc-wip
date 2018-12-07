$NetBSD$

--- mozilla-release/dom/base/nsAttrName.h.orig	2018-11-16 08:40:07.000000000 +0000
+++ mozilla-release/dom/base/nsAttrName.h
@@ -16,6 +16,11 @@
 #include "mozilla/dom/NodeInfo.h"
 #include "nsAtom.h"
 #include "nsDOMString.h"
+#ifdef __NetBSD__
+/* This is also a macro which causes problems with cbindgen */
+#undef uintptr_t
+#endif
+
 
 #define NS_ATTRNAME_NODEINFO_BIT 1
 class nsAttrName