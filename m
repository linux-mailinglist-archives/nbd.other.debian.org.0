Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 231CF9B24B
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0C8EE204EF; Fri, 23 Aug 2019 14:41:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:41:22 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 94AF6204F3
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:41:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eO8S2anH_vpy for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:41:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7F12F204F5
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:41:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6051A30A7B83;
	Fri, 23 Aug 2019 14:40:59 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0F6960126;
	Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [nbdkit PATCH 3/3] plugins: Add .can_fast_zero hook
Date: Fri, 23 Aug 2019 09:40:54 -0500
Message-Id: <20190823144054.27420-4-eblake@redhat.com>
In-Reply-To: <20190823144054.27420-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823144054.27420-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 23 Aug 2019 14:40:59 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ieYdLiju96E.A.u7C.Ss_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/644
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823144054.27420-4-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:41:22 +0000 (UTC)

Allow plugins to affect the handling of the new NBD_CMD_FLAG_FAST_ZERO
flag, then update affected plugins.  In particular, in-memory plugins
are always fast; the full plugin is better served by omitting .zero
and relying on .pwrite fallback; nbd takes advantage of libnbd
extensions proposed in parallel to pass through support; and
v2 language bindings expose the choice to their scripts.

The testsuite is updated thanks to the sh plugin to cover this.  In
turn, the sh plugin has to be a bit smarter about handling missing
can_fast_zero to get decent fallback support from nbdkit.

Plugins untouched by this patch either do not support .zero with flags
(including v1 plugins; these are all okay with the default behavior of
advertising but always failing fast zeroes), or are too difficult to
analyze in this patch (so not advertising is easier than having to
decide - in particular, the file plugin is tricky, since BLKZEROOUT is
not reliably fast).  The nozero filter can be used to adjust fast zero
settings for a plugin that has not yet updated.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/nbdkit-plugin.pod          |  74 +++++++++++++++----
 plugins/sh/nbdkit-sh-plugin.pod |  13 +++-
 server/plugins.c                |  25 +++++--
 include/nbdkit-plugin.h         |   2 +
 plugins/data/data.c             |  14 +++-
 plugins/full/full.c             |  12 ++--
 plugins/memory/memory.c         |  14 +++-
 plugins/nbd/nbd.c               |  28 +++++++-
 plugins/null/null.c             |   8 +++
 plugins/ocaml/ocaml.c           |  25 +++++++
 plugins/sh/sh.c                 |  39 +++++++---
 plugins/ocaml/NBDKit.ml         |  10 ++-
 plugins/ocaml/NBDKit.mli        |   2 +
 plugins/rust/src/lib.rs         |   3 +
 tests/test-eflags.sh            | 122 ++++++++++++++++++++++++++++----
 15 files changed, 332 insertions(+), 59 deletions(-)

diff --git a/docs/nbdkit-plugin.pod b/docs/nbdkit-plugin.pod
index bc3d9749..f3793e7a 100644
--- a/docs/nbdkit-plugin.pod
+++ b/docs/nbdkit-plugin.pod
@@ -609,19 +609,47 @@ C<.trim> callback has been defined.

 This is called during the option negotiation phase to find out if the
 plugin wants the C<.zero> callback to be utilized.  Support for
-writing zeroes is still advertised to the client (unless the nbdkit
-filter nozero is also used), so returning false merely serves as a way
-to avoid complicating the C<.zero> callback to have to fail with
-C<ENOTSUP> or C<EOPNOTSUPP> on the connections where it will never be
-more efficient than using C<.pwrite> up front.
+writing zeroes is still advertised to the client (unless the
+L<nbdkit-nozero-filter(1)> is also used), so returning false merely
+serves as a way to avoid complicating the C<.zero> callback to have to
+fail with C<ENOTSUP> or C<EOPNOTSUPP> on the connections where it will
+never be more efficient than using C<.pwrite> up front.

 If there is an error, C<.can_zero> should call C<nbdkit_error> with an
 error message and return C<-1>.

