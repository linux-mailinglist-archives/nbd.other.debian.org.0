Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FF9B249
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:41:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F3659204FA; Fri, 23 Aug 2019 14:41:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:41:13 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4743A204E7
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:41:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OEm1w8xW9MSg for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 566F2204EF
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D2BE3090FC1;
	Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1D3E60126;
	Fri, 23 Aug 2019 14:40:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [nbdkit PATCH 1/3] server: Add internal support for NBDKIT_FLAG_FAST_ZERO
Date: Fri, 23 Aug 2019 09:40:52 -0500
Message-Id: <20190823144054.27420-2-eblake@redhat.com>
In-Reply-To: <20190823144054.27420-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823144054.27420-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2nOblF8hVh.A.f5C.Js_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/642
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823144054.27420-2-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:41:13 +0000 (UTC)

Qemu was able to demonstrate that knowing whether a zero operation is
fast is useful when copying from one image to another: there is a
choice between bulk pre-zeroing and then revisiting the data sections
(fewer transactions, but depends on the zeroing to be fast),
vs. visiting every portion of the disk only once (more transactions,
but no time lost to duplicated I/O due to slow zeroes).  As such, the
NBD protocol is adding an extension to allow clients to request fast
failure when zero is not efficient, from servers that advertise
support for the new flag.

In nbdkit, start by plumbing a new .can_fast_zero through the backends
(although it stays 0 in this patch, later patches will actually expose
it to plugins and filters to override).  Advertise the flag to the
client when the plugin provides a .can_fast_zero, and wire in passing
the flag down to .zero in the plugin.  In turn, if the flag is set and
the implementation .zero fails with ENOTSUP/EOPNOTSUPP, we no longer
attempt the .pwrite fallback.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/nbdkit-protocol.pod    | 11 +++++++++
 server/internal.h           |  2 ++
 common/protocol/protocol.h  | 11 +++++----
 server/filters.c            | 20 +++++++++++++---
 server/plugins.c            | 28 +++++++++++++++++++---
 server/protocol-handshake.c |  7 ++++++
 server/protocol.c           | 46 +++++++++++++++++++++++++++++--------
 include/nbdkit-common.h     |  7 +++---
 plugins/ocaml/ocaml.c       |  1 -
 plugins/sh/call.c           |  1 -
 10 files changed, 110 insertions(+), 24 deletions(-)

diff --git a/docs/nbdkit-protocol.pod b/docs/nbdkit-protocol.pod
index 35db07b3..76c50bb8 100644
--- a/docs/nbdkit-protocol.pod
+++ b/docs/nbdkit-protocol.pod
@@ -173,6 +173,17 @@ This protocol extension allows a client to inform the server about
 intent to access a portion of the export, to allow the server an
 opportunity to cache things appropriately.

+=item C<NBD_CMD_FLAG_FAST_ZERO>
+
+Supported in nbdkit E<ge> 1.13.9.
+
+This protocol extension allows a server to advertise that it can rank
+all zero requests as fast or slow, at which point the client can make
+fast zero requests which fail immediately with C<ENOTSUP> if the
+request is no faster than a counterpart write would be, while normal
+zero requests still benefit from compressed network traffic regardless
+of the time taken.
+
 =item Resize Extension

 I<Not supported>.
