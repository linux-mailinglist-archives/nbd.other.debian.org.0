Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DF739628D1D
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE6F92067D; Mon, 14 Nov 2022 23:05:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:19 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAC2A20668
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nAk1tWnuYDl5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 96C932067A
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qUQF2DlBRbwRO1HcKnhprmAUuC1nB/mgXeuD1zXdH8=;
	b=Cwfz76dudASZQp6RQbMUuxtJ5XVm18tPvf7PDNvtSlzY3lO1KJ3EOJbvOs6A+EKEBkzU03
	KWxfdVAQuka1wxyXyy8SclpY8jCnUY4L7dht7qKHzfeZNvW59qV7UfP9dUEH0EWV6uaAsb
	Di1lkNqmoJRBumDNeByuAFKUqyldM78=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-BvEPDguPN5Ouex-5iCRoOg-1; Mon, 14 Nov 2022 17:48:58 -0500
X-MC-Unique: BvEPDguPN5Ouex-5iCRoOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA59729DD9BC;
	Mon, 14 Nov 2022 22:48:57 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 346FF40AE7EF;
	Mon, 14 Nov 2022 22:48:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 04/15] nbd: Add types for extended headers
Date: Mon, 14 Nov 2022 16:48:37 -0600
Message-Id: <20221114224848.2186298-5-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nH34Uf01OTK.A.3AE.vmscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2288
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-5-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:19 +0000 (UTC)

Add the constants and structs necessary for later patches to start
implementing the NBD_OPT_EXTENDED_HEADERS extension in both the client
and server, matching recent commit XXX[*] in the upstream nbd project.
This patch does not change any existing behavior, but merely sets the
stage.

This patch does not change the status quo that neither the client nor
server use a packed-struct representation for the request header.

Signed-off-by: Eric Blake <eblake@redhat.com>

---
[*]tweak commit message once nbd commit id available
---
 docs/interop/nbd.txt |  1 +
 include/block/nbd.h  | 74 ++++++++++++++++++++++++++++++++------------
 nbd/common.c         | 10 +++++-
 3 files changed, 65 insertions(+), 20 deletions(-)

diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index f5ca25174a..988c072697 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -69,3 +69,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:", NBD_CMD_CACHE
 NBD_CMD_FLAG_FAST_ZERO
 * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
 * 7.1: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
+* 7.2: NBD_OPT_EXTENDED_HEADERS
diff --git a/include/block/nbd.h b/include/block/nbd.h
index e357452a57..357121ce76 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -78,13 +78,24 @@ typedef struct NBDStructuredReplyChunk {
     uint32_t length; /* length of payload */
 } QEMU_PACKED NBDStructuredReplyChunk;

