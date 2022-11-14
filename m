Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B36D628D20
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6EBAE2067A; Mon, 14 Nov 2022 23:05:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:39 2022
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
	by bendel.debian.org (Postfix) with ESMTP id EAAD92067B
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XCxf6dSHcVnb for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8AEDE20616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSKFsd3WLLrsYRtlYZAlFwgEDN2comkk7iEfIBxymQM=;
	b=KT9g4M79Zfd+u3mBARn5rL1tfw9RcpIZeqQzLykuKMw8IxoqGawBw0vWbRN0oZ4eUHIKFD
	/XfStwn7rL7bSycJaUrGFMEiBRKQ8Kmb5W3DqzPaAcVKP96qJhxPprRfZPqPC9dTQUweBR
	JOZWLXVqn20Odewo16Z1jz4paEE7Ios=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-WJwDpn3APeGXsE-6Q8_8Dw-1; Mon, 14 Nov 2022 17:49:06 -0500
X-MC-Unique: WJwDpn3APeGXsE-6Q8_8Dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AEB4101A528;
	Mon, 14 Nov 2022 22:49:05 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0566940E42E5;
	Mon, 14 Nov 2022 22:49:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 14/15] RFC: nbd/client: Accept 64-bit hole chunks
Date: Mon, 14 Nov 2022 16:48:47 -0600
Message-Id: <20221114224848.2186298-15-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5UJ9Fy7O-BE.A.2GE.DnscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2291
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-15-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:39 +0000 (UTC)

As part of adding extended headers, the NBD spec debated about adding
support for reading 64-bit holes.  It was documented in a separate
upstream commit XXX[*] to make it easier to decide whether 64-bit
holes should be required of all clients supporting extended headers,
or whether it is an unneeded feature; hence, the qemu work to support
it is also pulled out into a separate commit.

Note that we can also tolerate a non-compliant server sending the new
chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>

---
[*] Fix commit id if we actually go with idea
---
 include/block/nbd.h |  8 ++++++++
 block/nbd.c         | 26 ++++++++++++++++++++------
 nbd/common.c        |  4 +++-
 3 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 2a65c606c9..18b6bad038 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -133,6 +133,13 @@ typedef struct NBDStructuredReadHole {
     uint32_t length;
 } QEMU_PACKED NBDStructuredReadHole;

+/* Complete chunk for NBD_REPLY_TYPE_OFFSET_HOLE_EXT */
+typedef struct NBDStructuredReadHoleExt {
+    /* header's length == 16 */
+    uint64_t offset;
+    uint64_t length;
+} QEMU_PACKED NBDStructuredReadHoleExt;
+
 /* Header of all NBD_REPLY_TYPE_ERROR* errors */
 typedef struct NBDStructuredError {
     /* header's length >= 6 */
@@ -309,6 +316,7 @@ enum {
 #define NBD_REPLY_TYPE_NONE              0
 #define NBD_REPLY_TYPE_OFFSET_DATA       1
 #define NBD_REPLY_TYPE_OFFSET_HOLE       2
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT   3
 #define NBD_REPLY_TYPE_BLOCK_STATUS      5
 #define NBD_REPLY_TYPE_BLOCK_STATUS_EXT  6
 #define NBD_REPLY_TYPE_ERROR             NBD_REPLY_ERR(1)
diff --git a/block/nbd.c b/block/nbd.c
index 44ab5437ea..968d5d8a37 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -570,20 +570,26 @@ static inline uint64_t payload_advance64(uint8_t **payload)

 static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
                                          NBDStructuredReplyChunk *chunk,
-                                         uint8_t *payload, uint64_t orig_offset,
+                                         uint8_t *payload, bool wide,
+                                         uint64_t orig_offset,
                                          QEMUIOVector *qiov, Error **errp)
 {
     uint64_t offset;
-    uint32_t hole_size;
+    uint64_t hole_size;
+    size_t len = wide ? sizeof(hole_size) : sizeof(uint32_t);

-    if (chunk->length != sizeof(offset) + sizeof(hole_size)) {
+    if (chunk->length != sizeof(offset) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_OFFSET_HOLE");
         return -EINVAL;
     }

     offset = payload_advance64(&payload);
-    hole_size = payload_advance32(&payload);
+    if (wide) {
+        hole_size = payload_advance64(&payload);
+    } else {
+        hole_size = payload_advance32(&payload);
+    }

     if (!hole_size || offset < orig_offset || hole_size > qiov->size ||
         offset > orig_offset + qiov->size - hole_size) {
@@ -596,6 +602,7 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
         trace_nbd_structured_read_compliance("hole");
     }

+    assert(hole_size <= SIZE_MAX);
     qemu_iovec_memset(qiov, offset - orig_offset, 0, hole_size);

     return 0;
@@ -1094,9 +1101,16 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h
              * in qiov
              */
             break;
+        case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+            if (!s->info.extended_headers) {
+                trace_nbd_extended_headers_compliance("hole_ext");
+            }
+            /* fallthrough */
         case NBD_REPLY_TYPE_OFFSET_HOLE:
-            ret = nbd_parse_offset_hole_payload(s, &reply.structured, payload,
-                                                offset, qiov, &local_err);
+            ret = nbd_parse_offset_hole_payload(
+                s, &reply.structured, payload,
+                chunk->type == NBD_REPLY_TYPE_OFFSET_HOLE_EXT,
+                offset, qiov, &local_err);
             if (ret < 0) {
                 nbd_channel_error(s, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
diff --git a/nbd/common.c b/nbd/common.c
index 137466defd..54f7d6a4fd 100644
--- a/nbd/common.c
+++ b/nbd/common.c
@@ -174,7 +174,9 @@ const char *nbd_reply_type_lookup(uint16_t type)
     case NBD_REPLY_TYPE_OFFSET_DATA:
         return "data";
     case NBD_REPLY_TYPE_OFFSET_HOLE:
-        return "hole";
+        return "hole (32-bit)";
+    case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+        return "hole (64-bit)";
     case NBD_REPLY_TYPE_BLOCK_STATUS:
         return "block status (32-bit)";
     case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
-- 
2.38.1

