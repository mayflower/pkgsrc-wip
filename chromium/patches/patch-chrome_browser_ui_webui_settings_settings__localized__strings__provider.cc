$NetBSD$

--- chrome/browser/ui/webui/settings/settings_localized_strings_provider.cc.orig	2020-07-08 21:41:47.000000000 +0000
+++ chrome/browser/ui/webui/settings/settings_localized_strings_provider.cc
@@ -332,7 +332,7 @@ void AddAppearanceStrings(content::WebUI
     {"minimumFont", IDS_SETTINGS_MINIMUM_FONT_SIZE_LABEL},
     {"tiny", IDS_SETTINGS_TINY_FONT_SIZE},
     {"huge", IDS_SETTINGS_HUGE_FONT_SIZE},
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
     {"systemTheme", IDS_SETTINGS_SYSTEM_THEME},
     {"useSystemTheme", IDS_SETTINGS_USE_SYSTEM_THEME},
     {"classicTheme", IDS_SETTINGS_CLASSIC_THEME},
