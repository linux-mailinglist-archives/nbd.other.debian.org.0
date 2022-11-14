Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB8628CD6
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:01:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 580D120668; Mon, 14 Nov 2022 23:01:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:01:08 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 0BD552067D
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:59:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mMb68Nn-GcU3 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:59:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CDB3920689
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ke/C9mzfSwkCq8UrXJ5GbnBHrV042sMz47vbHjQG3zw=;
	b=iPDoh0jPBjwbMT3ps8g+Q9TvuG3vkIaI7db0AICct3hw5WxO0Xu6Mf91BFQHCMz7U7q37T
	MJtnRK2Cuf4nTfPF7eXzrUZpxs+VJZXrqCE+sV+3H8VzY2LDsrUod0cefdDbDlm+i0dS12
	wuTeDqDqE1fOdggQ/YUHdLGGquRA9II=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-KsX07whzO0-Ztc0ZUNGaqA-1; Mon, 14 Nov 2022 17:52:03 -0500
X-MC-Unique: KsX07whzO0-Ztc0ZUNGaqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9465B87B2A4;
	Mon, 14 Nov 2022 22:52:03 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 302DE40E9786;
	Mon, 14 Nov 2022 22:52:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 03/23] protocol: Add definitions for extended headers
Date: Mon, 14 Nov 2022 16:51:38 -0600
Message-Id: <20221114225158.2186742-4-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_H1JqMWsNlH.A.3HD.0iscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2273
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-4-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:01:08 +0000 (UTC)

Add the magic numbers and new structs necessary to implement the NBD
protocol extension of extended headers providing 64-bit lengths.  This
corresponds to upstream nbd commits XXX-XXX[*].

---
[*] FIXME update commit ids before pushing
---
 lib/nbd-protocol.h | 66 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index 4400d3ab..ac569a11 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -124,6 +124,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_OPT_STRUCTURED_REPLY   8
 #define NBD_OPT_LIST_META_CONTEXT  9
 #define NBD_OPT_SET_META_CONTEXT   10
+#define NBD_OPT_EXTENDED_HEADERS   11

 #define NBD_REP_ERR(val) (0x80000000 | (val))
 #define NBD_REP_IS_ERR(val) (!!((val) & 0x80000000))
@@ -141,6 +142,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_REP_ERR_SHUTDOWN         NBD_REP_ERR (7)
 #define NBD_REP_ERR_BLOCK_SIZE_REQD  NBD_REP_ERR (8)
 #define NBD_REP_ERR_TOO_BIG          NBD_REP_ERR (9)
+#define NBD_REP_ERR_EXT_HEADER_REQD  NBD_REP_ERR (10)

 #define NBD_INFO_EXPORT      0
 #define NBD_INFO_NAME        1
@@ -182,16 +184,26 @@ struct nbd_fixed_new_option_reply_meta_context {
   /* followed by a string */
 } NBD_ATTRIBUTE_PACKED;

-/* Request (client -> server). */
+/* Compact request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
-  uint16_t flags;               /* Request flags. */
-  uint16_t type;                /* Request type. */
+  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
+  uint16_t type;                /* Request type: NBD_CMD_*. */
   uint64_t handle;              /* Opaque handle. */
   uint64_t offset;              /* Request offset. */
   uint32_t count;               /* Request length. */
 } NBD_ATTRIBUTE_PACKED;

