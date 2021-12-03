Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0C468067
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:31:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C23F20178; Fri,  3 Dec 2021 23:31:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:31:47 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BC6912015F
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:31:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4YPLmU_uSnHd for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:31:35 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 91C6A20153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO8G1JN5FkXplpWtx31vzs98t/EcWJc0UzTfV905tBI=;
	b=MWhfPcPHqNL24w/G2TfyGGHHQGY4idqjDnNGPVN9IdrWnbl7Vvpw+G2b6i5TRHC/FcHAs+
	BO/vhfCmVJFCZ5obEg1M1bcd/zcyUcErVWcrkHBXGHwR8/rAow8jIzA6U3EsIfjOpC/QbL
	NsvASEtAl2ikplUMkf20kFammr8F8WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-orQfG-HPPRetzZJ13BFj4Q-1; Fri, 03 Dec 2021 18:16:08 -0500
X-MC-Unique: orQfG-HPPRetzZJ13BFj4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E8B94EE0;
	Fri,  3 Dec 2021 23:16:07 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3175C5D9D5;
	Fri,  3 Dec 2021 23:16:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 05/14] nbd/server: Prepare for alternate-size headers
Date: Fri,  3 Dec 2021 17:15:30 -0600
Message-Id: <20211203231539.3900865-6-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-G-7RqtOHXM.A.a7C.jjqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1621
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-6-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:31:47 +0000 (UTC)

An upcoming NBD extension wants to add the ability to do 64-bit
requests.  As part of that extension, the size of the reply headers
will change in order to permit a 64-bit length in the reply for
symmetry [*].  Additionally, where the reply header is currently 16
bytes for simple reply, and 20 bytes for structured reply; with the
extension enabled, both reply type headers will be 32 bytes.  Since we
are already wired up to use iovecs, it is easiest to allow for this
change in header size by splitting each structured reply across two
iovecs, one for the header (which will become variable-length in a
future patch according to client negotiation), and the other for the
payload, and removing the header from the payload struct definitions.
Interestingly, the client side code never utilized the packed types,
so only the server code needs to be updated.

[*] Note that on the surface, this is because some server might permit
a 4G+ NBD_CMD_READ and need to reply with that much data in one
transaction.  But even though the extended reply length is widened to
64 bits, we will still never send a reply payload larger than just
over 32M (the maximum buffer we allow in NBD_CMD_READ; and we cap the
number of extents we are willing to report in NBD_CMD_BLOCK_STATUS).
Where 64-bit fields really matter in the extension is in a later patch
adding 64-bit support into a counterpart for REPLY_TYPE_BLOCK_STATUS.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h | 10 +++----
 nbd/server.c        | 64 ++++++++++++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 78d101b77488..3d0689b69367 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -1,5 +1,5 @@
 /*
- *  Copyright (C) 2016-2020 Red Hat, Inc.
+ *  Copyright (C) 2016-2021 Red Hat, Inc.
  *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
  *
  *  Network Block Device
@@ -95,28 +95,28 @@ typedef union NBDReply {

 /* Header of chunk for NBD_REPLY_TYPE_OFFSET_DATA */
 typedef struct NBDStructuredReadData {
-    NBDStructuredReplyChunk h; /* h.length >= 9 */
+    /* header's .length >= 9 */
     uint64_t offset;
     /* At least one byte of data payload follows, calculated from h.length */
 } QEMU_PACKED NBDStructuredReadData;

 /* Complete chunk for NBD_REPLY_TYPE_OFFSET_HOLE */
 typedef struct NBDStructuredReadHole {
-    NBDStructuredReplyChunk h; /* h.length == 12 */
+    /* header's length == 12 */
     uint64_t offset;
     uint32_t length;
 } QEMU_PACKED NBDStructuredReadHole;

 /* Header of all NBD_REPLY_TYPE_ERROR* errors */
 typedef struct NBDStructuredError {
-    NBDStructuredReplyChunk h; /* h.length >= 6 */
+    /* header's length >= 6 */
     uint32_t error;
     uint16_t message_length;
 } QEMU_PACKED NBDStructuredError;

 /* Header of NBD_REPLY_TYPE_BLOCK_STATUS */
 typedef struct NBDStructuredMeta {
-    NBDStructuredReplyChunk h; /* h.length >= 12 (at least one extent) */
+    /* header's length >= 12 (at least one extent) */
     uint32_t context_id;
     /* extents follows */
 } QEMU_PACKED NBDStructuredMeta;
