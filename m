Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A93DB710CD9
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8937C20630; Thu, 25 May 2023 13:01:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:01:43 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 0AC13204B0
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:23 +0000 (UTC)
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
	with ESMTP id lDF_IB20ZmXZ for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:18 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id E985020471
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FbYJ9VFCZqdoV/cnyCEGpKPF2XpVaITfAgkqmU7cX8=;
	b=cSjixAKoXLFrIPcU+CkxZfvibsnpzLMh8U68PHpkkEf2vSvOrZpA0gyvE0nc+ZQUFept+p
	QPc9/jzeB94qDZTKcKr4kGqLFVnV/L10k8XIxCTjXBjGjk2ESYn1lsPOxDyC7EL97UHorz
	18inot3MRy1w54fCfCPUF4GT481bZBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-HpJv4tUbPfiRlnY_eOdFlg-1; Thu, 25 May 2023 09:01:11 -0400
X-MC-Unique: HpJv4tUbPfiRlnY_eOdFlg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF8D85A5BE;
	Thu, 25 May 2023 13:01:10 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A289492B0A;
	Thu, 25 May 2023 13:01:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 04/22] states: Prepare to send 64-bit requests
Date: Thu, 25 May 2023 08:00:50 -0500
Message-Id: <20230525130108.757242-5-eblake@redhat.com>
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
Resent-Message-ID: <ASw5E9jVAJN.A.YVC.3w1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2478
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-5-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:01:43 +0000 (UTC)

Support sending 64-bit requests if extended headers were negotiated.
This includes setting NBD_CMD_FLAG_PAYLOAD_LEN any time we send an
extended NBD_CMD_WRITE; this is such a fundamental part of the
protocol that for now it is easier to silently ignore whatever value
the user passes in for that bit in the flags parameter of nbd_pwrite
regardless of the current settings in set_strict_mode, rather than
trying to force the user to pass in the correct value to match whether
extended mode is negotiated.  However, when we later add APIs to give
the user more control for interoperability testing, it may be worth
adding a new set_strict_mode control knob to explicitly enable the
client to intentionally violate the protocol (the testsuite added in
this patch would then be updated to match).

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).

Support for using FLAG_PAYLOAD_LEN with NBD_CMD_BLOCK_STATUS is less
fundamental, and deserves to be in its own patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  10 ++-
 generator/API.ml                    |  20 +++--
 generator/states-issue-command.c    |  29 ++++---
 generator/states-reply-structured.c |   2 +-
 lib/rw.c                            |  17 +++--
 tests/Makefile.am                   |   4 +
 tests/pwrite-extended.c             | 112 ++++++++++++++++++++++++++++
 .gitignore                          |   1 +
 8 files changed, 169 insertions(+), 26 deletions(-)
 create mode 100644 tests/pwrite-extended.c