+/* Extended request (client -> server). */
+struct nbd_request_ext {
+  uint32_t magic;               /* NBD_EXTENDED_REQUEST_MAGIC. */
+  uint16_t flags;               /* Request flags: NBD_CMD_FLAG_*. */
+  uint16_t type;                /* Request type: NBD_CMD_*. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Request offset. */
+  uint64_t count;               /* Request effect or payload length. */
+} NBD_ATTRIBUTE_PACKED;
+
 /* Simple reply (server -> client). */
 struct nbd_simple_reply {
   uint32_t magic;               /* NBD_SIMPLE_REPLY_MAGIC. */
@@ -208,6 +220,16 @@ struct nbd_structured_reply {
   uint32_t length;              /* Length of payload which follows. */
 } NBD_ATTRIBUTE_PACKED;

+/* Extended reply (server -> client). */
+struct nbd_extended_reply {
+  uint32_t magic;               /* NBD_EXTENDED_REPLY_MAGIC. */
+  uint16_t flags;               /* NBD_REPLY_FLAG_* */
+  uint16_t type;                /* NBD_REPLY_TYPE_* */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Client's offset. */
+  uint64_t length;              /* Length of payload which follows. */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_offset_data {
   uint64_t offset;              /* offset */
   /* Followed by data. */
@@ -224,11 +246,23 @@ struct nbd_block_descriptor {
   uint32_t status_flags;        /* block type (hole etc) */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS_EXT block descriptor. */
+struct nbd_block_descriptor_ext {
+  uint64_t length;              /* length of block */
+  uint64_t status_flags;        /* block type (hole etc) */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_block_status_hdr {
   uint32_t context_id;          /* metadata context ID */
   /* followed by array of nbd_block_descriptor extents */
 } NBD_ATTRIBUTE_PACKED;

+struct nbd_structured_reply_block_status_ext_hdr {
+  uint32_t context_id;          /* metadata context ID */
+  uint32_t count;               /* 0, or length of following array */
+  /* followed by array of nbd_block_descriptor_ext extents */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
@@ -236,8 +270,10 @@ struct nbd_structured_reply_error {
 } NBD_ATTRIBUTE_PACKED;

 #define NBD_REQUEST_MAGIC           0x25609513
+#define NBD_EXTENDED_REQUEST_MAGIC  0x21e41c71
 #define NBD_SIMPLE_REPLY_MAGIC      0x67446698
 #define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+#define NBD_EXTENDED_REPLY_MAGIC    0x6e8a278c

 /* Structured reply flags. */
 #define NBD_REPLY_FLAG_DONE         (1<<0)
@@ -246,12 +282,13 @@ struct nbd_structured_reply_error {
 #define NBD_REPLY_TYPE_IS_ERR(val) (!!((val) & (1<<15)))

 /* Structured reply types. */
-#define NBD_REPLY_TYPE_NONE         0
-#define NBD_REPLY_TYPE_OFFSET_DATA  1
-#define NBD_REPLY_TYPE_OFFSET_HOLE  2
-#define NBD_REPLY_TYPE_BLOCK_STATUS 5
-#define NBD_REPLY_TYPE_ERROR        NBD_REPLY_TYPE_ERR (1)
-#define NBD_REPLY_TYPE_ERROR_OFFSET NBD_REPLY_TYPE_ERR (2)
+#define NBD_REPLY_TYPE_NONE             0
+#define NBD_REPLY_TYPE_OFFSET_DATA      1
+#define NBD_REPLY_TYPE_OFFSET_HOLE      2
+#define NBD_REPLY_TYPE_BLOCK_STATUS     5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
+#define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET     NBD_REPLY_TYPE_ERR (2)

 /* NBD commands. */
 #define NBD_CMD_READ              0
@@ -263,11 +300,12 @@ struct nbd_structured_reply_error {
 #define NBD_CMD_WRITE_ZEROES      6
 #define NBD_CMD_BLOCK_STATUS      7

-#define NBD_CMD_FLAG_FUA       (1<<0)
-#define NBD_CMD_FLAG_NO_HOLE   (1<<1)
-#define NBD_CMD_FLAG_DF        (1<<2)
-#define NBD_CMD_FLAG_REQ_ONE   (1<<3)
-#define NBD_CMD_FLAG_FAST_ZERO (1<<4)
+#define NBD_CMD_FLAG_FUA         (1<<0)
+#define NBD_CMD_FLAG_NO_HOLE     (1<<1)
+#define NBD_CMD_FLAG_DF          (1<<2)
+#define NBD_CMD_FLAG_REQ_ONE     (1<<3)
+#define NBD_CMD_FLAG_FAST_ZERO   (1<<4)
+#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)

 /* NBD error codes. */
 #define NBD_SUCCESS     0
-- 
2.38.1

