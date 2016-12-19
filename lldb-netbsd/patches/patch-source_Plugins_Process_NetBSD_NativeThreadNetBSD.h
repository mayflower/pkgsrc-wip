$NetBSD$

--- source/Plugins/Process/NetBSD/NativeThreadNetBSD.h.orig	2016-12-17 13:23:23.784994923 +0000
+++ source/Plugins/Process/NetBSD/NativeThreadNetBSD.h
@@ -0,0 +1,103 @@
+//===-- NativeThreadNetBSD.h ----------------------------------- -*- C++ -*-===//
+//
+//                     The LLVM Compiler Infrastructure
+//
+// This file is distributed under the University of Illinois Open Source
+// License. See LICENSE.TXT for details.
+//
+//===----------------------------------------------------------------------===//
+
+#ifndef liblldb_NativeThreadNetBSD_H_
+#define liblldb_NativeThreadNetBSD_H_
+
+#include "lldb/Host/common/NativeThreadProtocol.h"
+#include "lldb/lldb-private-forward.h"
+
+#include <sched.h>
+
+#include <map>
+#include <memory>
+#include <string>
+
+namespace lldb_private {
+namespace process_netbsd {
+
+class NativeProcessNetBSD;
+
+class NativeThreadNetBSD : public NativeThreadProtocol {
+  friend class NativeProcessNetBSD;
+
+public:
+  NativeThreadNetBSD(NativeProcessNetBSD *process, lldb::tid_t tid);
+
+  // ---------------------------------------------------------------------
+  // NativeThreadProtocol Interface
+  // ---------------------------------------------------------------------
+  std::string GetName() override;
+
+  lldb::StateType GetState() override;
+
+  bool GetStopReason(ThreadStopInfo &stop_info,
+                     std::string &description) override;
+
+  NativeRegisterContextSP GetRegisterContext() override;
+
+private:
+  // ---------------------------------------------------------------------
+  // Interface for friend classes
+  // ---------------------------------------------------------------------
+
+  /// Resumes the thread.  If @p signo is anything but
+  /// LLDB_INVALID_SIGNAL_NUMBER, deliver that signal to the thread.
+  Error Resume(uint32_t signo);
+
+  /// Single steps the thread.  If @p signo is anything but
+  /// LLDB_INVALID_SIGNAL_NUMBER, deliver that signal to the thread.
+  Error SingleStep(uint32_t signo);
+
+  void SetStoppedBySignal(uint32_t signo, const siginfo_t *info = nullptr);
+
+  /// Return true if the thread is stopped.
+  /// If stopped by a signal, indicate the signo in the signo argument.
+  /// Otherwise, return LLDB_INVALID_SIGNAL_NUMBER.
+  bool IsStopped(int *signo);
+
+  void SetStoppedByExec();
+
+  void SetStoppedByBreakpoint();
+
+  bool IsStoppedAtBreakpoint();
+
+  void SetStoppedByTrace();
+
+  void SetStoppedWithNoReason();
+
+  void SetExited();
+
+  // ---------------------------------------------------------------------
+  // Private interface
+  // ---------------------------------------------------------------------
+  void MaybeLogStateChange(lldb::StateType new_state);
+
+  NativeProcessNetBSD &GetProcess();
+
+  void SetStopped();
+
+  inline void MaybePrepareSingleStepWorkaround();
+
+  inline void MaybeCleanupSingleStepWorkaround();
+
+  // ---------------------------------------------------------------------
+  // Member Variables
+  // ---------------------------------------------------------------------
+  lldb::StateType m_state;
+  ThreadStopInfo m_stop_info;
+  NativeRegisterContextSP m_reg_context_sp;
+  std::string m_stop_description;
+};
+
+typedef std::shared_ptr<NativeThreadNetBSD> NativeThreadNetBSDSP;
+} // namespace process_netbsd
+} // namespace lldb_private
+
+#endif // #ifndef liblldb_NativeThreadNetBSD_H_