diff --git a/nbd/server.c b/nbd/server.c
index f302e1cbb03e..64845542fd6b 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1869,9 +1869,12 @@ static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
     return ret;
 }

-static inline void set_be_simple_reply(NBDSimpleReply *reply, uint64_t error,
-                                       uint64_t handle)
+static inline void set_be_simple_reply(NBDClient *client, struct iovec *iov,
+                                       uint64_t error, uint64_t handle)
 {
+    NBDSimpleReply *reply = iov->iov_base;
+
+    iov->iov_len = sizeof(*reply);
     stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
     stl_be_p(&reply->error, error);
     stq_be_p(&reply->handle, handle);
@@ -1884,23 +1887,27 @@ static int nbd_co_send_simple_reply(NBDClient *client,
                                     size_t len,
                                     Error **errp)
 {
-    NBDSimpleReply reply;
+    NBDReply hdr;
     int nbd_err = system_errno_to_nbd_errno(error);
     struct iovec iov[] = {
-        {.iov_base = &reply, .iov_len = sizeof(reply)},
+        {.iov_base = &hdr},
         {.iov_base = data, .iov_len = len}
     };

     trace_nbd_co_send_simple_reply(handle, nbd_err, nbd_err_lookup(nbd_err),
                                    len);
-    set_be_simple_reply(&reply, nbd_err, handle);
+    set_be_simple_reply(client, &iov[0], nbd_err, handle);

     return nbd_co_send_iov(client, iov, len ? 2 : 1, errp);
 }

-static inline void set_be_chunk(NBDStructuredReplyChunk *chunk, uint16_t flags,
-                                uint16_t type, uint64_t handle, uint32_t length)
+static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
+                                uint16_t flags, uint16_t type,
+                                uint64_t handle, uint32_t length)
 {
+    NBDStructuredReplyChunk *chunk = iov->iov_base;
+
+    iov->iov_len = sizeof(*chunk);
     stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
     stw_be_p(&chunk->flags, flags);
     stw_be_p(&chunk->type, type);
@@ -1912,13 +1919,14 @@ static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
                                                     uint64_t handle,
                                                     Error **errp)
 {
-    NBDStructuredReplyChunk chunk;
+    NBDReply hdr;
     struct iovec iov[] = {
-        {.iov_base = &chunk, .iov_len = sizeof(chunk)},
+        {.iov_base = &hdr},
     };

     trace_nbd_co_send_structured_done(handle);
-    set_be_chunk(&chunk, NBD_REPLY_FLAG_DONE, NBD_REPLY_TYPE_NONE, handle, 0);
+    set_be_chunk(client, &iov[0], NBD_REPLY_FLAG_DONE,
+                 NBD_REPLY_TYPE_NONE, handle, 0);

     return nbd_co_send_iov(client, iov, 1, errp);
 }
@@ -1931,20 +1939,21 @@ static int coroutine_fn nbd_co_send_structured_read(NBDClient *client,
                                                     bool final,
                                                     Error **errp)
 {
+    NBDReply hdr;
     NBDStructuredReadData chunk;
     struct iovec iov[] = {
+        {.iov_base = &hdr},
         {.iov_base = &chunk, .iov_len = sizeof(chunk)},
         {.iov_base = data, .iov_len = size}
     };

     assert(size);
     trace_nbd_co_send_structured_read(handle, offset, data, size);
-    set_be_chunk(&chunk.h, final ? NBD_REPLY_FLAG_DONE : 0,
-                 NBD_REPLY_TYPE_OFFSET_DATA, handle,
-                 sizeof(chunk) - sizeof(chunk.h) + size);
+    set_be_chunk(client, &iov[0], final ? NBD_REPLY_FLAG_DONE : 0,
+                 NBD_REPLY_TYPE_OFFSET_DATA, handle, iov[1].iov_len + size);
     stq_be_p(&chunk.offset, offset);

-    return nbd_co_send_iov(client, iov, 2, errp);
+    return nbd_co_send_iov(client, iov, 3, errp);
 }

 static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