diff --git a/lib/internal.h b/lib/internal.h
index c71980ef..8a5f93d4 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -110,6 +110,9 @@ struct nbd_handle {
   char *tls_username;           /* Username, NULL = use current username */
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

+  /* Extended headers. */
+  bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */
+
   /* Desired metadata contexts. */
   bool request_sr;
   bool request_meta;
@@ -263,7 +266,10 @@ struct nbd_handle {
   /* Issuing a command must use a buffer separate from sbuf, for the
    * case when we interrupt a request to service a reply.
    */
-  struct nbd_request request;
+  union {
+    struct nbd_request compact;
+    struct nbd_request_ext extended;
+  } req;
   bool in_write_payload;
   bool in_write_shutdown;

@@ -364,7 +370,7 @@ struct command {
   uint16_t type;
   uint64_t cookie;
   uint64_t offset;
-  uint32_t count;
+  uint64_t count;
   void *data; /* Buffer for read/write */
   struct command_cb cb;
   bool initialized; /* For read, true if getting a hole may skip memset */
diff --git a/generator/API.ml b/generator/API.ml
index 5fcb0e1f..02c1260d 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -198,11 +198,12 @@ let cmd_flags =
   flag_prefix = "CMD_FLAG";
   guard = Some "((h->strict & LIBNBD_STRICT_FLAGS) || flags > UINT16_MAX)";
   flags = [
-    "FUA",       1 lsl 0;
-    "NO_HOLE",   1 lsl 1;
-    "DF",        1 lsl 2;
-    "REQ_ONE",   1 lsl 3;
-    "FAST_ZERO", 1 lsl 4;
+    "FUA",         1 lsl 0;
+    "NO_HOLE",     1 lsl 1;
+    "DF",          1 lsl 2;
+    "REQ_ONE",     1 lsl 3;
+    "FAST_ZERO",   1 lsl 4;
+    "PAYLOAD_LEN", 1 lsl 5;
   ]
 }
 let handshake_flags = {
@@ -2507,7 +2508,7 @@   "pread_structured", {
   "pwrite", {
     default_call with
     args = [ BytesIn ("buf", "count"); UInt64 "offset" ];
-    optargs = [ OFlags ("flags", cmd_flags, Some ["FUA"]) ];
+    optargs = [ OFlags ("flags", cmd_flags, Some ["FUA"; "PAYLOAD_LEN"]) ];
     ret = RErr;
     permitted_states = [ Connected ];
     shortdesc = "write to the NBD server";
@@ -2530,7 +2531,10 @@   "pwrite", {
 C<LIBNBD_CMD_FLAG_FUA> meaning that the server should not
 return until the data has been committed to permanent storage
 (if that is supported - some servers cannot do this, see
-L<nbd_can_fua(3)>)."
+L<nbd_can_fua(3)>).  For convenience, libnbd ignores the presence
+or absence of the flag C<LIBNBD_CMD_FLAG_PAYLOAD_LEN> in C<flags>,
+while correctly using the flag over the wire according to whether
+extended headers were negotiated."
 ^ strict_call_description;
     see_also = [Link "can_fua"; Link "is_read_only";
                 Link "aio_pwrite"; Link "get_block_size";
@@ -3220,7 +3224,7 @@   "aio_pwrite", {
     default_call with
     args = [ BytesPersistIn ("buf", "count"); UInt64 "offset" ];
     optargs = [ OClosure completion_closure;
-                OFlags ("flags", cmd_flags, Some ["FUA"]) ];
+                OFlags ("flags", cmd_flags, Some ["FUA"; "PAYLOAD_LEN"]) ];
     ret = RCookie;
     permitted_states = [ Connected ];
     shortdesc = "write to the NBD server";
diff --git a/generator/states-issue-command.c b/generator/states-issue-command.c
index 111e131c..79136b61 100644
--- a/generator/states-issue-command.c
+++ b/generator/states-issue-command.c
@@ -41,15 +41,24 @@  ISSUE_COMMAND.START:
     return 0;
   }

-  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
-  h->request.flags = htobe16 (cmd->flags);
-  h->request.type = htobe16 (cmd->type);
-  h->request.handle = htobe64 (cmd->cookie);
-  h->request.offset = htobe64 (cmd->offset);
-  h->request.count = htobe32 (cmd->count);
+  /* These fields are coincident between req.compact and req.extended */
+  h->req.compact.flags = htobe16 (cmd->flags);
+  h->req.compact.type = htobe16 (cmd->type);
+  h->req.compact.handle = htobe64 (cmd->cookie);
+  h->req.compact.offset = htobe64 (cmd->offset);
+  if (h->extended_headers) {
+    h->req.extended.magic = htobe32 (NBD_EXTENDED_REQUEST_MAGIC);
+    h->req.extended.count = htobe64 (cmd->count);
+    h->wlen = sizeof (h->req.extended);
+  }
+  else {
+    assert (cmd->count <= UINT32_MAX);
+    h->req.compact.magic = htobe32 (NBD_REQUEST_MAGIC);
+    h->req.compact.count = htobe32 (cmd->count);
+    h->wlen = sizeof (h->req.compact);
+  }
   h->chunks_sent++;
-  h->wbuf = &h->request;
-  h->wlen = sizeof (h->request);
+  h->wbuf = &h->req;
   if (cmd->type == NBD_CMD_WRITE || cmd->next)
     h->wflags = MSG_MORE;
   SET_NEXT_STATE (%SEND_REQUEST);
@@ -74,7 +83,7 @@  ISSUE_COMMAND.PREPARE_WRITE_PAYLOAD:

   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.compact.handle));
   if (cmd->type == NBD_CMD_WRITE) {
     h->wbuf = cmd->data;
     h->wlen = cmd->count;
@@ -120,7 +129,7 @@  ISSUE_COMMAND.FINISH:
   assert (!h->wlen);
   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.compact.handle));
   h->cmds_to_issue = cmd->next;
   if (h->cmds_to_issue_tail == cmd)
     h->cmds_to_issue_tail = NULL;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 6f96945a..df509216 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -34,7 +34,7 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
       offset + length > cmd->offset + cmd->count) {
     set_error (0, "range of structured reply is out of bounds, "
                "offset=%" PRIu64 ", cmd->offset=%" PRIu64 ", "
-               "length=%" PRIu32 ", cmd->count=%" PRIu32 ": "
+               "length=%" PRIu32 ", cmd->count=%" PRIu64 ": "
                "this is likely to be a bug in the NBD server",
                offset, cmd->offset, length, cmd->count);
     return false;
diff --git a/lib/rw.c b/lib/rw.c
index 3dc3499e..8b2bd4cc 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -223,13 +223,11 @@ nbd_internal_command_common (struct nbd_handle *h,
     }
     break;

-    /* Other commands are currently limited by the 32 bit field in the
-     * command structure on the wire, but in future we hope to support
-     * 64 bit values here with a change to the NBD protocol which is
-     * being discussed upstream.
+    /* Other commands are limited by the 32 bit field in the command
+     * structure on the wire, unless extended headers were negotiated.
      */
   default:
-    if (count > UINT32_MAX) {
+    if (!h->extended_headers && count > UINT32_MAX) {
       set_error (ERANGE, "request too large: maximum request size is %" PRIu32,
                  UINT32_MAX);
       goto err;
@@ -358,6 +356,15 @@ nbd_unlocked_aio_pwrite (struct nbd_handle *h, const void *buf,
       return -1;
     }
   }
+  /* It is more convenient to manage PAYLOAD_LEN by what was negotiated
+   * than to require the user to have to set it correctly.
+   * TODO: Add new h->strict bit to allow intentional protocol violation
+   * for interoperability testing.
+   */
+  if (h->extended_headers)
+    flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
+  else
+    flags &= ~LIBNBD_CMD_FLAG_PAYLOAD_LEN;

   SET_CALLBACK_TO_NULL (*completion);
   return nbd_internal_command_common (h, flags, NBD_CMD_WRITE, offset, count,
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 3a93251e..8b839bf5 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -232,6 +232,7 @@ check_PROGRAMS += \
 	closure-lifetimes \
 	pread-initialize \
 	socket-activation-name \
+  pwrite-extended \
 	$(NULL)

 TESTS += \
@@ -650,6 +651,9 @@ socket_activation_name_SOURCES = \
 	requires.h
 socket_activation_name_LDADD = $(top_builddir)/lib/libnbd.la

+pwrite_extended_SOURCES = pwrite-extended.c
+pwrite_extended_LDADD = $(top_builddir)/lib/libnbd.la
+
 #----------------------------------------------------------------------
 # Testing TLS support.

diff --git a/tests/pwrite-extended.c b/tests/pwrite-extended.c
new file mode 100644
index 00000000..f0b5a3f3
--- /dev/null
+++ b/tests/pwrite-extended.c
@@ -0,0 +1,112 @@
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
+/* Check behavior of pwrite with PAYLOAD_LEN flag for extended headers. */
+
+#include <config.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <sys/stat.h>
+
+#include <libnbd.h>
+
+static char *progname;
+static char buf[512];
+
+static void
+check (int experr, const char *prefix)
+{
+  const char *msg = nbd_get_error ();
+  int errnum = nbd_get_errno ();
+
+  fprintf (stderr, "error: \"%s\"\n", msg);
+  fprintf (stderr, "errno: %d (%s)\n", errnum, strerror (errnum));
+  if (strncmp (msg, prefix, strlen (prefix)) != 0) {
+    fprintf (stderr, "%s: test failed: missing context prefix: %s\n",
+             progname, msg);
+    exit (EXIT_FAILURE);
+  }
+  if (errnum != experr) {
+    fprintf (stderr, "%s: test failed: "
+             "expected errno = %d (%s), but got %d\n",
+             progname, experr, strerror (experr), errnum);
+    exit (EXIT_FAILURE);
+  }
+}
+
+int
+main (int argc, char *argv[])
+{
+  struct nbd_handle *nbd;
+  const char *cmd[] = {
+    "nbdkit", "-s", "-v", "--exit-with-parent", "memory", "1048576", NULL
+  };
+  uint32_t strict;
+
+  progname = argv[0];
+
+  nbd = nbd_create ();
+  if (nbd == NULL) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* Connect to the server. */
+  if (nbd_connect_command (nbd, (char **)cmd) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  /* FIXME: future API addition to test if server negotiated extended mode.
+   * Until then, strict flags must ignore the PAYLOAD_LEN flag for pwrite,
+   * even though it is rejected for other commands.
+   */
+  strict = nbd_get_strict_mode (nbd);
+  if (!(strict & LIBNBD_STRICT_FLAGS)) {
+    fprintf (stderr, "%s: test failed: "
+             "nbd_get_strict_mode did not have expected flag set\n",
+             argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  if (nbd_aio_pread (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
+                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) != -1) {
+    fprintf (stderr, "%s: test failed: "
+             "nbd_aio_pread did not fail with unexpected flag\n",
+             argv[0]);
+    exit (EXIT_FAILURE);
+  }
+  check (EINVAL, "nbd_aio_pread: ");
+
+  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
+                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
+    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }
+
+  nbd_close (nbd);
+  exit (EXIT_SUCCESS);
+}
diff --git a/.gitignore b/.gitignore
index fe7feffa..bc7c2c37 100644
--- a/.gitignore
+++ b/.gitignore
@@ -250,6 +250,7 @@ Makefile.in
 /tests/pki/
 /tests/pread-initialize
 /tests/private-data
+/tests/pwrite-extended
 /tests/read-only-flag
 /tests/read-write-flag
 /tests/server-death
-- 
2.40.1