-This callback is not required.  If omitted, then nbdkit always tries
-C<.zero> first if it is present, and gracefully falls back to
-C<.pwrite> if C<.zero> was absent or failed with C<ENOTSUP> or
-C<EOPNOTSUPP>.
+This callback is not required.  If omitted, then for a normal zero
+request, nbdkit always tries C<.zero> first if it is present, and
+gracefully falls back to C<.pwrite> if C<.zero> was absent or failed
+with C<ENOTSUP> or C<EOPNOTSUPP>.
+
+=head2 C<.can_fast_zero>
+
+ int can_fast_zero (void *handle);
+
+This is called during the option negotiation phase to find out if the
+plugin wants to advertise support for fast zero requests.  If this
+support is not advertised, a client cannot attempt fast zero requests,
+and has no way to tell if writing zeroes offers any speedups compared
+to using C<.pwrite> (other than compressed network traffic).  If
+support is advertised, then C<.zero> will have
+C<NBDKIT_FLAG_FAST_ZERO> set when the client has requested a fast
+zero, in which case the plugin must fail with C<ENOTSUP> or
+C<EOPNOTSUPP> up front if the request would not offer any benefits
+over C<.pwrite>.  Advertising support for fast zero requests does not
+require that writing zeroes be fast, only that the result (whether
+success or failure) is fast, so this should be advertised when
+feasible.
+
+If there is an error, C<.can_fast_zero> should call C<nbdkit_error>
+with an error message and return C<-1>.
+
+This callback is not required.  If omitted, then nbdkit returns true
+if C<.zero> is absent or C<.can_zero> returns false (in those cases,
+nbdkit fails all fast zero requests, as its fallback to C<.pwrite> is
+not inherently faster), otherwise false (since it cannot be determined
+in advance if the plugin's C<.zero> will properly honor the semantics
+of C<NBDKIT_FLAG_FAST_ZERO>).

 =head2 C<.can_extents>

@@ -804,15 +832,25 @@ bytes of zeroes at C<offset> in the backing store.

 This function will not be called if C<.can_zero> returned false.  On
 input, the parameter C<flags> may include C<NBDKIT_FLAG_MAY_TRIM>
-unconditionally, and C<NBDKIT_FLAG_FUA> based on the result of
-C<.can_fua>.
+unconditionally, C<NBDKIT_FLAG_FUA> based on the result of
+C<.can_fua>, and C<NBDKIT_FLAG_FAST_ZERO> based on the result of
+C<.can_fast_zero>.

 If C<NBDKIT_FLAG_MAY_TRIM> is requested, the operation can punch a
 hole instead of writing actual zero bytes, but only if subsequent
-reads from the hole read as zeroes.  If this callback is omitted, or
-if it fails with C<ENOTSUP> or C<EOPNOTSUPP> (whether by
-C<nbdkit_set_error> or C<errno>), then C<.pwrite> will be used
-instead.
+reads from the hole read as zeroes.
+
+If C<NBDKIT_FLAG_FAST_ZERO> is requested, the plugin must decide up
+front if the implementation is likely to be faster than a
+corresponding C<.pwrite>; if not, then it must immediately fail with
+C<ENOTSUP> or C<EOPNOTSUPP> (whether by C<nbdkit_set_error> or
+C<errno>) and preferably without modifying the exported image.  It is
+acceptable to always fail a fast zero request (as a fast failure is
+better than attempting the write only to find out after the fact that
+it was not fast after all).  Note that on Linux, support for
+C<ioctl(BLKZEROOUT)> is insufficient for determining whether a zero
+request to a block device will be fast (because the kernel will
+perform a slow fallback when needed).

 The callback must write the whole C<count> bytes if it can.  The NBD
 protocol doesn't allow partial writes (instead, these would be
@@ -823,6 +861,11 @@ If there is an error, C<.zero> should call C<nbdkit_error> with an
 error message, and C<nbdkit_set_error> to record an appropriate error
 (unless C<errno> is sufficient), then return C<-1>.

