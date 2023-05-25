Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470A710CDE
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6396820633; Thu, 25 May 2023 13:02:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:07 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C81020481
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xPn9BFJWpZPj for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3D648204C2
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PFBq4xhG8E8UF3Nab7KtMAQud83Osq6Qhfl/VESaOz8=;
	b=Pmhw5//kuXBYtRnqdSehmdvelT8vFatd2wq7VHev8F11Xu+QYDG+NCiK+3DJtjaldzH20A
	zRJv7+o7BsSqbBgkpuVwLQuP4homfCvHzM+O0LJOtWtpvbFscgarpQf2GLn2x1Anj9SUIF
	jqhnHGPlYzc7LeHaC9SMNde5M5dyJv8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-euij54R5MgqH0-8iKZTsJg-1; Thu, 25 May 2023 09:01:19 -0400
X-MC-Unique: euij54R5MgqH0-8iKZTsJg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B906E382C981;
	Thu, 25 May 2023 13:01:18 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 661A6492B0A;
	Thu, 25 May 2023 13:01:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 20/22] interop: Add test of 64-bit block status
Date: Thu, 25 May 2023 08:01:06 -0500
Message-Id: <20230525130108.757242-21-eblake@redhat.com>
In-Reply-To: <20230525130108.757242-1-eblake@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <21kiGaX0J0J.A.6sF.Px1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2482
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-21-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:07 +0000 (UTC)

Prove that we can round-trip a block status request larger than 4G
through a new-enough qemu-nbd.  Also serves as a unit test of our shim
for converting internal 64-bit representation back to the older 32-bit
nbd_block_status callback interface.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 interop/Makefile.am     |   6 ++
 interop/large-status.c  | 186 ++++++++++++++++++++++++++++++++++++++++
 interop/large-status.sh |  49 +++++++++++
 .gitignore              |   1 +
 4 files changed, 242 insertions(+)
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh

diff --git a/interop/Makefile.am b/interop/Makefile.am
index 3f81df0c..9a7a5967 100644
--- a/interop/Makefile.am
+++ b/interop/Makefile.am
@@ -21,6 +21,7 @@ EXTRA_DIST = \
 	dirty-bitmap.sh \
 	interop-qemu-storage-daemon.sh \
 	interop-qemu-block-size.sh \
+	large-status.sh \
 	list-exports-nbd-config \
 	list-exports-test-dir/disk1 \
 	list-exports-test-dir/disk2 \
@@ -134,6 +135,7 @@ check_PROGRAMS += \
 	list-exports-qemu-nbd \
 	socket-activation-qemu-nbd \
 	dirty-bitmap \
+	large-status \
 	structured-read \
 	opt-extended-headers \
 	$(NULL)
@@ -144,6 +146,7 @@ TESTS += \
 	list-exports-qemu-nbd \
 	socket-activation-qemu-nbd \
 	dirty-bitmap.sh \
+	large-status.sh \
 	structured-read.sh \
 	interop-qemu-block-size.sh \
 	opt-extended-headers.sh \
@@ -235,6 +238,9 @@ socket_activation_qemu_nbd_LDADD = $(top_builddir)/lib/libnbd.la
 dirty_bitmap_SOURCES = dirty-bitmap.c
 dirty_bitmap_LDADD = $(top_builddir)/lib/libnbd.la

+large_status_SOURCES = large-status.c
+large_status_LDADD = $(top_builddir)/lib/libnbd.la
+
 structured_read_SOURCES = structured-read.c
 structured_read_LDADD = $(top_builddir)/lib/libnbd.la

