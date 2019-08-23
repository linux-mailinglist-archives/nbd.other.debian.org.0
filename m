Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6B9B234
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:37:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CE850204EF; Fri, 23 Aug 2019 14:37:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:37:46 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 535CF20449
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.86 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XHAhphF66oiR for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EC7ED204E7
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D76D081F0F;
	Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB27D6CE60;
	Fri, 23 Aug 2019 14:37:31 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH 1/5] nbd: Improve per-export flag handling in server
Date: Fri, 23 Aug 2019 09:37:22 -0500
Message-Id: <20190823143726.27062-2-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 23 Aug 2019 14:37:32 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FjTJ68gY4sB.A.VZC.6o_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/634
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-2-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:37:46 +0000 (UTC)

When creating a read-only image, we are still advertising support for
TRIM and WRITE_ZEROES to the client, even though the client should not
be issuing those commands.  But seeing this requires looking across
multiple functions:

All callers to nbd_export_new() passed a single flag based solely on
whether the export allows writes.  Later, we then pass a constant set
of flags to nbd_negotiate_options() (namely, the set of flags which we
always support, at least for writable images), which is then further
dynamically modified based on client requests for structured options.
Finally, when processing NBD_OPT_EXPORT_NAME or NBD_OPT_EXPORT_GO we
bitwise-or the original caller's flag with the runtime set of flags
we've built up over several functions.

Let's refactor things to instead compute a baseline of flags as soon
as possible, in nbd_export_new(), and changing the signature for the
callers to pass in a simpler bool rather than having to figure out
flags.  We can then get rid of the 'myflags' parameter to various
functions, and instead refer to client for everything we need (we
still have to perform a bitwise-OR during NBD_OPT_EXPORT_NAME and
NBD_OPT_EXPORT_GO, but it's easier to see what is being computed).
This lets us quit advertising senseless flags for read-only images, as
well as making the next patch for exposing FAST_ZERO support easier to
write.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  2 +-
 blockdev-nbd.c      |  3 +--
 nbd/server.c        | 62 +++++++++++++++++++++++++--------------------
 qemu-nbd.c          |  6 ++---
 4 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 991fd52a5134..2c87b42dfd48 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -326,7 +326,7 @@ typedef struct NBDClient NBDClient;

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *desc,
-                          const char *bitmap, uint16_t nbdflags, bool shared,
+                          const char *bitmap, bool readonly, bool shared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp);
 void nbd_export_close(NBDExport *exp);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index ecfa2ef0adb5..1cdffab4fce1 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -187,8 +187,7 @@ void qmp_nbd_server_add(const char *device, bool has_name, const char *name,
         writable = false;
     }

