$NetBSD: patch-toolkit_toolkit-tiers.mk,v 1.2 2013/05/11 05:39:53 makoto Exp $

--- toolkit/toolkit-tiers.mk.orig	2013-01-04 23:44:46.000000000 +0000
+++ toolkit/toolkit-tiers.mk
@@ -43,7 +43,7 @@ ifdef MOZ_UPDATER
 ifndef MOZ_NATIVE_BZ2
 tier_platform_dirs += modules/libbz2
 endif
-tier_platform_dirs += other-licenses/bsdiff
+#tier_platform_dirs += other-licenses/bsdiff
 endif
 
 tier_platform_dirs	+= gfx/qcms
