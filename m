Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA359B235
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:37:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8094B20376; Fri, 23 Aug 2019 14:37:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:37:51 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D4C5E204F5
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gDzWep-u251d for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:37 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BA1E2204EF
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91B882A09D4;
	Fri, 23 Aug 2019 14:37:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14EA66CE58;
	Fri, 23 Aug 2019 14:37:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
Date: Fri, 23 Aug 2019 09:37:23 -0500
Message-Id: <20190823143726.27062-3-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 23 Aug 2019 14:37:33 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <siNlpl23rcL.A.MgC._o_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/635
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-3-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:37:51 +0000 (UTC)

Commit fe0480d6 and friends added BDRV_REQ_NO_FALLBACK as a way to
avoid wasting time on a preliminary write-zero request that will later
be rewritten by actual data, if it is known that the write-zero
request will use a slow fallback; but in doing so, could not optimize
for NBD.  The NBD specification is now considering an extension that
will allow passing on those semantics; this patch updates the new
protocol bits and 'qemu-nbd --list' output to recognize the bit, as
well as the new errno value possible when using the new flag; while
upcoming patches will improve the client to use the feature when
present, and the server to advertise support for it.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/nbd.txt | 3 ++-
 include/block/nbd.h  | 4 ++++
 nbd/common.c         | 5 +++++
 nbd/server.c         | 2 ++
 qemu-nbd.c           | 1 +
 5 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 6dfec7f47647..45118809618e 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -53,4 +53,5 @@ the operation of that feature.
 * 2.12: NBD_CMD_BLOCK_STATUS for "base:allocation"
 * 3.0: NBD_OPT_STARTTLS with TLS Pre-Shared Keys (PSK),
 NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
-* 4.2: NBD_FLAG_CAN_MULTI_CONN for sharable read-only exports
+* 4.2: NBD_FLAG_CAN_MULTI_CONN for sharable read-only exports,
+NBD_CMD_FLAG_FAST_ZERO
diff --git a/include/block/nbd.h b/include/block/nbd.h
index 2c87b42dfd48..21550747cf35 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -140,6 +140,7 @@ enum {
     NBD_FLAG_CAN_MULTI_CONN_BIT     =  8, /* Multi-client cache consistent */
     NBD_FLAG_SEND_RESIZE_BIT        =  9, /* Send resize */
     NBD_FLAG_SEND_CACHE_BIT         = 10, /* Send CACHE (prefetch) */
+    NBD_FLAG_SEND_FAST_ZERO_BIT     = 11, /* FAST_ZERO flag for WRITE_ZEROES */
 };

 #define NBD_FLAG_HAS_FLAGS         (1 << NBD_FLAG_HAS_FLAGS_BIT)
@@ -153,6 +154,7 @@ enum {
 #define NBD_FLAG_CAN_MULTI_CONN    (1 << NBD_FLAG_CAN_MULTI_CONN_BIT)
 #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
 #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
+#define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)

 /* New-style handshake (global) flags, sent from server to client, and
    control what will happen during handshake phase. */
@@ -205,6 +207,7 @@ enum {
 #define NBD_CMD_FLAG_DF         (1 << 2) /* don't fragment structured read */
 #define NBD_CMD_FLAG_REQ_ONE    (1 << 3) /* only one extent in BLOCK_STATUS
                                           * reply chunk */
+#define NBD_CMD_FLAG_FAST_ZERO  (1 << 4) /* fail if WRITE_ZEROES is not fast */

 /* Supported request types */
 enum {
@@ -270,6 +273,7 @@ static inline bool nbd_reply_type_is_error(int type)
 #define NBD_EINVAL     22
 #define NBD_ENOSPC     28
 #define NBD_EOVERFLOW  75
+#define NBD_ENOTSUP    95
 #define NBD_ESHUTDOWN  108

 /* Details collected by NBD_OPT_EXPORT_NAME and NBD_OPT_GO */
diff --git a/nbd/common.c b/nbd/common.c
index cc8b278e541d..ddfe7d118371 100644
--- a/nbd/common.c
+++ b/nbd/common.c
@@ -201,6 +201,8 @@ const char *nbd_err_lookup(int err)
         return "ENOSPC";
     case NBD_EOVERFLOW:
         return "EOVERFLOW";
+    case NBD_ENOTSUP:
+        return "ENOTSUP";
     case NBD_ESHUTDOWN:
         return "ESHUTDOWN";
     default:
@@ -231,6 +233,9 @@ int nbd_errno_to_system_errno(int err)
     case NBD_EOVERFLOW:
         ret = EOVERFLOW;
         break;
+    case NBD_ENOTSUP:
+        ret = ENOTSUP;
+        break;
     case NBD_ESHUTDOWN:
         ret = ESHUTDOWN;
         break;
diff --git a/nbd/server.c b/nbd/server.c
index b5577828aa44..981bc3cb1151 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -55,6 +55,8 @@ static int system_errno_to_nbd_errno(int err)
         return NBD_ENOSPC;
     case EOVERFLOW:
         return NBD_EOVERFLOW;
+    case ENOTSUP:
+        return NBD_ENOTSUP;
     case ESHUTDOWN:
         return NBD_ESHUTDOWN;
     case EINVAL:
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 079702bb837f..dce52f564b5a 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -294,6 +294,7 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
                 [NBD_FLAG_CAN_MULTI_CONN_BIT]       = "multi",
                 [NBD_FLAG_SEND_RESIZE_BIT]          = "resize",
                 [NBD_FLAG_SEND_CACHE_BIT]           = "cache",
+                [NBD_FLAG_SEND_FAST_ZERO_BIT]       = "fast-zero",
             };

             printf("  size:  %" PRIu64 "\n", list[i].size);
-- 
2.21.0

