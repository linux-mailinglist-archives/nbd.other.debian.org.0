Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 283FE9B24A
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:41:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E0726204F5; Fri, 23 Aug 2019 14:41:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:41:18 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 01740204EF
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:41:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5, WORD_WITHOUT_VOWELS=1]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id smFgpDlBLeJ2 for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:41:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E278C204F3
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8FB18D5BBB;
	Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 583FA60126;
	Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [nbdkit PATCH 2/3] filters: Add .can_fast_zero hook
Date: Fri, 23 Aug 2019 09:40:53 -0500
Message-Id: <20190823144054.27420-3-eblake@redhat.com>
In-Reply-To: <20190823144054.27420-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823144054.27420-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Fri, 23 Aug 2019 14:40:58 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TRoms4ItSWO.A.-6C.Os_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/643
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823144054.27420-3-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:41:18 +0000 (UTC)

Allow filters to affect the handling of the new NBD_CMD_FLAG_FAST_ZERO
flag, then update affected filters.  In particular, the log filter
logs the state of the new flag (requires a tweak to expected output in
test-fua.sh), the delay filter gains a bool parameter delay-fast-zero,
several filters reject all fast requests because of local writes or
splitting a single client request into multiple plugin requests, and
the nozero filter gains additional modes for controlling fast zero
advertisement and support:

    zeromode→   none  emulate  notrim  plugin
↓fastzeromode                          (new)
---------------------------------------------
default          0      2        4      4
none             0      1        1      1
slow             0      2        2      2
ignore           0      3        3      3

0 - no zero advertised, thus no fast zero advertised
1 - fast zero not advertised
2 - fast zero advertised, but fast zero requests fail with
    ENOTSUP (ie. a fast zero was not possible)
3 - fast zero advertised, but fast zero requests are treated
    the same as normal requests (ignoring the fast zero flag,
    aids testing at the probable cost of spec non-compliance)
4 - fast zero advertisement/reaction is up to the plugin

Mode none/default remains the default for back-compat, and mode
plugin/default has no semantic change compared to omitting the nozero
filter from the command line.

Filters untouched by this patch are fine inheriting whatever fast-zero
behavior the underlying plugin uses.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/nbdkit-filter.pod                  | 27 +++++++----
 filters/delay/nbdkit-delay-filter.pod   | 15 +++++-
 filters/log/nbdkit-log-filter.pod       |  2 +-
 filters/nozero/nbdkit-nozero-filter.pod | 41 +++++++++++++---
 server/filters.c                        | 15 +++++-
 include/nbdkit-filter.h                 |  3 ++
 filters/blocksize/blocksize.c           | 12 +++++
 filters/cache/cache.c                   | 20 ++++++++
 filters/cow/cow.c                       | 20 ++++++++
 filters/delay/delay.c                   | 28 ++++++++++-
 filters/log/log.c                       | 16 ++++---
 filters/nozero/nozero.c                 | 62 +++++++++++++++++++++++--
 filters/truncate/truncate.c             | 15 ++++++
 tests/test-fua.sh                       |  4 +-
 14 files changed, 248 insertions(+), 32 deletions(-)

diff --git a/docs/nbdkit-filter.pod b/docs/nbdkit-filter.pod
index 6e2bea61..ebce8961 100644
--- a/docs/nbdkit-filter.pod
+++ b/docs/nbdkit-filter.pod
@@ -361,6 +361,8 @@ calls.

 =head2 C<.can_zero>

+=head2 C<.can_fast_zero>
+
 =head2 C<.can_extents>

 =head2 C<.can_fua>
@@ -380,6 +382,8 @@ calls.
                   void *handle);
  int (*can_zero) (struct nbdkit_next_ops *next_ops, void *nxdata,
                   void *handle);