-    exp = nbd_export_new(bs, 0, len, name, NULL, bitmap,
-                         writable ? 0 : NBD_FLAG_READ_ONLY, !writable,
+    exp = nbd_export_new(bs, 0, len, name, NULL, bitmap, !writable, !writable,
                          NULL, false, on_eject_blk, errp);
     if (!exp) {
         return;
diff --git a/nbd/server.c b/nbd/server.c
index 0fb41c6c50ea..b5577828aa44 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -423,14 +423,14 @@ static void nbd_check_meta_export(NBDClient *client)

 /* Send a reply to NBD_OPT_EXPORT_NAME.
  * Return -errno on error, 0 on success. */
-static int nbd_negotiate_handle_export_name(NBDClient *client,
-                                            uint16_t myflags, bool no_zeroes,
+static int nbd_negotiate_handle_export_name(NBDClient *client, bool no_zeroes,
                                             Error **errp)
 {
     char name[NBD_MAX_NAME_SIZE + 1];
     char buf[NBD_REPLY_EXPORT_NAME_SIZE] = "";
     size_t len;
     int ret;
+    uint16_t myflags;

     /* Client sends:
         [20 ..  xx]   export name (length bytes)
@@ -458,10 +458,13 @@ static int nbd_negotiate_handle_export_name(NBDClient *client,
         return -EINVAL;
     }

-    trace_nbd_negotiate_new_style_size_flags(client->exp->size,
-                                             client->exp->nbdflags | myflags);
+    myflags = client->exp->nbdflags;
+    if (client->structured_reply) {
+        myflags |= NBD_FLAG_SEND_DF;
+    }
+    trace_nbd_negotiate_new_style_size_flags(client->exp->size, myflags);
     stq_be_p(buf, client->exp->size);
-    stw_be_p(buf + 8, client->exp->nbdflags | myflags);
+    stw_be_p(buf + 8, myflags);
     len = no_zeroes ? 10 : sizeof(buf);
     ret = nbd_write(client->ioc, buf, len, errp);
     if (ret < 0) {
@@ -526,8 +529,7 @@ static int nbd_reject_length(NBDClient *client, bool fatal, Error **errp)
 /* Handle NBD_OPT_INFO and NBD_OPT_GO.
  * Return -errno on error, 0 if ready for next option, and 1 to move
  * into transmission phase.  */
-static int nbd_negotiate_handle_info(NBDClient *client, uint16_t myflags,
-                                     Error **errp)
+static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
 {
     int rc;
     char name[NBD_MAX_NAME_SIZE + 1];
@@ -540,6 +542,7 @@ static int nbd_negotiate_handle_info(NBDClient *client, uint16_t myflags,
     uint32_t sizes[3];
     char buf[sizeof(uint64_t) + sizeof(uint16_t)];
     uint32_t check_align = 0;
+    uint16_t myflags;

     /* Client sends:
         4 bytes: L, name length (can be 0)
@@ -637,10 +640,13 @@ static int nbd_negotiate_handle_info(NBDClient *client, uint16_t myflags,
     }

     /* Send NBD_INFO_EXPORT always */
-    trace_nbd_negotiate_new_style_size_flags(exp->size,
-                                             exp->nbdflags | myflags);
+    myflags = exp->nbdflags;
+    if (client->structured_reply) {
+        myflags |= NBD_FLAG_SEND_DF;
+    }
+    trace_nbd_negotiate_new_style_size_flags(exp->size, myflags);
     stq_be_p(buf, exp->size);
-    stw_be_p(buf + 8, exp->nbdflags | myflags);
+    stw_be_p(buf + 8, myflags);
     rc = nbd_negotiate_send_info(client, NBD_INFO_EXPORT,
                                  sizeof(buf), buf, errp);
     if (rc < 0) {
@@ -1037,8 +1043,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
  * 1       if client sent NBD_OPT_ABORT, i.e. on valid disconnect,
  *         errp is not set
  */
-static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
-                                 Error **errp)
+static int nbd_negotiate_options(NBDClient *client, Error **errp)
 {
     uint32_t flags;
     bool fixedNewstyle = false;
@@ -1172,13 +1177,12 @@ static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
                 return 1;

             case NBD_OPT_EXPORT_NAME:
-                return nbd_negotiate_handle_export_name(client,
-                                                        myflags, no_zeroes,
+                return nbd_negotiate_handle_export_name(client, no_zeroes,
                                                         errp);

             case NBD_OPT_INFO:
             case NBD_OPT_GO:
-                ret = nbd_negotiate_handle_info(client, myflags, errp);
+                ret = nbd_negotiate_handle_info(client, errp);
                 if (ret == 1) {
                     assert(option == NBD_OPT_GO);
                     return 0;
@@ -1209,7 +1213,6 @@ static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
                 } else {
                     ret = nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
                     client->structured_reply = true;
-                    myflags |= NBD_FLAG_SEND_DF;
                 }
                 break;

@@ -1232,8 +1235,7 @@ static int nbd_negotiate_options(NBDClient *client, uint16_t myflags,
              */
             switch (option) {
             case NBD_OPT_EXPORT_NAME:
-                return nbd_negotiate_handle_export_name(client,
-                                                        myflags, no_zeroes,
+                return nbd_negotiate_handle_export_name(client, no_zeroes,
                                                         errp);

             default:
@@ -1259,9 +1261,6 @@ static coroutine_fn int nbd_negotiate(NBDClient *client, Error **errp)
 {
     char buf[NBD_OLDSTYLE_NEGOTIATE_SIZE] = "";
     int ret;
-    const uint16_t myflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_TRIM |
-                              NBD_FLAG_SEND_FLUSH | NBD_FLAG_SEND_FUA |
-                              NBD_FLAG_SEND_WRITE_ZEROES | NBD_FLAG_SEND_CACHE);

     /* Old style negotiation header, no room for options
         [ 0 ..   7]   passwd       ("NBDMAGIC")
@@ -1289,7 +1288,7 @@ static coroutine_fn int nbd_negotiate(NBDClient *client, Error **errp)
         error_prepend(errp, "write failed: ");
         return -EINVAL;
     }
-    ret = nbd_negotiate_options(client, myflags, errp);
+    ret = nbd_negotiate_options(client, errp);
     if (ret != 0) {
         if (ret < 0) {
             error_prepend(errp, "option negotiation failed: ");
@@ -1461,7 +1460,7 @@ static void nbd_eject_notifier(Notifier *n, void *data)

 NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
                           uint64_t size, const char *name, const char *desc,
-                          const char *bitmap, uint16_t nbdflags, bool shared,
+                          const char *bitmap, bool readonly, bool shared,
                           void (*close)(NBDExport *), bool writethrough,
                           BlockBackend *on_eject_blk, Error **errp)
 {
@@ -1485,10 +1484,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
     /* Don't allow resize while the NBD server is running, otherwise we don't
      * care what happens with the node. */
     perm = BLK_PERM_CONSISTENT_READ;
-    if ((nbdflags & NBD_FLAG_READ_ONLY) == 0) {
+    if (!readonly) {
         perm |= BLK_PERM_WRITE;
-    } else if (shared) {
-        nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
     }
     blk = blk_new(bdrv_get_aio_context(bs), perm,
                   BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
@@ -1507,7 +1504,16 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
     exp->dev_offset = dev_offset;
     exp->name = g_strdup(name);
     exp->description = g_strdup(desc);
-    exp->nbdflags = nbdflags;
+    exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
+                     NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
+    if (readonly) {
+        exp->nbdflags |= NBD_FLAG_READ_ONLY;
+        if (shared) {
+            exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
+        }
+    } else {
+        exp->nbdflags |= NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES;
+    }
     assert(size <= INT64_MAX - dev_offset);
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);

@@ -1532,7 +1538,7 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
             goto fail;
         }

-        if ((nbdflags & NBD_FLAG_READ_ONLY) && bdrv_is_writable(bs) &&
+        if (readonly && bdrv_is_writable(bs) &&
             bdrv_dirty_bitmap_enabled(bm)) {
             error_setg(errp,
                        "Enabled bitmap '%s' incompatible with readonly export",
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 55f5ceaf5c92..079702bb837f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -600,7 +600,7 @@ int main(int argc, char **argv)
     BlockBackend *blk;
     BlockDriverState *bs;
     uint64_t dev_offset = 0;
-    uint16_t nbdflags = 0;
+    bool readonly = false;
     bool disconnect = false;
     const char *bindto = NULL;
     const char *port = NULL;
@@ -782,7 +782,7 @@ int main(int argc, char **argv)
             }
             /* fall through */
         case 'r':
-            nbdflags |= NBD_FLAG_READ_ONLY;
+            readonly = true;
             flags &= ~BDRV_O_RDWR;
             break;
         case 'P':
@@ -1173,7 +1173,7 @@ int main(int argc, char **argv)
     }

     export = nbd_export_new(bs, dev_offset, fd_size, export_name,
-                            export_description, bitmap, nbdflags, shared > 1,
+                            export_description, bitmap, readonly, shared > 1,
                             nbd_export_closed, writethrough, NULL,
                             &error_fatal);

-- 
2.21.0