+typedef struct NBDExtendedReplyChunk {
+    uint32_t magic;  /* NBD_EXTENDED_REPLY_MAGIC */
+    uint16_t flags;  /* combination of NBD_REPLY_FLAG_* */
+    uint16_t type;   /* NBD_REPLY_TYPE_* */
+    uint64_t handle; /* request handle */
+    uint64_t offset; /* request offset */
+    uint64_t length; /* length of payload */
+} QEMU_PACKED NBDExtendedReplyChunk;
+
 typedef union NBDReply {
     NBDSimpleReply simple;
     NBDStructuredReplyChunk structured;
+    NBDExtendedReplyChunk extended;
     struct {
-        /* @magic and @handle fields have the same offset and size both in
-         * simple reply and structured reply chunk, so let them be accessible
-         * without ".simple." or ".structured." specification
+        /*
+         * @magic and @handle fields have the same offset and size in all
+         * forms of replies, so let them be accessible without ".simple.",
+         * ".structured.", or ".extended." specifications.
          */
         uint32_t magic;
         uint32_t _skip;
@@ -117,15 +128,29 @@ typedef struct NBDStructuredError {
 typedef struct NBDStructuredMeta {
     /* header's length >= 12 (at least one extent) */
     uint32_t context_id;
-    /* extents follows */
+    /* NBDExtent extents[] follows, array length implied by header */
 } QEMU_PACKED NBDStructuredMeta;

-/* Extent chunk for NBD_REPLY_TYPE_BLOCK_STATUS */
+/* Extent array for NBD_REPLY_TYPE_BLOCK_STATUS */
 typedef struct NBDExtent {
     uint32_t length;
     uint32_t flags; /* NBD_STATE_* */
 } QEMU_PACKED NBDExtent;

+/* Header of NBD_REPLY_TYPE_BLOCK_STATUS_EXT */
+typedef struct NBDStructuredMetaExt {
+    /* header's length >= 24 (at least one extent) */
+    uint32_t context_id;
+    uint32_t count; /* header length must be count * 16 + 8 */
+    /* NBDExtentExt extents[count] follows */
+} QEMU_PACKED NBDStructuredMetaExt;
+
+/* Extent array for NBD_REPLY_TYPE_BLOCK_STATUS_EXT */
+typedef struct NBDExtentExt {
+    uint64_t length;
+    uint64_t flags; /* NBD_STATE_* */
+} QEMU_PACKED NBDExtentExt;
+
 /* Transmission (export) flags: sent from server to client during handshake,
    but describe what will happen during transmission */
 enum {
@@ -178,6 +203,7 @@ enum {
 #define NBD_OPT_STRUCTURED_REPLY  (8)
 #define NBD_OPT_LIST_META_CONTEXT (9)
 #define NBD_OPT_SET_META_CONTEXT  (10)
+#define NBD_OPT_EXTENDED_HEADERS  (11)

 /* Option reply types. */
 #define NBD_REP_ERR(value) ((UINT32_C(1) << 31) | (value))
@@ -195,6 +221,8 @@ enum {
 #define NBD_REP_ERR_UNKNOWN         NBD_REP_ERR(6)  /* Export unknown */
 #define NBD_REP_ERR_SHUTDOWN        NBD_REP_ERR(7)  /* Server shutting down */
 #define NBD_REP_ERR_BLOCK_SIZE_REQD NBD_REP_ERR(8)  /* Need INFO_BLOCK_SIZE */
+#define NBD_REP_ERR_TOO_BIG         NBD_REP_ERR(9)  /* Payload size overflow */
+#define NBD_REP_ERR_EXT_HEADER_REQD NBD_REP_ERR(10) /* Need extended headers */

 /* Info types, used during NBD_REP_INFO */
 #define NBD_INFO_EXPORT         0
@@ -203,12 +231,14 @@ enum {
 #define NBD_INFO_BLOCK_SIZE     3

 /* Request flags, sent from client to server during transmission phase */
-#define NBD_CMD_FLAG_FUA        (1 << 0) /* 'force unit access' during write */
-#define NBD_CMD_FLAG_NO_HOLE    (1 << 1) /* don't punch hole on zero run */
-#define NBD_CMD_FLAG_DF         (1 << 2) /* don't fragment structured read */
-#define NBD_CMD_FLAG_REQ_ONE    (1 << 3) /* only one extent in BLOCK_STATUS
-                                          * reply chunk */
-#define NBD_CMD_FLAG_FAST_ZERO  (1 << 4) /* fail if WRITE_ZEROES is not fast */
+#define NBD_CMD_FLAG_FUA         (1 << 0) /* 'force unit access' during write */
+#define NBD_CMD_FLAG_NO_HOLE     (1 << 1) /* don't punch hole on zero run */
+#define NBD_CMD_FLAG_DF          (1 << 2) /* don't fragment structured read */
+#define NBD_CMD_FLAG_REQ_ONE     (1 << 3) \
+    /* only one extent in BLOCK_STATUS reply chunk */
+#define NBD_CMD_FLAG_FAST_ZERO   (1 << 4) /* fail if WRITE_ZEROES is not fast */
+#define NBD_CMD_FLAG_PAYLOAD_LEN (1 << 5) \
+    /* length describes payload, not effect; only with ext header */

 /* Supported request types */
 enum {
@@ -234,12 +264,17 @@ enum {
  */
 #define NBD_MAX_STRING_SIZE 4096

-/* Transmission request structure */
+/* Two types of request structures, a given client will only use 1 */
 #define NBD_REQUEST_MAGIC           0x25609513
+#define NBD_EXTENDED_REQUEST_MAGIC  0x21e41c71

-/* Two types of reply structures */
+/*
+ * Three types of reply structures, but what a client expects depends
+ * on NBD_OPT_STRUCTURED_REPLY and NBD_OPT_EXTENDED_HEADERS.
+ */
 #define NBD_SIMPLE_REPLY_MAGIC      0x67446698
 #define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+#define NBD_EXTENDED_REPLY_MAGIC    0x6e8a278c

 /* Structured reply flags */
 #define NBD_REPLY_FLAG_DONE          (1 << 0) /* This reply-chunk is last */
@@ -247,12 +282,13 @@ enum {
 /* Structured reply types */
 #define NBD_REPLY_ERR(value)         ((1 << 15) | (value))

-#define NBD_REPLY_TYPE_NONE          0
-#define NBD_REPLY_TYPE_OFFSET_DATA   1
-#define NBD_REPLY_TYPE_OFFSET_HOLE   2
-#define NBD_REPLY_TYPE_BLOCK_STATUS  5
-#define NBD_REPLY_TYPE_ERROR         NBD_REPLY_ERR(1)
-#define NBD_REPLY_TYPE_ERROR_OFFSET  NBD_REPLY_ERR(2)
+#define NBD_REPLY_TYPE_NONE              0
+#define NBD_REPLY_TYPE_OFFSET_DATA       1
+#define NBD_REPLY_TYPE_OFFSET_HOLE       2
+#define NBD_REPLY_TYPE_BLOCK_STATUS      5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT  6
+#define NBD_REPLY_TYPE_ERROR             NBD_REPLY_ERR(1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET      NBD_REPLY_ERR(2)

 /* Extent flags for base:allocation in NBD_REPLY_TYPE_BLOCK_STATUS */
 #define NBD_STATE_HOLE (1 << 0)
diff --git a/nbd/common.c b/nbd/common.c
index ddfe7d1183..137466defd 100644
--- a/nbd/common.c
+++ b/nbd/common.c
@@ -79,6 +79,8 @@ const char *nbd_opt_lookup(uint32_t opt)
         return "list meta context";
     case NBD_OPT_SET_META_CONTEXT:
         return "set meta context";
+    case NBD_OPT_EXTENDED_HEADERS:
+        return "extended headers";
     default:
         return "<unknown>";
     }
@@ -112,6 +114,10 @@ const char *nbd_rep_lookup(uint32_t rep)
         return "server shutting down";
     case NBD_REP_ERR_BLOCK_SIZE_REQD:
         return "block size required";
+    case NBD_REP_ERR_TOO_BIG:
+        return "option payload too big";
+    case NBD_REP_ERR_EXT_HEADER_REQD:
+        return "extended headers required";
     default:
         return "<unknown>";
     }
@@ -170,7 +176,9 @@ const char *nbd_reply_type_lookup(uint16_t type)
     case NBD_REPLY_TYPE_OFFSET_HOLE:
         return "hole";
     case NBD_REPLY_TYPE_BLOCK_STATUS:
-        return "block status";
+        return "block status (32-bit)";
+    case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+        return "block status (64-bit)";
     case NBD_REPLY_TYPE_ERROR:
         return "generic error";
     case NBD_REPLY_TYPE_ERROR_OFFSET:
-- 
2.38.1