+ int (*can_fast_zero) (struct nbdkit_next_ops *next_ops, void *nxdata,
+                       void *handle);
  int (*can_extents) (struct nbdkit_next_ops *next_ops, void *nxdata,
                      void *handle);
  int (*can_fua) (struct nbdkit_next_ops *next_ops, void *nxdata,
@@ -517,22 +521,25 @@ turn, the filter should not call C<next_ops-E<gt>zero> if
 C<next_ops-E<gt>can_zero> did not return true.

 On input, the parameter C<flags> may include C<NBDKIT_FLAG_MAY_TRIM>
-unconditionally, and C<NBDKIT_FLAG_FUA> based on the result of
-C<.can_fua>.  In turn, the filter may pass C<NBDKIT_FLAG_MAY_TRIM>
-unconditionally, but should only pass C<NBDKIT_FLAG_FUA> on to
-C<next_ops-E<gt>zero> if C<next_ops-E<gt>can_fua> returned a positive
-value.
+unconditionally, C<NBDKIT_FLAG_FUA> based on the result of
+C<.can_fua>, and C<NBDKIT_FLAG_FAST_ZERO> based on the result of
+C<.can_fast_zero>.  In turn, the filter may pass
+C<NBDKIT_FLAG_MAY_TRIM> unconditionally, but should only pass
+C<NBDKIT_FLAG_FUA> or C<NBDKIT_FLAG_FAST_ZERO> on to
+C<next_ops-E<gt>zero> if the corresponding C<next_ops-E<gt>can_fua> or
+C<next_ops-E<gt>can_fast_zero> returned a positive value.

 Note that unlike the plugin C<.zero> which is permitted to fail with
 C<ENOTSUP> or C<EOPNOTSUPP> to force a fallback to C<.pwrite>, the
-function C<next_ops-E<gt>zero> will never fail with C<err> set to
-C<ENOTSUP> or C<EOPNOTSUPP> because the fallback has already taken
-place.
+function C<next_ops-E<gt>zero> will not fail with C<err> set to
+C<ENOTSUP> or C<EOPNOTSUPP> unless C<NBDKIT_FLAG_FAST_ZERO> was used,
+because otherwise the fallback has already taken place.

 If there is an error, C<.zero> should call C<nbdkit_error> with an
 error message B<and> return -1 with C<err> set to the positive errno
-value to return to the client.  The filter should never fail with
-C<ENOTSUP> or C<EOPNOTSUPP> (while plugins have automatic fallback to
+value to return to the client.  The filter should not fail with
+C<ENOTSUP> or C<EOPNOTSUPP> unless C<flags> includes
+C<NBDKIT_FLAG_FAST_ZERO> (while plugins have automatic fallback to
 C<.pwrite>, filters do not).

 =head2 C<.extents>
diff --git a/filters/delay/nbdkit-delay-filter.pod b/filters/delay/nbdkit-delay-filter.pod
index 730cea4c..0a9c77f7 100644
--- a/filters/delay/nbdkit-delay-filter.pod
+++ b/filters/delay/nbdkit-delay-filter.pod
@@ -12,6 +12,7 @@ nbdkit-delay-filter - nbdkit delay filter
           delay-read=(SECS|NNms) delay-write=(SECS|NNms)
           delay-zero=(SECS|NNms) delay-trim=(SECS|NNms)
           delay-extents=(SECS|NNms) delay-cache=(SECS|NNms)
+          delay-fast-zero=BOOL

 =head1 DESCRIPTION

@@ -56,7 +57,8 @@ Delay write operations by C<SECS> seconds or C<NN> milliseconds.

 =item B<delay-zero=>NNB<ms>

-Delay zero operations by C<SECS> seconds or C<NN> milliseconds.
+Delay zero operations by C<SECS> seconds or C<NN> milliseconds.  See
+also B<delay-fast-zero>.

 =item B<delay-trim=>SECS

@@ -85,6 +87,17 @@ milliseconds.
 Delay write, zero and trim operations by C<SECS> seconds or C<NN>
 milliseconds.

+=item B<delay-fast-zero=>BOOL
+
+The NBD specification documents an extension called fast zero, in
+which the client may request that a server should reply with
+C<ENOTSUP> as soon as possible if the zero operation offers no real
+speedup over a corresponding write.  By default, this parameter is
+true, and fast zero requests are serviced by the plugin after the same
+delay as any other zero request; but setting this parameter to false
+instantly fails a fast zero response without waiting for or consulting
+the plugin.
+
 =back

 =head1 SEE ALSO
diff --git a/filters/log/nbdkit-log-filter.pod b/filters/log/nbdkit-log-filter.pod
index 9e102bc0..5d9625a1 100644
--- a/filters/log/nbdkit-log-filter.pod
+++ b/filters/log/nbdkit-log-filter.pod
@@ -55,7 +55,7 @@ on the connection).
 An example logging session of a client that performs a single
 successful read is:

- 2018-01-27 20:38:22.959984 connection=1 Connect size=0x400 write=1 flush=1 rotational=0 trim=0 zero=1 fua=1
+ 2018-01-27 20:38:22.959984 connection=1 Connect size=0x400 write=1 flush=1 rotational=0 trim=0 zero=1 fua=1 extents=1 cache=0 fast_zero=0
  2018-01-27 20:38:23.001720 connection=1 Read id=1 offset=0x0 count=0x100 ...
  2018-01-27 20:38:23.001995 connection=1 ...Read id=1 return=0 (Success)
  2018-01-27 20:38:23.044259 connection=1 Disconnect transactions=1
diff --git a/filters/nozero/nbdkit-nozero-filter.pod b/filters/nozero/nbdkit-nozero-filter.pod
index 144b8230..4fc7dc63 100644
--- a/filters/nozero/nbdkit-nozero-filter.pod
+++ b/filters/nozero/nbdkit-nozero-filter.pod
@@ -4,7 +4,8 @@ nbdkit-nozero-filter - nbdkit nozero filter

 =head1 SYNOPSIS

- nbdkit --filter=nozero plugin [zeromode=MODE] [plugin-args...]
+ nbdkit --filter=nozero plugin [plugin-args...] \
+   [zeromode=MODE] [fastzeromode=MODE]

 =head1 DESCRIPTION

@@ -18,7 +19,7 @@ testing client or server fallbacks.

 =over 4

-=item B<zeromode=none|emulate|notrim>
+=item B<zeromode=none|emulate|notrim|plugin>

 Optional, controls which mode the filter will use.  Mode B<none>
 (default) means that zero support is not advertised to the
@@ -29,8 +30,30 @@ efficient way to write zeros. Since nbdkit E<ge> 1.13.4, mode
 B<notrim> means that zero requests are forwarded on to the plugin,
 except that the plugin will never see the NBDKIT_MAY_TRIM flag, to
 determine if the client permitting trimming during zero operations
-makes a difference (it is an error to request this mode if the plugin
-does not support the C<zero> callback).
+makes a difference.  Since nbdkit E<ge> 1.13.9, mode B<plugin> leaves
+normal zero requests up to the plugin, useful when combined with
+C<fastzeromode> for experimenting with the effects of fast zero
+requests.  It is an error to request B<notrim> or B<plugin> if the
+plugin does not support the C<zero> callback.
+
+=item B<fastzeromode=none|slow|ignore|default>
+
+Optional since nbdkit E<ge> 1.13.9, controls whether fast zeroes are
+advertised to the client, and if so, how the filter will react to a
+client fast zero request.  Mode B<none> avoids advertising fast zero
+support.  Mode B<slow> advertises fast zero support unconditionally,
+but treats all fast zero requests as an immediate C<ENOTSUP> failure
+rather than performing a fallback.  Mode B<ignore> advertises fast
+zero support, but treats all client fast zero requests as if the flag
+had not been used (this behavior is typically contrary to the NBD
+specification, but can be useful for comparison against the actual
+fast zero implementation to see if fast zeroes make a difference).
+Mode B<default> is selected by default; when paired with
+C<zeromode=emulate>, fast zeroes are advertised but fast zero requests
+always fail (similar to C<slow>); when paired with C<zeromode=notrim>
+or C<zeromode=plugin>, fast zero support is left to the plugin
+(although in the latter case, the nozero filter could be omitted for
+the same behavior).

 =back

@@ -42,11 +65,17 @@ explicitly rather than with C<NBD_CMD_WRITE_ZEROES>:
  nbdkit --filter=nozero file disk.img

 Serve the file F<disk.img>, allowing the client to take advantage of
-less network traffic via C<NBD_CMD_WRITE_ZEROES>, but still forcing
-the data to be written explicitly rather than punching any holes:
+less network traffic via C<NBD_CMD_WRITE_ZEROES>, but fail any fast
+zero requests up front and force all other zero requests to write data
+explicitly rather than punching any holes:

  nbdkit --filter=nozero file zeromode=emulate disk.img

+Serve the file F<disk.img>, but do not advertise fast zero support to
+the client even if the plugin supports it:
+
+ nbdkit --filter=nozero file zeromode=plugin fastzeromode=none disk.img
+
 =head1 SEE ALSO

 L<nbdkit(1)>,
diff --git a/server/filters.c b/server/filters.c
index 0dd2393e..f2de5e4e 100644
--- a/server/filters.c
+++ b/server/filters.c
@@ -314,6 +314,13 @@ next_can_zero (void *nxdata)
   return b_conn->b->can_zero (b_conn->b, b_conn->conn);
 }