@@ -1953,9 +1962,11 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
                                                      const char *msg,
                                                      Error **errp)
 {
+    NBDReply hdr;
     NBDStructuredError chunk;
     int nbd_err = system_errno_to_nbd_errno(error);
     struct iovec iov[] = {
+        {.iov_base = &hdr},
         {.iov_base = &chunk, .iov_len = sizeof(chunk)},
         {.iov_base = (char *)msg, .iov_len = msg ? strlen(msg) : 0},
     };
@@ -1963,12 +1974,12 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
     assert(nbd_err);
     trace_nbd_co_send_structured_error(handle, nbd_err,
                                        nbd_err_lookup(nbd_err), msg ? msg : "");
-    set_be_chunk(&chunk.h, NBD_REPLY_FLAG_DONE, NBD_REPLY_TYPE_ERROR, handle,
-                 sizeof(chunk) - sizeof(chunk.h) + iov[1].iov_len);
+    set_be_chunk(client, &iov[0], NBD_REPLY_FLAG_DONE,
+                 NBD_REPLY_TYPE_ERROR, handle, iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.error, nbd_err);
-    stw_be_p(&chunk.message_length, iov[1].iov_len);
+    stw_be_p(&chunk.message_length, iov[2].iov_len);

-    return nbd_co_send_iov(client, iov, 1 + !!iov[1].iov_len, errp);
+    return nbd_co_send_iov(client, iov, 2 + !!iov[1].iov_len, errp);
 }

 /* Do a sparse read and send the structured reply to the client.
@@ -2006,19 +2017,22 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
         assert(pnum && pnum <= size - progress);
         final = progress + pnum == size;
         if (status & BDRV_BLOCK_ZERO) {
+            NBDReply hdr;
             NBDStructuredReadHole chunk;
             struct iovec iov[] = {
+                {.iov_base = &hdr},
                 {.iov_base = &chunk, .iov_len = sizeof(chunk)},
             };

             trace_nbd_co_send_structured_read_hole(handle, offset + progress,
                                                    pnum);
-            set_be_chunk(&chunk.h, final ? NBD_REPLY_FLAG_DONE : 0,
+            set_be_chunk(client, &iov[0],
+                         final ? NBD_REPLY_FLAG_DONE : 0,
                          NBD_REPLY_TYPE_OFFSET_HOLE,
-                         handle, sizeof(chunk) - sizeof(chunk.h));
+                         handle, iov[1].iov_len);
             stq_be_p(&chunk.offset, offset + progress);
             stl_be_p(&chunk.length, pnum);
-            ret = nbd_co_send_iov(client, iov, 1, errp);
+            ret = nbd_co_send_iov(client, iov, 2, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress,
                             data + progress, pnum);
@@ -2182,8 +2196,10 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
                                NBDExtentArray *ea,
                                bool last, uint32_t context_id, Error **errp)
 {
+    NBDReply hdr;
     NBDStructuredMeta chunk;
     struct iovec iov[] = {
+        {.iov_base = &hdr},
         {.iov_base = &chunk, .iov_len = sizeof(chunk)},
         {.iov_base = ea->extents, .iov_len = ea->count * sizeof(ea->extents[0])}
     };
@@ -2192,12 +2208,12 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,

     trace_nbd_co_send_extents(handle, ea->count, context_id, ea->total_length,
                               last);
-    set_be_chunk(&chunk.h, last ? NBD_REPLY_FLAG_DONE : 0,
+    set_be_chunk(client, &iov[0], last ? NBD_REPLY_FLAG_DONE : 0,
                  NBD_REPLY_TYPE_BLOCK_STATUS,
-                 handle, sizeof(chunk) - sizeof(chunk.h) + iov[1].iov_len);
+                 handle, iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.context_id, context_id);

-    return nbd_co_send_iov(client, iov, 2, errp);
+    return nbd_co_send_iov(client, iov, 3, errp);
 }

 /* Get block status from the exported device and send it to the client */
-- 
2.33.1

