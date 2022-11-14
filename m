Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD30628C82
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:59:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE48020668; Mon, 14 Nov 2022 22:59:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:59:52 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B6B0D20545
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o0dpE9F1k94P for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8EB5B2067F
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqtLdpC7jr3RPefbhddIZHtvto4i7zggFcSyTawLmP8=;
	b=eCUDFwrLE+lVMaDlBxRubnalp/e4ORMsNgtSIpcV7RqYgbHA7JquVaFPojj7ix2tVB5Sd+
	5aY+z3NmSvi6QI8hV7CoOucdtnU+rsKxyxKV/2B46pK8vUo5qMOGjaQZlHupmUpSFF/NsC
	Lr02iR+CMolsU4MrVjnYdjZmwkipU7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-zaxqkZMiOoyig7r9wsVf2w-1; Mon, 14 Nov 2022 17:52:14 -0500
X-MC-Unique: zaxqkZMiOoyig7r9wsVf2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6DBB1C08985;
	Mon, 14 Nov 2022 22:52:13 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 711B240E9786;
	Mon, 14 Nov 2022 22:52:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 21/23] api: Add nbd_can_block_status_payload()
Date: Mon, 14 Nov 2022 16:51:56 -0600
Message-Id: <20221114225158.2186742-22-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iW3Zn0KffJK.A.QnB.ohscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2261
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-22-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:59:52 +0000 (UTC)

In the recent NBD protocol extensions to add 64-bit commands, an
additional option was added to allow NBD_CMD_BLOCK_STATUS pass a
client payload instructing the server to filter its answers (mainly
useful when the client requests more than one meta context with
NBD_OPT_SET_META_CONTEXT).  This patch lays the groundwork by exposing
servers that advertise this capability, although libnbd does not yet
actually utilize it until the next patch.

At the time this patch was written, qemu-nbd was also patched to
provide such support; hence, an interop/ test shows the API in action.
---
 info/nbdinfo.pod                |  10 ++-
 lib/nbd-protocol.h              |  29 +++++---
 generator/API.ml                |  18 +++++
 lib/flags.c                     |  11 +++
 examples/server-flags.c         |   7 +-
 interop/Makefile.am             |   6 ++
 interop/block-status-payload.c  | 126 ++++++++++++++++++++++++++++++++
 interop/block-status-payload.sh |  68 +++++++++++++++++
 .gitignore                      |   1 +
 info/can.c                      |   5 ++
 info/show.c                     |   9 ++-
 11 files changed, 273 insertions(+), 17 deletions(-)
 create mode 100644 interop/block-status-payload.c
 create mode 100755 interop/block-status-payload.sh

diff --git a/info/nbdinfo.pod b/info/nbdinfo.pod
index 2455e1c0..c3a97c3b 100644
--- a/info/nbdinfo.pod
+++ b/info/nbdinfo.pod
@@ -178,6 +178,8 @@ rotating disk: accessing nearby blocks may be faster than random
 access and requests should be sorted to improve performance.  Many
 servers do not or cannot report this accurately.

+=item nbdinfo --can block-status-payload URI
+
 =item nbdinfo --can cache URI

 =item nbdinfo --can df URI
@@ -345,10 +347,10 @@ The command does not print anything.  Instead it exits with success

 For further information see the L<NBD
 protocol|https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md>