+static int
+next_can_fast_zero (void *nxdata)
+{
+  struct b_conn *b_conn = nxdata;
+  return b_conn->b->can_fast_zero (b_conn->b, b_conn->conn);
+}
+
 static int
 next_can_extents (void *nxdata)
 {
@@ -445,6 +452,7 @@ static struct nbdkit_next_ops next_ops = {
   .is_rotational = next_is_rotational,
   .can_trim = next_can_trim,
   .can_zero = next_can_zero,
+  .can_fast_zero = next_can_fast_zero,
   .can_extents = next_can_extents,
   .can_fua = next_can_fua,
   .can_multi_conn = next_can_multi_conn,
@@ -593,9 +601,14 @@ static int
 filter_can_fast_zero (struct backend *b, struct connection *conn)
 {
   struct backend_filter *f = container_of (b, struct backend_filter, backend);
+  void *handle = connection_get_handle (conn, f->backend.i);
+  struct b_conn nxdata = { .b = f->backend.next, .conn = conn };

   debug ("%s: can_fast_zero", f->name);
-  return 0; /* Next patch will query or pass through */
+  if (f->filter.can_fast_zero)
+    return f->filter.can_fast_zero (&next_ops, &nxdata, handle);
+  else
+    return f->backend.next->can_fast_zero (f->backend.next, conn);
 }

 static int
diff --git a/include/nbdkit-filter.h b/include/nbdkit-filter.h
index 94f17789..d11cf881 100644
--- a/include/nbdkit-filter.h
+++ b/include/nbdkit-filter.h
@@ -71,6 +71,7 @@ struct nbdkit_next_ops {
   int (*is_rotational) (void *nxdata);
   int (*can_trim) (void *nxdata);
   int (*can_zero) (void *nxdata);
+  int (*can_fast_zero) (void *nxdata);
   int (*can_extents) (void *nxdata);
   int (*can_fua) (void *nxdata);
   int (*can_multi_conn) (void *nxdata);
@@ -139,6 +140,8 @@ struct nbdkit_filter {
                    void *handle);
   int (*can_zero) (struct nbdkit_next_ops *next_ops, void *nxdata,
                    void *handle);
+  int (*can_fast_zero) (struct nbdkit_next_ops *next_ops, void *nxdata,
+                        void *handle);
   int (*can_extents) (struct nbdkit_next_ops *next_ops, void *nxdata,
                       void *handle);
   int (*can_fua) (struct nbdkit_next_ops *next_ops, void *nxdata,
diff --git a/filters/blocksize/blocksize.c b/filters/blocksize/blocksize.c
index 0978887f..47638c74 100644
--- a/filters/blocksize/blocksize.c
+++ b/filters/blocksize/blocksize.c
@@ -307,6 +307,18 @@ blocksize_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
   uint32_t drop;
   bool need_flush = false;

+  if (flags & NBDKIT_FLAG_FAST_ZERO) {
+    /* If we have to split the transaction, an ENOTSUP fast failure in
+     * a later call would be unnecessarily delayed behind earlier
+     * calls; it's easier to just declare that anything that can't be
+     * done in one call to the plugin is not fast.
+     */
+    if ((offs | count) & (minblock - 1) || count > maxlen) {
+      *err = ENOTSUP;
+      return -1;
+    }
+  }
+
   if ((flags & NBDKIT_FLAG_FUA) &&
       next_ops->can_fua (nxdata) == NBDKIT_FUA_EMULATE) {
     flags &= ~NBDKIT_FLAG_FUA;
diff --git a/filters/cache/cache.c b/filters/cache/cache.c
index b5dbccd2..7c1d6c4f 100644
--- a/filters/cache/cache.c
+++ b/filters/cache/cache.c
@@ -250,6 +250,17 @@ cache_can_cache (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
   return NBDKIT_CACHE_NATIVE;
 }

+/* Override the plugin's .can_fast_zero, because our .zero is not fast */
+static int
+cache_can_fast_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
+                     void *handle)
+{
+  /* It is better to advertise support even when we always reject fast
+   * zero attempts.
+   */
+  return 1;
+}
+
 /* Read data. */
 static int
 cache_pread (struct nbdkit_next_ops *next_ops, void *nxdata,
@@ -418,6 +429,14 @@ cache_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
   int r;
   bool need_flush = false;

+  /* We are purposefully avoiding next_ops->zero, so a zero request is
+   * never faster than plain writes.
+   */
+  if (flags & NBDKIT_FLAG_FAST_ZERO) {
+    *err = ENOTSUP;
+    return -1;
+  }
+
   block = malloc (blksize);
   if (block == NULL) {
     *err = errno;
@@ -624,6 +643,7 @@ static struct nbdkit_filter filter = {
   .prepare           = cache_prepare,
   .get_size          = cache_get_size,
   .can_cache         = cache_can_cache,
+  .can_fast_zero     = cache_can_fast_zero,
   .pread             = cache_pread,
   .pwrite            = cache_pwrite,
   .zero              = cache_zero,
diff --git a/filters/cow/cow.c b/filters/cow/cow.c
index 9d91d432..a5c1f978 100644
--- a/filters/cow/cow.c
+++ b/filters/cow/cow.c
@@ -179,6 +179,17 @@ cow_can_cache (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
   return NBDKIT_FUA_NATIVE;
 }

+/* Override the plugin's .can_fast_zero, because our .zero is not fast */
+static int
+cow_can_fast_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
+                   void *handle)
+{
+  /* It is better to advertise support even when we always reject fast
+   * zero attempts.
+   */
+  return 1;
+}
+
 static int cow_flush (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle, uint32_t flags, int *err);

 /* Read data. */
@@ -340,6 +351,14 @@ cow_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
   uint64_t blknum, blkoffs;
   int r;

+  /* We are purposefully avoiding next_ops->zero, so a zero request is
+   * never faster than plain writes.
+   */
+  if (flags & NBDKIT_FLAG_FAST_ZERO) {
+    *err = ENOTSUP;
+    return -1;
+  }
+
   block = malloc (BLKSIZE);
   if (block == NULL) {
     *err = errno;
@@ -496,6 +515,7 @@ static struct nbdkit_filter filter = {
   .can_extents       = cow_can_extents,
   .can_fua           = cow_can_fua,
   .can_cache         = cow_can_cache,
+  .can_fast_zero     = cow_can_fast_zero,
   .pread             = cow_pread,
   .pwrite            = cow_pwrite,
   .zero              = cow_zero,
diff --git a/filters/delay/delay.c b/filters/delay/delay.c
index c92a12d7..207d101e 100644
--- a/filters/delay/delay.c
+++ b/filters/delay/delay.c
@@ -37,6 +37,8 @@
 #include <stdlib.h>
 #include <stdint.h>
 #include <string.h>
+#include <stdbool.h>
+#include <errno.h>

 #include <nbdkit-filter.h>

@@ -46,6 +48,7 @@ static int delay_zero_ms = 0;   /* zero delay (milliseconds) */
 static int delay_trim_ms = 0;   /* trim delay (milliseconds) */
 static int delay_extents_ms = 0;/* extents delay (milliseconds) */
 static int delay_cache_ms = 0;  /* cache delay (milliseconds) */
+static int delay_fast_zero = 1; /* whether delaying zero includes fast zero */

 static int
 parse_delay (const char *key, const char *value)
@@ -182,6 +185,12 @@ delay_config (nbdkit_next_config *next, void *nxdata,
       return -1;
     return 0;
   }
+  else if (strcmp (key, "delay-fast-zero") == 0) {
+    delay_fast_zero = nbdkit_parse_bool (value);
+    if (delay_fast_zero < 0)
+      return -1;
+    return 0;
+  }
   else
     return next (nxdata, key, value);
 }
@@ -194,7 +203,19 @@ delay_config (nbdkit_next_config *next, void *nxdata,
   "delay-trim=<NN>[ms]            Trim delay in seconds/milliseconds.\n" \
   "delay-extents=<NN>[ms]         Extents delay in seconds/milliseconds.\n" \
   "delay-cache=<NN>[ms]           Cache delay in seconds/milliseconds.\n" \
-  "wdelay=<NN>[ms]                Write, zero and trim delay in secs/msecs."
+  "wdelay=<NN>[ms]                Write, zero and trim delay in secs/msecs.\n" \
+  "delay-fast-zero=<BOOL>         Delay fast zero requests (default true).\n"
+
+/* Override the plugin's .can_fast_zero if needed */
+static int
+delay_can_fast_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
+                     void *handle)
+{
+  /* Advertise if we are handling fast zero requests locally */
+  if (delay_zero_ms && !delay_fast_zero)
+    return 1;
+  return next_ops->can_fast_zero (nxdata);
+}

 /* Read data. */
 static int
@@ -225,6 +246,10 @@ delay_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
             void *handle, uint32_t count, uint64_t offset, uint32_t flags,
             int *err)
 {
+  if ((flags & NBDKIT_FLAG_FAST_ZERO) && delay_zero_ms && !delay_fast_zero) {
+    *err = ENOTSUP;
+    return -1;
+  }
   if (zero_delay (err) == -1)
     return -1;
   return next_ops->zero (nxdata, count, offset, flags, err);
@@ -269,6 +294,7 @@ static struct nbdkit_filter filter = {
   .version           = PACKAGE_VERSION,
   .config            = delay_config,
   .config_help       = delay_config_help,
+  .can_fast_zero     = delay_can_fast_zero,
   .pread             = delay_pread,
   .pwrite            = delay_pwrite,
   .zero              = delay_zero,
diff --git a/filters/log/log.c b/filters/log/log.c
index 7cf741e1..95667c61 100644
--- a/filters/log/log.c
+++ b/filters/log/log.c
@@ -260,14 +260,15 @@ log_prepare (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
   int F = next_ops->can_fua (nxdata);
   int e = next_ops->can_extents (nxdata);
   int c = next_ops->can_cache (nxdata);
+  int Z = next_ops->can_fast_zero (nxdata);

   if (size < 0 || w < 0 || f < 0 || r < 0 || t < 0 || z < 0 || F < 0 ||
-      e < 0 || c < 0)
+      e < 0 || c < 0 || Z < 0)
     return -1;

   output (h, "Connect", 0, "size=0x%" PRIx64 " write=%d flush=%d "
-          "rotational=%d trim=%d zero=%d fua=%d extents=%d cache=%d",
-          size, w, f, r, t, z, F, e, c);
+          "rotational=%d trim=%d zero=%d fua=%d extents=%d cache=%d "
+          "fast_zero=%d", size, w, f, r, t, z, F, e, c, Z);
   return 0;
 }

@@ -360,10 +361,13 @@ log_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
   uint64_t id = get_id (h);
   int r;

-  assert (!(flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM)));
-  output (h, "Zero", id, "offset=0x%" PRIx64 " count=0x%x trim=%d fua=%d ...",
+  assert (!(flags & ~(NBDKIT_FLAG_FUA | NBDKIT_FLAG_MAY_TRIM |
+                      NBDKIT_FLAG_FAST_ZERO)));
+  output (h, "Zero", id,
+          "offset=0x%" PRIx64 " count=0x%x trim=%d fua=%d fast=%d...",
           offs, count, !!(flags & NBDKIT_FLAG_MAY_TRIM),
-          !!(flags & NBDKIT_FLAG_FUA));
+          !!(flags & NBDKIT_FLAG_FUA),
+          !!(flags & NBDKIT_FLAG_FAST_ZERO));
   r = next_ops->zero (nxdata, count, offs, flags, err);
   output_return (h, "...Zero", id, r, err);
   return r;
diff --git a/filters/nozero/nozero.c b/filters/nozero/nozero.c
index 964cce9f..e54f7c62 100644
--- a/filters/nozero/nozero.c
+++ b/filters/nozero/nozero.c
@@ -38,6 +38,7 @@
 #include <string.h>
 #include <stdbool.h>
 #include <assert.h>
+#include <errno.h>

 #include <nbdkit-filter.h>

@@ -49,8 +50,16 @@ static enum ZeroMode {
   NONE,
   EMULATE,
   NOTRIM,
+  PLUGIN,
 } zeromode;

+static enum FastZeroMode {
+  DEFAULT,
+  SLOW,
+  IGNORE,
+  NOFAST,
+} fastzeromode;
+
 static int
 nozero_config (nbdkit_next_config *next, void *nxdata,
                const char *key, const char *value)
@@ -60,17 +69,35 @@ nozero_config (nbdkit_next_config *next, void *nxdata,
       zeromode = EMULATE;
     else if (strcmp (value, "notrim") == 0)
       zeromode = NOTRIM;
+    else if (strcmp (value, "plugin") == 0)
+      zeromode = PLUGIN;
     else if (strcmp (value, "none") != 0) {
       nbdkit_error ("unknown zeromode '%s'", value);
       return -1;
     }
     return 0;
   }
+
+  if (strcmp (key, "fastzeromode") == 0) {
+    if (strcmp (value, "none") == 0)
+      fastzeromode = NOFAST;
+    else if (strcmp (value, "ignore") == 0)
+      fastzeromode = IGNORE;
+    else if (strcmp (value, "slow") == 0)
+      fastzeromode = SLOW;
+    else if (strcmp (value, "default") != 0) {
+      nbdkit_error ("unknown fastzeromode '%s'", value);
+      return -1;
+    }
+    return 0;
+  }
+
   return next (nxdata, key, value);
 }

 #define nozero_config_help \
-  "zeromode=<MODE>      Either 'none' (default), 'emulate', or 'notrim'.\n" \
+  "zeromode=<MODE>      One of 'none' (default), 'emulate', 'notrim', 'plugin'.\n" \
+  "fastzeromode=<MODE>  One of 'default', 'none', 'slow', 'ignore'.\n"

 /* Check that desired mode is supported by plugin. */
 static int
@@ -78,12 +105,13 @@ nozero_prepare (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
 {
   int r;

-  if (zeromode == NOTRIM) {
+  if (zeromode == NOTRIM || zeromode == PLUGIN) {
     r = next_ops->can_zero (nxdata);
     if (r == -1)
       return -1;
     if (!r) {
-      nbdkit_error ("zeromode 'notrim' requires plugin zero support");
+      nbdkit_error ("zeromode '%s' requires plugin zero support",
+                    zeromode == NOTRIM ? "notrim" : "plugin");
       return -1;
     }
   }
@@ -94,9 +122,22 @@ nozero_prepare (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
 static int
 nozero_can_zero (struct nbdkit_next_ops *next_ops, void *nxdata, void *handle)
 {
+  /* For NOTRIM and PLUGIN modes, we've already verified next_ops->can_zero */
   return zeromode != NONE;
 }

+/* Advertise desired FAST_ZERO mode. */
+static int
+nozero_can_fast_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
+                      void *handle)
+{
+  if (zeromode == NONE)
+    return 0;
+  if (zeromode != EMULATE && fastzeromode == DEFAULT)
+    return next_ops->can_fast_zero (nxdata);
+  return fastzeromode != NOFAST;
+}
+
 static int
 nozero_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
              void *handle, uint32_t count, uint64_t offs, uint32_t flags,
@@ -106,9 +147,21 @@ nozero_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
   bool need_flush = false;

   assert (zeromode != NONE);
-  flags &= ~NBDKIT_FLAG_MAY_TRIM;
+  if (flags & NBDKIT_FLAG_FAST_ZERO) {
+    assert (fastzeromode != NOFAST);
+    if (fastzeromode == SLOW ||
+        (fastzeromode == DEFAULT && zeromode == EMULATE)) {
+      *err = ENOTSUP;
+      return -1;
+    }
+    if (fastzeromode == IGNORE)
+      flags &= ~NBDKIT_FLAG_FAST_ZERO;
+  }

   if (zeromode == NOTRIM)
+    flags &= ~NBDKIT_FLAG_MAY_TRIM;
+
+  if (zeromode != EMULATE)
     return next_ops->zero (nxdata, count, offs, flags, err);

   if (flags & NBDKIT_FLAG_FUA) {
@@ -144,6 +197,7 @@ static struct nbdkit_filter filter = {
   .config_help       = nozero_config_help,
   .prepare           = nozero_prepare,
   .can_zero          = nozero_can_zero,
+  .can_fast_zero     = nozero_can_fast_zero,
   .zero              = nozero_zero,
 };

diff --git a/filters/truncate/truncate.c b/filters/truncate/truncate.c
index 93d8f074..47d70b31 100644
--- a/filters/truncate/truncate.c
+++ b/filters/truncate/truncate.c
@@ -201,6 +201,14 @@ truncate_get_size (struct nbdkit_next_ops *next_ops, void *nxdata,
   return h->size;
 }

+/* Override the plugin's .can_fast_zero, because zeroing a tail is fast. */
+static int
+truncate_can_fast_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
+                        void *handle)
+{
+  return 1;
+}
+
 /* Read data. */
 static int
 truncate_pread (struct nbdkit_next_ops *next_ops, void *nxdata,
@@ -297,6 +305,12 @@ truncate_zero (struct nbdkit_next_ops *next_ops, void *nxdata,
       n = count;
     else
       n = h->real_size - offset;
+    if (flags & NBDKIT_FLAG_FAST_ZERO &&
+        next_ops->can_fast_zero (nxdata) <= 0) {
+      /* TODO: Cache per connection? */
+      *err = ENOTSUP;
+      return -1;
+    }
     return next_ops->zero (nxdata, n, offset, flags, err);
   }
   return 0;
@@ -392,6 +406,7 @@ static struct nbdkit_filter filter = {
   .close             = truncate_close,
   .prepare           = truncate_prepare,
   .get_size          = truncate_get_size,
+  .can_fast_zero     = truncate_can_fast_zero,
   .pread             = truncate_pread,
   .pwrite            = truncate_pwrite,
   .trim              = truncate_trim,
diff --git a/tests/test-fua.sh b/tests/test-fua.sh
index c0d82db7..1c869e96 100755
--- a/tests/test-fua.sh
+++ b/tests/test-fua.sh
@@ -106,14 +106,14 @@ test $(grep -c 'connection=1 Flush' fua1.log) -lt \
 # all earlier parts of the transaction do not have fua
 flush1=$(grep -c 'connection=1 Flush' fua2.log || :)
 flush2=$(grep -c 'connection=2 Flush' fua2.log || :)
-fua=$(grep -c 'connection=2.*fua=1 \.' fua2.log || :)
+fua=$(grep -c 'connection=2.*fua=1 .*\.' fua2.log || :)
 test $(( $flush2 - $flush1 + $fua )) = 2

 # Test 3: every part of split has fua, and no flushes are added
 flush1=$(grep -c 'connection=1 Flush' fua3.log || :)
 flush2=$(grep -c 'connection=2 Flush' fua3.log || :)
 test $flush1 = $flush2
-test $(grep -c 'connection=2.*fua=1 \.' fua3.log) = 32
+test $(grep -c 'connection=2.*fua=1 .*\.' fua3.log) = 32

 # Test 4: flush is no-op, and every transaction has fua
 if grep 'fua=0' fua4.log; then
-- 
2.21.0