+If this callback is omitted, or if it fails with C<ENOTSUP> or
+C<EOPNOTSUPP> (whether by C<nbdkit_set_error> or C<errno>), then
+C<.pwrite> will be used as an automatic fallback except when the
+client requested a fast zero.
+
 =head2 C<.extents>

  int extents (void *handle, uint32_t count, uint64_t offset,
@@ -1221,6 +1264,7 @@ and then users will be able to run it like this:
 =head1 SEE ALSO

 L<nbdkit(1)>,
+L<nbdkit-nozero-filter(3)>,
 L<nbdkit-filter(3)>.

 Standard plugins provided by nbdkit:
diff --git a/plugins/sh/nbdkit-sh-plugin.pod b/plugins/sh/nbdkit-sh-plugin.pod
index 9e9a133e..adb8a0db 100644
--- a/plugins/sh/nbdkit-sh-plugin.pod
+++ b/plugins/sh/nbdkit-sh-plugin.pod
@@ -289,7 +289,10 @@ The script should exit with code C<0> for true or code C<3> for false.

 =item C<is_rotational>

+=item C<can_fast_zero>
+
  /path/to/script is_rotational <handle>
+ /path/to/script can_fast_zero <handle>

 The script should exit with code C<0> for true or code C<3> for false.

@@ -361,12 +364,18 @@ also provide a C<can_trim> method which exits with code C<0> (true).
  /path/to/script zero <handle> <count> <offset> <flags>

 The C<flags> parameter can be an empty string or a comma-separated
-list of the flags: C<"fua"> and C<"may_trim"> (eg. C<"">, C<"fua">,
-C<"fua,may_trim"> are all possible values).
+list of the flags: C<"fua">, C<"may_trim">, and C<"fast"> (eg. C<"">,
+C<"fua">, C<"fua,may_trim,fast"> are some of the 8 possible values).

 Unlike in other languages, if you provide a C<zero> method you B<must>
 also provide a C<can_zero> method which exits with code C<0> (true).

+To trigger a fallback to <pwrite> on a normal zero request, or to
+respond quickly to the C<"fast"> flag that a specific zero request is
+no faster than a corresponding write, the script must output
+C<ENOTSUP> or C<EOPNOTSUPP> to stderr (possibly followed by a
+description of the problem) before exiting with code C<1> (failure).
+
 =item C<extents>

  /path/to/script extents <handle> <count> <offset> <flags>
diff --git a/server/plugins.c b/server/plugins.c
index c6dcf408..84329cf4 100644
--- a/server/plugins.c
+++ b/server/plugins.c
@@ -404,11 +404,25 @@ plugin_can_zero (struct backend *b, struct connection *conn)
 static int
 plugin_can_fast_zero (struct backend *b, struct connection *conn)
 {
+  struct backend_plugin *p = container_of (b, struct backend_plugin, backend);
+  int r;
+
   assert (connection_get_handle (conn, 0));

   debug ("can_fast_zero");

-  return 0; /* Upcoming patch will actually add support. */
+  if (p->plugin.can_fast_zero)
+    return p->plugin.can_fast_zero (connection_get_handle (conn, 0));
+  /* Advertise support for fast zeroes if no .zero or .can_zero is
+   * false: in those cases, we fail fast instead of using .pwrite.
+   * This also works when v1 plugin has only ._zero_old.
+   */
+  if (p->plugin.zero == NULL)
+    return 1;
+  r = plugin_can_zero (b, conn);
+  if (r == -1)
+    return -1;
+  return !r;
 }

 static int
@@ -656,15 +670,18 @@ plugin_zero (struct backend *b, struct connection *conn,
   }

   if (can_zero) {
-    /* if (!can_fast_zero) */
-    flags &= ~NBDKIT_FLAG_FAST_ZERO;
     errno = 0;
     if (p->plugin.zero)
       r = p->plugin.zero (connection_get_handle (conn, 0), count, offset,
                           flags);
-    else if (p->plugin._zero_old)
+    else if (p->plugin._zero_old) {
+      if (fast_zero) {
+        *err = EOPNOTSUPP;
+        return -1;
+      }
       r = p->plugin._zero_old (connection_get_handle (conn, 0), count, offset,
                                may_trim);
+    }
     else
       emulate = true;
     if (r == -1)
diff --git a/include/nbdkit-plugin.h b/include/nbdkit-plugin.h
index 632df867..45ae7053 100644
--- a/include/nbdkit-plugin.h
+++ b/include/nbdkit-plugin.h
@@ -132,6 +132,8 @@ struct nbdkit_plugin {
   int (*cache) (void *handle, uint32_t count, uint64_t offset, uint32_t flags);

   int (*thread_model) (void);
+
+  int (*can_fast_zero) (void *handle);
 };

 extern void nbdkit_set_error (int err);
diff --git a/plugins/data/data.c b/plugins/data/data.c
index 14fb8997..9004a487 100644
--- a/plugins/data/data.c
+++ b/plugins/data/data.c
@@ -349,6 +349,13 @@ data_can_cache (void *handle)
   return NBDKIT_CACHE_NATIVE;
 }

+/* Fast zero. */
+static int
+data_can_fast_zero (void *handle)
+{
+  return 1;
+}
+
 /* Read data. */
 static int
 data_pread (void *handle, void *buf, uint32_t count, uint64_t offset,
@@ -375,8 +382,10 @@ data_pwrite (void *handle, const void *buf, uint32_t count, uint64_t offset,
 static int
 data_zero (void *handle, uint32_t count, uint64_t offset, uint32_t flags)
 {
-  /* Flushing, and thus FUA flag, is a no-op */
-  assert ((flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM)) == 0);
+  /* Flushing, and thus FUA flag, is a no-op. Assume that
+   * sparse_array_zero generally beats writes, so FAST_ZERO is a no-op. */
+  assert ((flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM |
+                     NBDKIT_FLAG_FAST_ZERO)) == 0);
   ACQUIRE_LOCK_FOR_CURRENT_SCOPE (&lock);
   sparse_array_zero (sa, count, offset);
   return 0;
@@ -423,6 +432,7 @@ static struct nbdkit_plugin plugin = {
   .can_multi_conn    = data_can_multi_conn,
   .can_fua           = data_can_fua,
   .can_cache         = data_can_cache,
+  .can_fast_zero     = data_can_fast_zero,
   .pread             = data_pread,
   .pwrite            = data_pwrite,
   .zero              = data_zero,
diff --git a/plugins/full/full.c b/plugins/full/full.c
index 9cfbcfcd..0b69a8c9 100644
--- a/plugins/full/full.c
+++ b/plugins/full/full.c
@@ -129,13 +129,10 @@ full_pwrite (void *handle, const void *buf, uint32_t count, uint64_t offset,
   return -1;
 }

-/* Write zeroes. */
-static int
-full_zero (void *handle, uint32_t count, uint64_t offset, uint32_t flags)
-{
-  errno = ENOSPC;
-  return -1;
-}
+/* Omitting full_zero is intentional: that way, nbdkit defaults to
+ * permitting fast zeroes which respond with ENOTSUP, while normal
+ * zeroes fall back to pwrite and respond with ENOSPC.
+ */

 /* Trim. */
 static int
@@ -172,7 +169,6 @@ static struct nbdkit_plugin plugin = {
   .can_cache         = full_can_cache,
   .pread             = full_pread,
   .pwrite            = full_pwrite,
-  .zero              = full_zero,
   .trim              = full_trim,
   .extents           = full_extents,
   /* In this plugin, errno is preserved properly along error return
diff --git a/plugins/memory/memory.c b/plugins/memory/memory.c
index 09162ea2..e831a7b5 100644
--- a/plugins/memory/memory.c
+++ b/plugins/memory/memory.c
@@ -147,6 +147,13 @@ memory_can_cache (void *handle)
   return NBDKIT_CACHE_NATIVE;
 }

+/* Fast zero. */
+static int
+memory_can_fast_zero (void *handle)
+{
+  return 1;
+}
+
 /* Read data. */
 static int
 memory_pread (void *handle, void *buf, uint32_t count, uint64_t offset,
@@ -173,8 +180,10 @@ memory_pwrite (void *handle, const void *buf, uint32_t count, uint64_t offset,
 static int
 memory_zero (void *handle, uint32_t count, uint64_t offset, uint32_t flags)
 {
-  /* Flushing, and thus FUA flag, is a no-op */
-  assert ((flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM)) == 0);
+  /* Flushing, and thus FUA flag, is a no-op. Assume that
+   * sparse_array_zero generally beats writes, so FAST_ZERO is a no-op. */
+  assert ((flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM |
+                     NBDKIT_FLAG_FAST_ZERO)) == 0);
   ACQUIRE_LOCK_FOR_CURRENT_SCOPE (&lock);
   sparse_array_zero (sa, count, offset);
   return 0;
@@ -221,6 +230,7 @@ static struct nbdkit_plugin plugin = {
   .can_fua           = memory_can_fua,
   .can_multi_conn    = memory_can_multi_conn,
   .can_cache         = memory_can_cache,
+  .can_fast_zero     = memory_can_fast_zero,
   .pread             = memory_pread,
   .pwrite            = memory_pwrite,
   .zero              = memory_zero,
diff --git a/plugins/nbd/nbd.c b/plugins/nbd/nbd.c
index 09c8891e..cddcfde2 100644
--- a/plugins/nbd/nbd.c
+++ b/plugins/nbd/nbd.c
@@ -633,6 +633,24 @@ nbdplug_can_zero (void *handle)
   return i;
 }

+static int
+nbdplug_can_fast_zero (void *handle)
+{
+#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO
+  struct handle *h = handle;
+  int i = nbd_can_fast_zero (h->nbd);
+
+  if (i == -1) {
+    nbdkit_error ("failure to check fast zero flag: %s", nbd_get_error ());
+    return -1;
+  }
+  return i;
+#else
+  /* libnbd 0.9.8 lacks fast zero support */
+  return 0;
+#endif
+}
+
 static int
 nbdplug_can_fua (void *handle)
 {
@@ -724,12 +742,19 @@ nbdplug_zero (void *handle, uint32_t count, uint64_t offset, uint32_t flags)
   struct transaction s;
   uint32_t f = 0;

-  assert (!(flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM)));
+  assert (!(flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM |
+                      NBDKIT_FLAG_FAST_ZERO)));

   if (!(flags & NBDKIT_FLAG_MAY_TRIM))
     f |= LIBNBD_CMD_FLAG_NO_HOLE;
   if (flags & NBDKIT_FLAG_FUA)
     f |= LIBNBD_CMD_FLAG_FUA;
+#if LIBNBD_HAVE_NBD_CAN_FAST_ZERO
+  if (flags & NBDKIT_FLAG_FAST_ZERO)
+    f |= LIBNBD_CMD_FLAG_FAST_ZERO;
+#else
+  assert (!(flags & NBDKIT_FLAG_FAST_ZERO));
+#endif
   nbdplug_prepare (&s);
   nbdplug_register (h, &s, nbd_aio_zero (h->nbd, count, offset, s.cb, f));
   return nbdplug_reply (h, &s);
@@ -831,6 +856,7 @@ static struct nbdkit_plugin plugin = {
   .is_rotational      = nbdplug_is_rotational,
   .can_trim           = nbdplug_can_trim,
   .can_zero           = nbdplug_can_zero,
+  .can_fast_zero      = nbdplug_can_fast_zero,
   .can_fua            = nbdplug_can_fua,
   .can_multi_conn     = nbdplug_can_multi_conn,
   .can_extents        = nbdplug_can_extents,
diff --git a/plugins/null/null.c b/plugins/null/null.c
index 647624ba..559cb815 100644
--- a/plugins/null/null.c
+++ b/plugins/null/null.c
@@ -100,6 +100,13 @@ null_can_cache (void *handle)
   return NBDKIT_CACHE_NATIVE;
 }

+/* Fast zero. */
+static int
+null_can_fast_zero (void *handle)
+{
+  return 1;
+}
+
 /* Read data. */
 static int
 null_pread (void *handle, void *buf, uint32_t count, uint64_t offset,
@@ -167,6 +174,7 @@ static struct nbdkit_plugin plugin = {
   .get_size          = null_get_size,
   .can_multi_conn    = null_can_multi_conn,
   .can_cache         = null_can_cache,
+  .can_fast_zero     = null_can_fast_zero,
   .pread             = null_pread,
   .pwrite            = null_pwrite,
   .zero              = null_zero,
diff --git a/plugins/ocaml/ocaml.c b/plugins/ocaml/ocaml.c
index 144a449e..a655f9ca 100644
--- a/plugins/ocaml/ocaml.c
+++ b/plugins/ocaml/ocaml.c
@@ -134,6 +134,8 @@ static value cache_fn;

 static value thread_model_fn;

+static value can_fast_zero_fn;
+
 /*----------------------------------------------------------------------*/
 /* Wrapper functions that translate calls from C (ie. nbdkit) to OCaml. */

@@ -705,6 +707,25 @@ thread_model_wrapper (void)
   CAMLreturnT (int, Int_val (rv));
 }

+static int
+can_fast_zero_wrapper (void *h)
+{
+  CAMLparam0 ();
+  CAMLlocal1 (rv);
+
+  caml_leave_blocking_section ();
+
+  rv = caml_callback_exn (can_fast_zero_fn, *(value *) h);
+  if (Is_exception_result (rv)) {
+    nbdkit_error ("%s", caml_format_exception (Extract_exception (rv)));
+    caml_enter_blocking_section ();
+    CAMLreturnT (int, -1);
+  }
+
+  caml_enter_blocking_section ();
+  CAMLreturnT (int, Bool_val (rv));
+}
+
 /*----------------------------------------------------------------------*/
 /* set_* functions called from OCaml code at load time to initialize
  * fields in the plugin struct.
@@ -792,6 +813,8 @@ SET(cache)

 SET(thread_model)

+SET(can_fast_zero)
+
 #undef SET

 static void
@@ -836,6 +859,8 @@ remove_roots (void)

   REMOVE (thread_model);

+  REMOVE (can_fast_zero);
+
 #undef REMOVE
 }

diff --git a/plugins/sh/sh.c b/plugins/sh/sh.c
index c73b08b7..d5db8b59 100644
--- a/plugins/sh/sh.c
+++ b/plugins/sh/sh.c
@@ -478,6 +478,9 @@ flags_string (uint32_t flags, char *buf, size_t len)

   if (flags & NBDKIT_FLAG_REQ_ONE)
     flag_append ("req_one", &comma, &buf, &len);
+
+  if (flags & NBDKIT_FLAG_FAST_ZERO)
+    flag_append("fast", &comma, &buf, &len);
 }

 static void
@@ -536,7 +539,7 @@ sh_pwrite (void *handle, const void *buf, uint32_t count, uint64_t offset,

 /* Common code for handling all boolean methods like can_write etc. */
 static int
-boolean_method (void *handle, const char *method_name)
+boolean_method (void *handle, const char *method_name, int def)
 {
   char *h = handle;
   const char *args[] = { script, method_name, h, NULL };
@@ -546,8 +549,8 @@ boolean_method (void *handle, const char *method_name)
     return 1;
   case RET_FALSE:               /* false */
     return 0;
-  case MISSING:                 /* missing => assume false */
-    return 0;
+  case MISSING:                 /* missing => caller chooses default */
+    return def;
   case ERROR:                   /* error cases */
     return -1;
   default: abort ();
@@ -557,37 +560,37 @@ boolean_method (void *handle, const char *method_name)
 static int
 sh_can_write (void *handle)
 {
-  return boolean_method (handle, "can_write");
+  return boolean_method (handle, "can_write", 0);
 }

 static int
 sh_can_flush (void *handle)
 {
-  return boolean_method (handle, "can_flush");
+  return boolean_method (handle, "can_flush", 0);
 }

 static int
 sh_is_rotational (void *handle)
 {
-  return boolean_method (handle, "is_rotational");
+  return boolean_method (handle, "is_rotational", 0);
 }

 static int
 sh_can_trim (void *handle)
 {
-  return boolean_method (handle, "can_trim");
+  return boolean_method (handle, "can_trim", 0);
 }

 static int
 sh_can_zero (void *handle)
 {
-  return boolean_method (handle, "can_zero");
+  return boolean_method (handle, "can_zero", 0);
 }

 static int
 sh_can_extents (void *handle)
 {
-  return boolean_method (handle, "can_extents");
+  return boolean_method (handle, "can_extents", 0);
 }

 /* Not a boolean method, the method prints "none", "emulate" or "native". */
@@ -646,7 +649,7 @@ sh_can_fua (void *handle)
 static int
 sh_can_multi_conn (void *handle)
 {
-  return boolean_method (handle, "can_multi_conn");
+  return boolean_method (handle, "can_multi_conn", 0);
 }

 /* Not a boolean method, the method prints "none", "emulate" or "native". */
@@ -696,6 +699,21 @@ sh_can_cache (void *handle)
   }
 }

+static int
+sh_can_fast_zero (void *handle)
+{
+  int r = boolean_method (handle, "can_fast_zero", 2);
+  if (r < 2)
+    return r;
+  /* We need to duplicate the logic of plugins.c: if can_fast_zero is
+   * missing, we advertise fast fail support when can_zero is false.
+   */
+  r = sh_can_zero (handle);
+  if (r == -1)
+    return -1;
+  return !r;
+}
+
 static int
 sh_flush (void *handle, uint32_t flags)
 {
@@ -962,6 +980,7 @@ static struct nbdkit_plugin plugin = {
   .can_fua           = sh_can_fua,
   .can_multi_conn    = sh_can_multi_conn,
   .can_cache         = sh_can_cache,
+  .can_fast_zero     = sh_can_fast_zero,

   .pread             = sh_pread,
   .pwrite            = sh_pwrite,
diff --git a/plugins/ocaml/NBDKit.ml b/plugins/ocaml/NBDKit.ml
index e54a7705..7002ac03 100644
--- a/plugins/ocaml/NBDKit.ml
+++ b/plugins/ocaml/NBDKit.ml
@@ -96,6 +96,8 @@ type 'a plugin = {
   cache : ('a -> int32 -> int64 -> flags -> unit) option;

   thread_model : (unit -> thread_model) option;
+
+  can_fast_zero : ('a -> bool) option;
 }

 let default_callbacks = {
@@ -141,6 +143,8 @@ let default_callbacks = {
   cache = None;

   thread_model = None;
+
+  can_fast_zero = None;
 }

 external set_name : string -> unit = "ocaml_nbdkit_set_name" "noalloc"
@@ -186,6 +190,8 @@ external set_cache : ('a -> int32 -> int64 -> flags -> unit) -> unit = "ocaml_nb

 external set_thread_model : (unit -> thread_model) -> unit = "ocaml_nbdkit_set_thread_model"

+external set_can_fast_zero : ('a -> bool) -> unit = "ocaml_nbdkit_set_can_fast_zero"
+
 let may f = function None -> () | Some a -> f a

 let register_plugin plugin =
@@ -249,7 +255,9 @@ let register_plugin plugin =
   may set_can_cache plugin.can_cache;
   may set_cache plugin.cache;

-  may set_thread_model plugin.thread_model
+  may set_thread_model plugin.thread_model;
+
+  may set_can_fast_zero plugin.can_fast_zero

 external _set_error : int -> unit = "ocaml_nbdkit_set_error" "noalloc"

diff --git a/plugins/ocaml/NBDKit.mli b/plugins/ocaml/NBDKit.mli
index 778250ef..06648b7f 100644
--- a/plugins/ocaml/NBDKit.mli
+++ b/plugins/ocaml/NBDKit.mli
@@ -101,6 +101,8 @@ type 'a plugin = {
   cache : ('a -> int32 -> int64 -> flags -> unit) option;

   thread_model : (unit -> thread_model) option;
+
+  can_fast_zero : ('a -> bool) option;
 }
 (** The plugin fields and callbacks.  ['a] is the handle type. *)

diff --git a/plugins/rust/src/lib.rs b/plugins/rust/src/lib.rs
index 53619dd9..313b4ca6 100644
--- a/plugins/rust/src/lib.rs
+++ b/plugins/rust/src/lib.rs
@@ -105,6 +105,8 @@ pub struct Plugin {
                                  flags: u32) -> c_int>,

     pub thread_model: Option<extern fn () -> ThreadModel>,
+
+    pub can_fast_zero: Option<extern fn (h: *mut c_void) -> c_int>,
 }

 #[repr(C)]
@@ -163,6 +165,7 @@ impl Plugin {
             can_cache: None,
             cache: None,
             thread_model: None,
+            can_fast_zero: None,
         }
     }
 }
diff --git a/tests/test-eflags.sh b/tests/test-eflags.sh
index f5cd43ed..9b3a6a3a 100755
--- a/tests/test-eflags.sh
+++ b/tests/test-eflags.sh
@@ -68,6 +68,7 @@ SEND_DF=$((           1 <<  7 ))
 CAN_MULTI_CONN=$((    1 <<  8 ))
 SEND_RESIZE=$((       1 <<  9 ))
 SEND_CACHE=$((        1 << 10 ))
+SEND_FAST_ZERO=$((    1 << 11 ))

 do_nbdkit ()
 {
@@ -133,8 +134,8 @@ EOF
 #----------------------------------------------------------------------
 # can_write=true
 #
-# NBD_FLAG_SEND_WRITE_ZEROES is set on writable connections
-# even when can_zero returns false, because nbdkit reckons it
+# NBD_FLAG_SEND_WRITE_ZEROES and NBD_FLAG_SEND_FAST_ZERO are set on writable
+# connections even when can_zero returns false, because nbdkit reckons it
 # can emulate zeroing using pwrite.

 do_nbdkit <<'EOF'
@@ -145,8 +146,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # --filter=nozero
@@ -255,8 +256,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|SEND_TRIM|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|SEND_TRIM|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|SEND_TRIM|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_TRIM|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # can_write=true
@@ -271,8 +272,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|ROTATIONAL|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|ROTATIONAL|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|ROTATIONAL|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|ROTATIONAL|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # -r
@@ -304,8 +305,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # -r
@@ -341,8 +342,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|SEND_FLUSH|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|SEND_FLUSH|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|SEND_FLUSH|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_FLUSH|SEND_FUA|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # can_write=true
@@ -361,8 +362,8 @@ case "$1" in
 esac
 EOF

-[ $eflags -eq $(( HAS_FLAGS|SEND_FLUSH|SEND_WRITE_ZEROES|SEND_DF )) ] ||
-    fail "$LINENO: expected HAS_FLAGS|SEND_FLUSH|SEND_WRITE_ZEROES|SEND_DF"
+[ $eflags -eq $(( HAS_FLAGS|SEND_FLUSH|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_FLUSH|SEND_WRITE_ZEROES|SEND_DF|SEND_FAST_ZERO"

 #----------------------------------------------------------------------
 # -r
@@ -448,3 +449,96 @@ EOF

 [ $eflags -eq $(( HAS_FLAGS|READ_ONLY|SEND_DF )) ] ||
     fail "$LINENO: expected HAS_FLAGS|READ_ONLY|SEND_DF"
+
+#----------------------------------------------------------------------
+# -r
+# can_fast_zero=true
+#
+# Fast zero support isn't advertised without regular zero support
+
+do_nbdkit -r <<'EOF'
+case "$1" in
+     get_size) echo 1M ;;
+     can_fast_zero) exit 0 ;;
+     *) exit 2 ;;
+esac
+EOF
+
+[ $eflags -eq $(( HAS_FLAGS|READ_ONLY|SEND_DF )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|READ_ONLY|SEND_DF"
+
+#----------------------------------------------------------------------
+# --filter=nozero
+# can_write=true
+# can_fast_zero=true
+#
+# Fast zero support isn't advertised without regular zero support
+
+do_nbdkit --filter=nozero <<'EOF'
+case "$1" in
+     get_size) echo 1M ;;
+     can_write) exit 0 ;;
+     can_fast_zero) exit 0 ;;
+     *) exit 2 ;;
+esac
+EOF
+
+[ $eflags -eq $(( HAS_FLAGS|SEND_DF )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|SEND_DF"
+
+#----------------------------------------------------------------------
+# can_write=true
+# can_zero=true
+#
+# Fast zero support is omitted for a plugin that has .zero but did not opt in
+
+do_nbdkit -r <<'EOF'
+case "$1" in
+     get_size) echo 1M ;;
+     can_write) exit 0 ;;
+     can_zero) exit 0 ;;
+     *) exit 2 ;;
+esac
+EOF
+
+[ $eflags -eq $(( HAS_FLAGS|READ_ONLY|SEND_DF )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|READ_ONLY|SEND_DF"
+
+#----------------------------------------------------------------------
+# can_write=true
+# can_zero=true
+# can_fast_zero=false
+#
+# Fast zero support is omitted if the plugin says so
+
+do_nbdkit -r <<'EOF'
+case "$1" in
+     get_size) echo 1M ;;
+     can_write) exit 0 ;;
+     can_zero) exit 0 ;;
+     can_fast_zero) exit 3 ;;
+     *) exit 2 ;;
+esac
+EOF
+
+[ $eflags -eq $(( HAS_FLAGS|READ_ONLY|SEND_DF )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|READ_ONLY|SEND_DF"
+
+#----------------------------------------------------------------------
+# can_write=true
+# can_zero=false
+# can_fast_zero=false
+#
+# Fast zero support is omitted if the plugin says so
+
+do_nbdkit -r <<'EOF'
+case "$1" in
+     get_size) echo 1M ;;
+     can_write) exit 0 ;;
+     can_fast_zero) exit 3 ;;
+     *) exit 2 ;;
+esac
+EOF
+
+[ $eflags -eq $(( HAS_FLAGS|READ_ONLY|SEND_DF )) ] ||
+    fail "$LINENO: expected HAS_FLAGS|READ_ONLY|SEND_DF"
-- 
2.21.0