diff --git a/interop/large-status.c b/interop/large-status.c
new file mode 100644
index 00000000..36415653
--- /dev/null
+++ b/interop/large-status.c
@@ -0,0 +1,186 @@
+/* NBD client library in userspace
+ * Copyright Red Hat
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
+/* Test 64-bit block status with qemu. */
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
+static const char *bitmap;
+
+struct data {
+  bool req_one;    /* input: true if req_one was passed to request */
+  int count;       /* input: count of expected remaining calls */
+  bool seen_base;  /* output: true if base:allocation encountered */
+  bool seen_dirty; /* output: true if qemu:dirty-bitmap encountered */
+};
+
+static int
+cb32 (void *opaque, const char *metacontext, uint64_t offset,
+      uint32_t *entries, size_t len, int *error)
+{
+  struct data *data = opaque;
+
+  assert (offset == 0);
+  assert (data->count-- > 0);
+
+  if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) == 0) {
+    assert (!data->seen_base);
+    data->seen_base = true;
+
+    /* Data block offset 0 size 64k, remainder is hole */
+    assert (len == 4);
+    assert (entries[0] == 65536);
+    assert (entries[1] == 0);
+    /* libnbd had to truncate qemu's >4G answer */
+    assert (entries[2] == 4227858432);
+    assert (entries[3] == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+  }
+  else if (strcmp (metacontext, bitmap) == 0) {
+    assert (!data->seen_dirty);
+    data->seen_dirty = true;
+
+    /* Dirty block at offset 5G-64k, remainder is clean */
+    /* libnbd had to truncate qemu's >4G answer */
+    assert (len == 2);
+    assert (entries[0] == 4227858432);
+    assert (entries[1] == 0);
+  }
+  else {
+    fprintf (stderr, "unexpected context %s\n", metacontext);
+    exit (EXIT_FAILURE);
+  }
+  return 0;
+}
+
+static int
+cb64 (void *opaque, const char *metacontext, uint64_t offset,
+      nbd_extent *entries, size_t len, int *error)
+{
+  struct data *data = opaque;
+
+  assert (offset == 0);
+  assert (data->count-- > 0);
+
+  if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) == 0) {
+    assert (!data->seen_base);
+    data->seen_base = true;
+
+    /* Data block offset 0 size 64k, remainder is hole */
+    assert (len == 2);
+    assert (entries[0].length == 65536);
+    assert (entries[0].flags == 0);
+    assert (entries[1].length == 5368643584ULL);
+    assert (entries[1].flags == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+  }
+  else if (strcmp (metacontext, bitmap) == 0) {
+    assert (!data->seen_dirty);
+    data->seen_dirty = true;
+
+    /* Dirty block at offset 5G-64k, remainder is clean */
+    assert (len == 2);
+    assert (entries[0].length == 5368643584ULL);
+    assert (entries[0].flags == 0);
+    assert (entries[1].length == 65536);
+    assert (entries[1].flags == 1);
+  }
+  else {
+    fprintf (stderr, "unexpected context %s\n", metacontext);
+    exit (EXIT_FAILURE);
+  }
+  return 0;
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  int64_t exportsize;
+  struct data data;
+
+  if (argc < 3) {
+    fprintf (stderr, "%s bitmap qemu-nbd [args ...]\n", argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  bitmap = argv[1];
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_add_meta_context (nbd, LIBNBD_CONTEXT_BASE_ALLOCATION);
+  nbd_add_meta_context (nbd, bitmap);
+
+  if (nbd_connect_systemd_socket_activation (nbd, &argv[2]) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  exportsize = nbd_get_size (nbd);
+  if (exportsize == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  if (nbd_get_extended_headers_negotiated (nbd) != 1) {
+    fprintf (stderr, "skipping: qemu-nbd lacks extended headers\n");
+    exit (77);
+  }
+
+  /* Prove that we can round-trip a >4G block status request */
+  data = (struct data) { .count = 2, };
+  if (nbd_block_status_64 (nbd, exportsize, 0,
+                           (nbd_extent64_callback) { .callback = cb64,
+                             .user_data = &data },
+                           0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (data.seen_base && data.seen_dirty);
+
+  /* Check libnbd's handling of a >4G response through older interface  */
+  data = (struct data) { .count = 2, };
+  if (nbd_block_status (nbd, exportsize, 0,
+                        (nbd_extent_callback) { .callback = cb32,
+                          .user_data = &data },
+                        0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+  assert (data.seen_base && data.seen_dirty);
+
+  if (nbd_shutdown (nbd, 0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_close (nbd);
+
+  exit (EXIT_SUCCESS);
+}
diff --git a/interop/large-status.sh b/interop/large-status.sh
new file mode 100755
index 00000000..46810dc3
--- /dev/null
+++ b/interop/large-status.sh
@@ -0,0 +1,49 @@
+#!/usr/bin/env bash
+# nbd client library in userspace
+# Copyright Red Hat
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
+# Test reading qemu dirty-bitmap.
+
+source ../tests/functions.sh
+set -e
+set -x
+
+requires qemu-img bitmap --help
+requires qemu-nbd --version
+
+# This test uses the qemu-nbd -B option.
+if ! qemu-nbd --help | grep -sq -- -B; then
+    echo "$0: skipping because qemu-nbd does not support the -B option"
+    exit 77
+fi
+
+files="large-status.qcow2"
+rm -f $files
+cleanup_fn rm -f $files
+
+# Create mostly-sparse file with intentionally different data vs. dirty areas
+# (64k data, 5G-64k hole,zero; 5G-64k clean, 64k dirty)
+qemu-img create -f qcow2 large-status.qcow2 5G
+qemu-img bitmap --add --enable -f qcow2 large-status.qcow2 bitmap0
+qemu-io -f qcow2 -c "w -z $((5*1024*1024*1024 - 64*1024)) 64k" \
+        large-status.qcow2
+qemu-img bitmap --disable -f qcow2 large-status.qcow2 bitmap0
+qemu-io -f qcow2 -c 'w 0 64k' large-status.qcow2
+
+# Run the test.
+$VG ./large-status qemu:dirty-bitmap:bitmap0 \
+    qemu-nbd -f qcow2 -B bitmap0 large-status.qcow2
diff --git a/.gitignore b/.gitignore
index 24642748..fd81357b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -114,6 +114,7 @@ Makefile.in
 /interop/interop-qemu-nbd
 /interop/interop-qemu-nbd-tls-certs
 /interop/interop-qemu-nbd-tls-psk
+/interop/large-status
 /interop/list-exports-nbd-server
 /interop/list-exports-nbdkit
 /interop/list-exports-qemu-nbd
-- 
2.40.1