diff --git a/server/internal.h b/server/internal.h
index 22e13b6d..784c8b5c 100644
--- a/server/internal.h
+++ b/server/internal.h
@@ -168,6 +168,7 @@ struct connection {
   bool is_rotational;
   bool can_trim;
   bool can_zero;
+  bool can_fast_zero;
   bool can_fua;
   bool can_multi_conn;
   bool can_cache;
@@ -275,6 +276,7 @@ struct backend {
   int (*is_rotational) (struct backend *, struct connection *conn);
   int (*can_trim) (struct backend *, struct connection *conn);
   int (*can_zero) (struct backend *, struct connection *conn);
+  int (*can_fast_zero) (struct backend *, struct connection *conn);
   int (*can_extents) (struct backend *, struct connection *conn);
   int (*can_fua) (struct backend *, struct connection *conn);
   int (*can_multi_conn) (struct backend *, struct connection *conn);
diff --git a/common/protocol/protocol.h b/common/protocol/protocol.h
index e9386430..bf548390 100644
--- a/common/protocol/protocol.h
+++ b/common/protocol/protocol.h
@@ -96,6 +96,7 @@ extern const char *name_of_nbd_flag (int);
 #define NBD_FLAG_SEND_DF           (1 << 7)
 #define NBD_FLAG_CAN_MULTI_CONN    (1 << 8)
 #define NBD_FLAG_SEND_CACHE        (1 << 10)
+#define NBD_FLAG_SEND_FAST_ZERO    (1 << 11)

 /* NBD options (new style handshake only). */
 extern const char *name_of_nbd_opt (int);
@@ -223,10 +224,11 @@ extern const char *name_of_nbd_cmd (int);
 #define NBD_CMD_BLOCK_STATUS      7

 extern const char *name_of_nbd_cmd_flag (int);
-#define NBD_CMD_FLAG_FUA      (1<<0)
-#define NBD_CMD_FLAG_NO_HOLE  (1<<1)
-#define NBD_CMD_FLAG_DF       (1<<2)
-#define NBD_CMD_FLAG_REQ_ONE  (1<<3)
+#define NBD_CMD_FLAG_FUA       (1<<0)
+#define NBD_CMD_FLAG_NO_HOLE   (1<<1)
+#define NBD_CMD_FLAG_DF        (1<<2)
+#define NBD_CMD_FLAG_REQ_ONE   (1<<3)
+#define NBD_CMD_FLAG_FAST_ZERO (1<<4)

 /* Error codes (previously errno).
  * See http://git.qemu.org/?p=qemu.git;a=commitdiff;h=ca4414804114fd0095b317785bc0b51862e62ebb
@@ -239,6 +241,7 @@ extern const char *name_of_nbd_error (int);
 #define NBD_EINVAL     22
 #define NBD_ENOSPC     28
 #define NBD_EOVERFLOW  75
+#define NBD_ENOTSUP    95
 #define NBD_ESHUTDOWN 108

 #endif /* NBDKIT_PROTOCOL_H */
diff --git a/server/filters.c b/server/filters.c
index 14ca0cc6..0dd2393e 100644
--- a/server/filters.c
+++ b/server/filters.c
@@ -403,8 +403,11 @@ next_zero (void *nxdata, uint32_t count, uint64_t offset, uint32_t flags,
   int r;

   r = b_conn->b->zero (b_conn->b, b_conn->conn, count, offset, flags, err);
-  if (r == -1)
-    assert (*err && *err != ENOTSUP && *err != EOPNOTSUPP);
+  if (r == -1) {
+    assert (*err);
+    if (!(flags & NBDKIT_FLAG_FAST_ZERO))
+      assert (*err != ENOTSUP && *err != EOPNOTSUPP);
+  }
   return r;
 }

@@ -586,6 +589,15 @@ filter_can_zero (struct backend *b, struct connection *conn)
     return f->backend.next->can_zero (f->backend.next, conn);
 }

+static int
+filter_can_fast_zero (struct backend *b, struct connection *conn)
+{
+  struct backend_filter *f = container_of (b, struct backend_filter, backend);
+
+  debug ("%s: can_fast_zero", f->name);
+  return 0; /* Next patch will query or pass through */
+}
+
 static int
 filter_can_extents (struct backend *b, struct connection *conn)
 {
@@ -738,7 +750,8 @@ filter_zero (struct backend *b, struct connection *conn,
   void *handle = connection_get_handle (conn, f->backend.i);
   struct b_conn nxdata = { .b = f->backend.next, .conn = conn };

-  assert (!(flags & ~(NBDKIT_FLAG_MAY_TRIM | NBDKIT_FLAG_FUA)));
+  assert (!(flags & ~(NBDKIT_FLAG_MAY_TRIM | NBDKIT_FLAG_FUA |
+                      NBDKIT_FLAG_FAST_ZERO)));

   debug ("%s: zero count=%" PRIu32 " offset=%" PRIu64 " flags=0x%" PRIx32,
          f->name, count, offset, flags);
@@ -818,6 +831,7 @@ static struct backend filter_functions = {
   .is_rotational = filter_is_rotational,
   .can_trim = filter_can_trim,
   .can_zero = filter_can_zero,
+  .can_fast_zero = filter_can_fast_zero,
   .can_extents = filter_can_extents,
   .can_fua = filter_can_fua,
   .can_multi_conn = filter_can_multi_conn,
diff --git a/server/plugins.c b/server/plugins.c
index 34cc3cb5..c6dcf408 100644
--- a/server/plugins.c
+++ b/server/plugins.c
@@ -401,6 +401,16 @@ plugin_can_zero (struct backend *b, struct connection *conn)
   return plugin_can_write (b, conn);
 }

+static int
+plugin_can_fast_zero (struct backend *b, struct connection *conn)
+{
+  assert (connection_get_handle (conn, 0));
+
+  debug ("can_fast_zero");
+
+  return 0; /* Upcoming patch will actually add support. */
+}
+
 static int
 plugin_can_extents (struct backend *b, struct connection *conn)
 {
@@ -621,15 +631,18 @@ plugin_zero (struct backend *b, struct connection *conn,
   int r = -1;
   bool may_trim = flags & NBDKIT_FLAG_MAY_TRIM;
   bool fua = flags & NBDKIT_FLAG_FUA;
+  bool fast_zero = flags & NBDKIT_FLAG_FAST_ZERO;
   bool emulate = false;
   bool need_flush = false;
   int can_zero = 1; /* TODO cache this per-connection? */

   assert (connection_get_handle (conn, 0));
-  assert (!(flags & ~(NBDKIT_FLAG_MAY_TRIM | NBDKIT_FLAG_FUA)));
+  assert (!(flags & ~(NBDKIT_FLAG_MAY_TRIM | NBDKIT_FLAG_FUA |
+                      NBDKIT_FLAG_FAST_ZERO)));

-  debug ("zero count=%" PRIu32 " offset=%" PRIu64 " may_trim=%d fua=%d",
-         count, offset, may_trim, fua);
+  debug ("zero count=%" PRIu32 " offset=%" PRIu64
+         " may_trim=%d fua=%d fast_zero=%d",
+         count, offset, may_trim, fua, fast_zero);

   if (fua && plugin_can_fua (b, conn) != NBDKIT_FUA_NATIVE) {
     flags &= ~NBDKIT_FLAG_FUA;
@@ -643,6 +656,8 @@ plugin_zero (struct backend *b, struct connection *conn,
   }

   if (can_zero) {
+    /* if (!can_fast_zero) */
+    flags &= ~NBDKIT_FLAG_FAST_ZERO;
     errno = 0;
     if (p->plugin.zero)
       r = p->plugin.zero (connection_get_handle (conn, 0), count, offset,
@@ -658,6 +673,12 @@ plugin_zero (struct backend *b, struct connection *conn,
       goto done;
   }

+  if (fast_zero) {
+    assert (r == -1);
+    *err = EOPNOTSUPP;
+    goto done;
+  }
+
   assert (p->plugin.pwrite || p->plugin._pwrite_old);
   flags &= ~NBDKIT_FLAG_MAY_TRIM;
   threadlocal_set_error (0);
@@ -762,6 +783,7 @@ static struct backend plugin_functions = {
   .is_rotational = plugin_is_rotational,
   .can_trim = plugin_can_trim,
   .can_zero = plugin_can_zero,
+  .can_fast_zero = plugin_can_fast_zero,
   .can_extents = plugin_can_extents,
   .can_fua = plugin_can_fua,
   .can_multi_conn = plugin_can_multi_conn,
diff --git a/server/protocol-handshake.c b/server/protocol-handshake.c
index 0f3bd280..84fcacfd 100644
--- a/server/protocol-handshake.c
+++ b/server/protocol-handshake.c
@@ -66,6 +66,13 @@ protocol_compute_eflags (struct connection *conn, uint16_t *flags)
     if (fl) {
       eflags |= NBD_FLAG_SEND_WRITE_ZEROES;
       conn->can_zero = true;
+      fl = backend->can_fast_zero (backend, conn);
+      if (fl == -1)
+        return -1;
+      if (fl) {
+        eflags |= NBD_FLAG_SEND_FAST_ZERO;
+        conn->can_fast_zero = true;
+      }
     }

     fl = backend->can_trim (backend, conn);
diff --git a/server/protocol.c b/server/protocol.c
index 72f6f2a8..77a045dc 100644
--- a/server/protocol.c
+++ b/server/protocol.c
@@ -110,7 +110,8 @@ validate_request (struct connection *conn,

   /* Validate flags */
   if (flags & ~(NBD_CMD_FLAG_FUA | NBD_CMD_FLAG_NO_HOLE |
-                NBD_CMD_FLAG_DF | NBD_CMD_FLAG_REQ_ONE)) {
+                NBD_CMD_FLAG_DF | NBD_CMD_FLAG_REQ_ONE |
+                NBD_CMD_FLAG_FAST_ZERO)) {
     nbdkit_error ("invalid request: unknown flag (0x%x)", flags);
     *error = EINVAL;
     return false;
@@ -121,6 +122,21 @@ validate_request (struct connection *conn,
     *error = EINVAL;
     return false;
   }
+  if (flags & NBD_CMD_FLAG_FAST_ZERO) {
+    if (cmd != NBD_CMD_WRITE_ZEROES) {
+      nbdkit_error ("invalid request: "
+                    "FAST_ZERO flag needs WRITE_ZEROES request");
+      *error = EINVAL;
+      return false;
+    }
+    if (!conn->can_fast_zero) {
+      nbdkit_error ("invalid request: "
+                    "%s: fast zero support was not advertised",
+                    name_of_nbd_cmd (cmd));
+      *error = EINVAL;
+      return false;
+    }
+  }
   if (flags & NBD_CMD_FLAG_DF) {
     if (cmd != NBD_CMD_READ) {
       nbdkit_error ("invalid request: DF flag needs READ request");
@@ -297,8 +313,12 @@ handle_request (struct connection *conn,
       f |= NBDKIT_FLAG_MAY_TRIM;
     if (fua)
       f |= NBDKIT_FLAG_FUA;
+    if (flags & NBD_CMD_FLAG_FAST_ZERO)
+      f |= NBDKIT_FLAG_FAST_ZERO;
     if (backend->zero (backend, conn, count, offset, f, &err) == -1) {
-      assert (err && err != ENOTSUP && err != EOPNOTSUPP);
+      assert (err);
+      if (!(flags & NBD_CMD_FLAG_FAST_ZERO))
+        assert (err != ENOTSUP && err != EOPNOTSUPP);
       return err;
     }
     break;
@@ -368,7 +388,7 @@ skip_over_write_buffer (int sock, size_t count)

 /* Convert a system errno to an NBD_E* error code. */
 static int
-nbd_errno (int error, bool flag_df)
+nbd_errno (int error, uint16_t flags)
 {
   switch (error) {
   case 0:
@@ -390,10 +410,17 @@ nbd_errno (int error, bool flag_df)
   case ESHUTDOWN:
     return NBD_ESHUTDOWN;
 #endif
+  case ENOTSUP:
+#if ENOTSUP != EOPNOTSUPP
+  case EOPNOTSUPP:
+#endif
+    if (flags & NBD_CMD_FLAG_FAST_ZERO)
+      return NBD_ENOTSUP;
+    return NBD_EINVAL;
   case EOVERFLOW:
-    if (flag_df)
+    if (flags & NBD_CMD_FLAG_DF)
       return NBD_EOVERFLOW;
-    /* fallthrough */
+    return NBD_EINVAL;
   case EINVAL:
   default:
     return NBD_EINVAL;
@@ -402,7 +429,7 @@ nbd_errno (int error, bool flag_df)

 static int
 send_simple_reply (struct connection *conn,
-                   uint64_t handle, uint16_t cmd,
+                   uint64_t handle, uint16_t cmd, uint16_t flags,
                    const char *buf, uint32_t count,
                    uint32_t error)
 {
@@ -413,7 +440,7 @@ send_simple_reply (struct connection *conn,

   reply.magic = htobe32 (NBD_SIMPLE_REPLY_MAGIC);
   reply.handle = handle;
-  reply.error = htobe32 (nbd_errno (error, false));
+  reply.error = htobe32 (nbd_errno (error, flags));

   r = conn->send (conn, &reply, sizeof reply, f);
   if (r == -1) {
@@ -640,7 +667,7 @@ send_structured_reply_error (struct connection *conn,
   }

   /* Send the error. */
-  error_data.error = htobe32 (nbd_errno (error, flags & NBD_CMD_FLAG_DF));
+  error_data.error = htobe32 (nbd_errno (error, flags));
   error_data.len = htobe16 (0);
   r = conn->send (conn, &error_data, sizeof error_data, 0);
   if (r == -1) {
@@ -790,5 +817,6 @@ protocol_recv_request_send_reply (struct connection *conn)
                                           error);
   }
   else
-    return send_simple_reply (conn, request.handle, cmd, buf, count, error);
+    return send_simple_reply (conn, request.handle, cmd, flags, buf, count,
+                              error);
 }
diff --git a/include/nbdkit-common.h b/include/nbdkit-common.h
index e004aa18..f33ce133 100644
--- a/include/nbdkit-common.h
+++ b/include/nbdkit-common.h
@@ -57,9 +57,10 @@ extern "C" {
 #define NBDKIT_THREAD_MODEL_SERIALIZE_REQUESTS        2
 #define NBDKIT_THREAD_MODEL_PARALLEL                  3

-#define NBDKIT_FLAG_MAY_TRIM (1<<0) /* Maps to !NBD_CMD_FLAG_NO_HOLE */
-#define NBDKIT_FLAG_FUA      (1<<1) /* Maps to NBD_CMD_FLAG_FUA */
-#define NBDKIT_FLAG_REQ_ONE  (1<<2) /* Maps to NBD_CMD_FLAG_REQ_ONE */
+#define NBDKIT_FLAG_MAY_TRIM  (1<<0) /* Maps to !NBD_CMD_FLAG_NO_HOLE */
+#define NBDKIT_FLAG_FUA       (1<<1) /* Maps to NBD_CMD_FLAG_FUA */
+#define NBDKIT_FLAG_REQ_ONE   (1<<2) /* Maps to NBD_CMD_FLAG_REQ_ONE */
+#define NBDKIT_FLAG_FAST_ZERO (1<<3) /* Maps to NBD_CMD_FLAG_FAST_ZERO */

 #define NBDKIT_FUA_NONE       0
 #define NBDKIT_FUA_EMULATE    1
diff --git a/plugins/ocaml/ocaml.c b/plugins/ocaml/ocaml.c
index c472281f..144a449e 100644
--- a/plugins/ocaml/ocaml.c
+++ b/plugins/ocaml/ocaml.c
@@ -857,7 +857,6 @@ ocaml_nbdkit_set_error (value nv)
   case 5: err = ENOSPC; break;
   case 6: err = ESHUTDOWN; break;
   case 7: err = EOVERFLOW; break;
-    /* Necessary for .zero support */
   case 8: err = EOPNOTSUPP; break;
     /* Other errno values that server/protocol.c treats specially */
   case 9: err = EROFS; break;
diff --git a/plugins/sh/call.c b/plugins/sh/call.c
index b86e7c9c..ab43e5ea 100644
--- a/plugins/sh/call.c
+++ b/plugins/sh/call.c
@@ -347,7 +347,6 @@ handle_script_error (char *ebuf, size_t len)
     err = ESHUTDOWN;
     skip = 9;
   }
-  /* Necessary for .zero support */
   else if (strncasecmp (ebuf, "ENOTSUP", 7) == 0) {
     err = ENOTSUP;
     skip = 7;
-- 
2.21.0