-and the following libnbd functions: L<nbd_can_cache(3)>,
-L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>, L<nbd_can_flush(3)>,
-L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>, L<nbd_can_trim(3)>,
-L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
+and the following libnbd functions: L<nbd_can_block_status_payload(3)>,
+L<nbd_can_cache(3)>, L<nbd_can_df(3)>, L<nbd_can_fast_zero(3)>,
+L<nbd_can_flush(3)>, L<nbd_can_fua(3)>, L<nbd_can_multi_conn(3)>,
+L<nbd_can_trim(3)>, L<nbd_can_zero(3)>, L<nbd_is_read_only(3)>,
 L<nbd_get_structured_replies_negotiated(3)>,
 L<nbd_get_extended_headers_negotiated(3)>.

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index ac569a11..2d1fabd0 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -102,17 +102,18 @@ struct nbd_fixed_new_option_reply {
 #define NBD_FLAG_NO_ZEROES         (1 << 1)

 /* Per-export flags. */
-#define NBD_FLAG_HAS_FLAGS         (1 << 0)
-#define NBD_FLAG_READ_ONLY         (1 << 1)
-#define NBD_FLAG_SEND_FLUSH        (1 << 2)
-#define NBD_FLAG_SEND_FUA          (1 << 3)
-#define NBD_FLAG_ROTATIONAL        (1 << 4)
-#define NBD_FLAG_SEND_TRIM         (1 << 5)
-#define NBD_FLAG_SEND_WRITE_ZEROES (1 << 6)
-#define NBD_FLAG_SEND_DF           (1 << 7)
-#define NBD_FLAG_CAN_MULTI_CONN    (1 << 8)
-#define NBD_FLAG_SEND_CACHE        (1 << 10)
-#define NBD_FLAG_SEND_FAST_ZERO    (1 << 11)
+#define NBD_FLAG_HAS_FLAGS            (1 << 0)
+#define NBD_FLAG_READ_ONLY            (1 << 1)
+#define NBD_FLAG_SEND_FLUSH           (1 << 2)
+#define NBD_FLAG_SEND_FUA             (1 << 3)
+#define NBD_FLAG_ROTATIONAL           (1 << 4)
+#define NBD_FLAG_SEND_TRIM            (1 << 5)
+#define NBD_FLAG_SEND_WRITE_ZEROES    (1 << 6)
+#define NBD_FLAG_SEND_DF              (1 << 7)
+#define NBD_FLAG_CAN_MULTI_CONN       (1 << 8)
+#define NBD_FLAG_SEND_CACHE           (1 << 10)
+#define NBD_FLAG_SEND_FAST_ZERO       (1 << 11)
+#define NBD_FLAG_BLOCK_STATUS_PAYLOAD (1 << 12)

 /* NBD options (new style handshake only). */
 #define NBD_OPT_EXPORT_NAME        1
@@ -204,6 +205,12 @@ struct nbd_request_ext {
   uint64_t count;               /* Request effect or payload length. */
 } NBD_ATTRIBUTE_PACKED;

+/* Extended request payload for NBD_CMD_BLOCK_STATUS, when supported. */
+struct nbd_block_status_payload {
+  uint64_t length;              /* Effective length of client request */
+  /* followed by array of uint32_t ids */
+} NBD_ATTRIBUTE_PACKED;
+
 /* Simple reply (server -> client). */
 struct nbd_simple_reply {
   uint32_t magic;               /* NBD_SIMPLE_REPLY_MAGIC. */
diff --git a/generator/API.ml b/generator/API.ml
index c4d15e3a..bbf7c0bb 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -2279,6 +2279,23 @@   "can_fast_zero", {
     example = Some "examples/server-flags.c";
   };

+  "can_block_status_payload", {
+    default_call with
+    args = []; ret = RBool;
+    permitted_states = [ Negotiating; Connected; Closed ];
+    shortdesc = "does the server support the block status payload flag?";
+    longdesc = "\
+Returns true if the server supports the use of the
+C<LIBNBD_CMD_FLAG_PAYLOAD_LEN> flag to allow filtering of the
+block status command.  Returns
+false if the server does not.  Note that this will never return
+true if L<nbd_get_extended_headers_negotiated(3)> is false."
+^ non_blocking_test_call_description;
+    see_also = [SectionLink "Flag calls"; Link "opt_info";
+                Link "get_extended_headers_negotiated"];
+    example = Some "examples/server-flags.c";
+  };
+
   "can_df", {
     default_call with
     args = []; ret = RBool;
@@ -4131,6 +4148,7 @@ let first_version =
   "get_extended_headers_negotiated", (1, 16);
   "opt_extended_headers", (1, 16);
   "aio_opt_extended_headers", (1, 16);
+  "can_block_status_payload", (1, 16);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/lib/flags.c b/lib/flags.c
index eaf4ff85..7d3ce4c7 100644
--- a/lib/flags.c
+++ b/lib/flags.c
@@ -66,6 +66,11 @@ nbd_internal_set_size_and_flags (struct nbd_handle *h,
     eflags &= ~NBD_FLAG_SEND_DF;
   }

+  if (eflags & NBD_FLAG_BLOCK_STATUS_PAYLOAD && !h->extended_headers) {
+    debug (h, "server lacks extended headers, ignoring claim of block status payload");
+    eflags &= ~NBD_FLAG_BLOCK_STATUS_PAYLOAD;
+  }
+
   if (eflags & NBD_FLAG_SEND_FAST_ZERO &&
       !(eflags & NBD_FLAG_SEND_WRITE_ZEROES)) {
     debug (h, "server lacks write zeroes, ignoring claim of fast zero");
@@ -213,6 +218,12 @@ nbd_unlocked_can_cache (struct nbd_handle *h)
   return get_flag (h, NBD_FLAG_SEND_CACHE);
 }

+int
+nbd_unlocked_can_block_status_payload (struct nbd_handle *h)
+{
+  return get_flag (h, NBD_FLAG_BLOCK_STATUS_PAYLOAD);
+}
+
 int
 nbd_unlocked_can_meta_context (struct nbd_handle *h, const char *name)
 {
diff --git a/examples/server-flags.c b/examples/server-flags.c
index d156aced..c826f146 100644
--- a/examples/server-flags.c
+++ b/examples/server-flags.c
@@ -78,8 +78,13 @@ main (int argc, char *argv[])
   PRINT_FLAG (nbd_can_multi_conn);
   PRINT_FLAG (nbd_can_trim);
   PRINT_FLAG (nbd_can_zero);
-#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO /* Added in 1.2 */
+#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO
+  /* Added in 1.2 */
   PRINT_FLAG (nbd_can_fast_zero);
+#endif
+#if LIBNBD_HAVE_NBD_CAN_BLOCK_STATUS_PAYLOAD
+  /* Added in 1.16 */
+  PRINT_FLAG (nbd_can_block_status_payload);
 #endif
   PRINT_FLAG (nbd_is_read_only);
   PRINT_FLAG (nbd_is_rotational);
diff --git a/interop/Makefile.am b/interop/Makefile.am
index 84c8fbbb..8a7bb17e 100644
--- a/interop/Makefile.am
+++ b/interop/Makefile.am
@@ -27,6 +27,7 @@ EXTRA_DIST = \
 	list-exports-test-dir/disk2 \
 	structured-read.sh \
 	opt-extended-headers.sh \
+	block-status-payload.sh \
 	$(NULL)

 TESTS_ENVIRONMENT = \
@@ -138,6 +139,7 @@ check_PROGRAMS += \
 	large-status \
 	structured-read \
 	opt-extended-headers \
+	block-status-payload \
 	$(NULL)
 TESTS += \
 	interop-qemu-nbd \
@@ -150,6 +152,7 @@ TESTS += \
 	structured-read.sh \
 	interop-qemu-block-size.sh \
 	opt-extended-headers.sh \
+	block-status-payload.sh \
 	$(NULL)

 interop_qemu_nbd_SOURCES = \
@@ -247,6 +250,9 @@ structured_read_LDADD = $(top_builddir)/lib/libnbd.la
 opt_extended_headers_SOURCES = opt-extended-headers.c
 opt_extended_headers_LDADD = $(top_builddir)/lib/libnbd.la

+block_status_payload_SOURCES = block-status-payload.c
+block_status_payload_LDADD = $(top_builddir)/lib/libnbd.la
+
 endif HAVE_QEMU_NBD

 #----------------------------------------------------------------------
diff --git a/interop/block-status-payload.c b/interop/block-status-payload.c
new file mode 100644
index 00000000..cdb0de7c
--- /dev/null
+++ b/interop/block-status-payload.c
@@ -0,0 +1,126 @@
+/* NBD client library in userspace
+ * Copyright (C) 2013-2022 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/* Test interaction with qemu using block status payload filtering. */
+
+#include <config.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <assert.h>
+#include <stdbool.h>
+#include <errno.h>
+
+#include <libnbd.h>
+
+#include "array-size.h"
+
+static const char *contexts[] = {
+  "base:allocation",
+  "qemu:allocation-depth",
+  "qemu:dirty-bitmap:bitmap0",
+  "qemu:dirty-bitmap:bitmap1",
+};
+
+static int
+cb (void *opaque, const char *metacontext, uint64_t offset,
+    nbd_extent *entries, size_t len, int *error)
+{
+  /* Adjust seen according to which context was visited */
+  unsigned int *seen = opaque;
+  size_t i;
+
+  for (i = 0; i < ARRAY_SIZE (contexts); i++)
+    if (strcmp (contexts[i], metacontext) == 0)
+      break;
+  *seen |= 1 << i;
+  return 0;
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  int64_t exportsize;
+  unsigned int seen;
+  size_t i;
+  int r;
+
+  if (argc < 2) {
+    fprintf (stderr, "%s qemu-nbd [args ...]\n", argv[0]);
+    exit (EXIT_FAILURE);
+  }
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  assert (ARRAY_SIZE (contexts) == 4);
+  for (i = 0; i < ARRAY_SIZE (contexts); i++) {
+    if (nbd_add_meta_context (nbd, contexts[i]) == -1) {
+      fprintf (stderr, "%s\n", nbd_get_error ());
+      exit (EXIT_FAILURE);
+    }
+  }
+
+  if (nbd_connect_systemd_socket_activation (nbd, &argv[1]) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  r = nbd_can_block_status_payload (nbd);
+  if (r == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  if (r != 1) {
+    fprintf (stderr, "expecting block status payload support from qemu\n");
+    exit (EXIT_FAILURE);
+  }
+
+  exportsize = nbd_get_size (nbd);
+  if (exportsize == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* An unfiltered call should see all four contexts */
+  seen = 0;
+  if (nbd_block_status_64 (nbd, exportsize, 0,
+                           (nbd_extent64_callback) { .callback = cb,
+                                                     .user_data = &seen },
+                           0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (seen == 0xf);
+
+  /* FIXME: Test filtered calls once the API is added */
+  if (nbd_shutdown (nbd, 0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_close (nbd);
+
+  exit (EXIT_SUCCESS);
+}
diff --git a/interop/block-status-payload.sh b/interop/block-status-payload.sh
new file mode 100755
index 00000000..a178583b
--- /dev/null
+++ b/interop/block-status-payload.sh
@@ -0,0 +1,68 @@
+#!/usr/bin/env bash
+# nbd client library in userspace
+# Copyright (C) 2019-2022 Red Hat Inc.
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+# Test use of block status payload for server filtering
+
+source ../tests/functions.sh
+set -e
+set -x
+
+requires qemu-img bitmap --help
+# This test uses the qemu-nbd -A and -B options.
+requires qemu-nbd -A -BA --version
+
+file="block-status-payload.qcow2"
+rm -f $file
+cleanup_fn rm -f $file
+
+# Create sparse file with two bitmaps.
+qemu-img create -f qcow2 $file 1M
+qemu-img bitmap --add --enable -f qcow2 $file bitmap0
+qemu-img bitmap --add --enable -f qcow2 $file bitmap1
+
+# Unconditional part of test: qemu should not advertise block status payload
+# support if extended headers are not in use
+nbdsh -c '
+h.set_request_extended_headers(False)
+h.add_meta_context("base:allocation")
+h.add_meta_context("qemu:allocation-depth")
+h.add_meta_context("qemu:dirty-bitmap:bitmap0")
+h.add_meta_context("qemu:dirty-bitmap:bitmap1")
+h.set_opt_mode(True)
+args = ["qemu-nbd", "-f", "qcow2", "-A", "-B", "bitmap0", "-B", "bitmap1",
+        "'"$file"'"]
+h.connect_systemd_socket_activation(args)
+assert h.aio_is_negotiating() is True
+assert h.get_extended_headers_negotiated() is False
+# Flag not available until info or go
+try:
+  h.can_block_status_payload()
+  assert False
+except nbd.Error:
+  pass
+h.opt_info()
+assert h.can_block_status_payload() is False
+assert h.can_meta_context("base:allocation") is True
+h.opt_abort()
+'
+
+# Conditional part of test: if qemu is new enough to support extended
+# headers, we assume it can also support block status payload.
+requires nbdinfo --can extended-headers -- [ qemu-nbd -r -f qcow2 "$file" ]
+$VG ./block-status-payload \
+    qemu-nbd -f qcow2 -A -B bitmap0 -B bitmap1 $file
diff --git a/.gitignore b/.gitignore
index 67bcee58..a61aa00e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -96,6 +96,7 @@ Makefile.in
 /info/nbdinfo
 /info/nbdinfo.1
 /install-sh
+/interop/block-status-payload
 /interop/dirty-bitmap
 /interop/interop-nbd-server
 /interop/interop-nbd-server-tls
diff --git a/info/can.c b/info/can.c
index f602ffce..daa7d2af 100644
--- a/info/can.c
+++ b/info/can.c
@@ -72,6 +72,11 @@ do_can (void)
   else if (strcasecmp (can, "rotational") == 0)
     feature = nbd_is_rotational (nbd);

+  else if (strcasecmp (can, "block status payload") == 0 ||
+           strcasecmp (can, "block-status-payload") == 0 ||
+           strcasecmp (can, "block_status_payload") == 0)
+    feature = nbd_can_block_status_payload (nbd);
+
   else if (strcasecmp (can, "cache") == 0)
     feature = nbd_can_cache (nbd);

diff --git a/info/show.c b/info/show.c
index 4bf59671..113b1b50 100644
--- a/info/show.c
+++ b/info/show.c
@@ -54,7 +54,7 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
   char *uri = NULL;
   int is_rotational, is_read_only;
   int can_cache, can_df, can_fast_zero, can_flush, can_fua,
-    can_multi_conn, can_trim, can_zero;
+    can_multi_conn, can_trim, can_zero, can_block_status_payload;
   int64_t block_minimum, block_preferred, block_maximum;
   string_vector contexts = empty_vector;
   bool show_context = false;
@@ -120,6 +120,7 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
   can_multi_conn = nbd_can_multi_conn (nbd);
   can_trim = nbd_can_trim (nbd);
   can_zero = nbd_can_zero (nbd);
+  can_block_status_payload = nbd_can_block_status_payload (nbd);
   block_minimum = nbd_get_block_size (nbd, LIBNBD_SIZE_MINIMUM);
   block_preferred = nbd_get_block_size (nbd, LIBNBD_SIZE_PREFERRED);
   block_maximum = nbd_get_block_size (nbd, LIBNBD_SIZE_MAXIMUM);
@@ -161,6 +162,8 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
     if (is_read_only >= 0)
       fprintf (fp, "\t%s: %s\n", "is_read_only",
                is_read_only ? "true" : "false");
+    if (can_block_status_payload >= 0)
+      show_boolean ("can_block_status_payload", can_block_status_payload);
     if (can_cache >= 0)
       show_boolean ("can_cache", can_cache);
     if (can_df >= 0)
@@ -230,6 +233,10 @@ show_one_export (struct nbd_handle *nbd, const char *desc,
     if (is_read_only >= 0)
       fprintf (fp, "\t\"%s\": %s,\n",
               "is_read_only", is_read_only ? "true" : "false");
+    if (can_block_status_payload >= 0)
+      fprintf (fp, "\t\"%s\": %s,\n",
+              "can_block_status_payload",
+               can_block_status_payload ? "true" : "false");
     if (can_cache >= 0)
       fprintf (fp, "\t\"%s\": %s,\n",
               "can_cache", can_cache ? "true" : "false");
-- 
2.38.1

