Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F6628C66
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:56:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 77B8120545; Mon, 14 Nov 2022 22:56:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:56:45 2022
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
	by bendel.debian.org (Postfix) with ESMTP id CDAA820678
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:56:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kO4L7h05w9MS for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:56:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 3AFF420668
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhjaJStUuLPK/R3vMxs8VI5rugu1a9ay15tYrbDlKAg=;
	b=fxt0EVviRele4H5JPbgyz8Ubg0lIoN2aM7nnwngYCF0K+gC/6FDU3VLvour1RprRQPXkqY
	nk3SlWGFBRwGA5zVatv7ap4wwl7PtZWIH0fZ+gVwcS7flAYrU9UvloDp9Pa8xKG0+nlIXX
	EGR6xExWoOKnasiy76D/nwbhDoDVXQc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-c9vmJOToNCSgezP9DKJmmg-1; Mon, 14 Nov 2022 17:49:00 -0500
X-MC-Unique: c9vmJOToNCSgezP9DKJmmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1B791C087B7;
	Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A32F40AE7F0;
	Mon, 14 Nov 2022 22:48:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 07/15] nbd/server: Initial support for extended headers
Date: Mon, 14 Nov 2022 16:48:40 -0600
Message-Id: <20221114224848.2186298-8-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2dvNrtIJXkG.A.Cz.tescjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2249
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-8-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:56:45 +0000 (UTC)

Even though the NBD spec has been altered to allow us to accept
NBD_CMD_READ larger than the max payload size (provided our response
is a hole or broken up over more than one data chunk), we are not
planning to take advantage of that, and continue to cap NBD_CMD_READ
to 32M regardless of header size.

For NBD_CMD_WRITE_ZEROES and NBD_CMD_TRIM, the block layer already
supports 64-bit operations without any effort on our part.  For
NBD_CMD_BLOCK_STATUS, the client's length is a hint; the easiest
approach for now is to truncate our answer back to 32 bits, which lets
us delay the effort of implementing NBD_REPLY_TYPE_BLOCK_STATUS_EXT to
a separate patch.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/nbd-internal.h |   7 ++-
 nbd/server.c       | 132 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 108 insertions(+), 31 deletions(-)

diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
index 0016793ff4..f9fe0b6ce3 100644
--- a/nbd/nbd-internal.h
+++ b/nbd/nbd-internal.h
@@ -1,7 +1,7 @@
 /*
  * NBD Internal Declarations
  *
- * Copyright (C) 2016-2021 Red Hat, Inc.
+ * Copyright (C) 2016-2022 Red Hat, Inc.
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -35,8 +35,11 @@
  * https://github.com/yoe/nbd/blob/master/doc/proto.md
  */

-/* Size of all NBD_OPT_*, without payload */
+/* Size of all compact NBD_CMD_*, without payload */
 #define NBD_REQUEST_SIZE            (4 + 2 + 2 + 8 + 8 + 4)
+/* Size of all extended NBD_CMD_*, without payload */
+#define NBD_EXTENDED_REQUEST_SIZE   (4 + 2 + 2 + 8 + 8 + 8)
+
 /* Size of all NBD_REP_* sent in answer to most NBD_OPT_*, without payload */
 #define NBD_REPLY_SIZE              (4 + 4 + 8)
 /* Size of reply to NBD_OPT_EXPORT_NAME */
diff --git a/nbd/server.c b/nbd/server.c
index 4d1400430b..b46655b4d8 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -141,7 +141,7 @@ struct NBDClient {

     uint32_t check_align; /* If non-zero, check for aligned client requests */

-    bool structured_reply;
+    bool structured_reply; /* also set true if extended_headers is set */
     bool extended_headers;
     NBDExportMetaContexts export_meta;

@@ -1260,6 +1260,10 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
             case NBD_OPT_STRUCTURED_REPLY:
                 if (length) {
                     ret = nbd_reject_length(client, false, errp);
+                } else if (client->extended_headers) {
+                    ret = nbd_negotiate_send_rep_err(
+                        client, NBD_REP_ERR_EXT_HEADER_REQD, errp,
+                        "extended headers already negotiated");
                 } else if (client->structured_reply) {
                     ret = nbd_negotiate_send_rep_err(
                         client, NBD_REP_ERR_INVALID, errp,
@@ -1276,6 +1280,19 @@ static int nbd_negotiate_options(NBDClient *client, Error **errp)
                                                  errp);
                 break;

+            case NBD_OPT_EXTENDED_HEADERS:
+                if (length) {
+                    ret = nbd_reject_length(client, false, errp);
+                } else if (client->extended_headers) {
+                    ret = nbd_negotiate_send_rep_err(
+                        client, NBD_REP_ERR_INVALID, errp,
+                        "extended headers already negotiated");
+                } else {
+                    ret = nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
+                    client->structured_reply = client->extended_headers = true;
+                }
+                break;
+
             default:
                 ret = nbd_opt_drop(client, NBD_REP_ERR_UNSUP, errp,
                                    "Unsupported option %" PRIu32 " (%s)",
@@ -1411,11 +1428,13 @@ nbd_read_eof(NBDClient *client, void *buffer, size_t size, Error **errp)
 static int nbd_receive_request(NBDClient *client, NBDRequest *request,
                                Error **errp)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
-    uint32_t magic;
+    uint8_t buf[NBD_EXTENDED_REQUEST_SIZE];
+    uint32_t magic, expect;
     int ret;
+    size_t size = client->extended_headers ? NBD_EXTENDED_REQUEST_SIZE
+        : NBD_REQUEST_SIZE;

-    ret = nbd_read_eof(client, buf, sizeof(buf), errp);
+    ret = nbd_read_eof(client, buf, size, errp);
     if (ret < 0) {
         return ret;
     }
@@ -1423,13 +1442,21 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
         return -EIO;
     }

-    /* Request
-       [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
-       [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, ...)
-       [ 6 ..  7]   type    (NBD_CMD_READ, ...)
-       [ 8 .. 15]   handle
-       [16 .. 23]   from
-       [24 .. 27]   len
+    /*
+     * Compact request
+     *  [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
+     *  [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, ...)
+     *  [ 6 ..  7]   type    (NBD_CMD_READ, ...)
+     *  [ 8 .. 15]   handle
+     *  [16 .. 23]   from
+     *  [24 .. 27]   len
+     * Extended request
+     *  [ 0 ..  3]   magic   (NBD_EXTENDED_REQUEST_MAGIC)
+     *  [ 4 ..  5]   flags   (NBD_CMD_FLAG_FUA, NBD_CMD_FLAG_PAYLOAD_LEN, ...)
+     *  [ 6 ..  7]   type    (NBD_CMD_READ, ...)
+     *  [ 8 .. 15]   handle
+     *  [16 .. 23]   from
+     *  [24 .. 31]   len
      */

     magic = ldl_be_p(buf);
@@ -1437,12 +1464,18 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     request->type   = lduw_be_p(buf + 6);
     request->handle = ldq_be_p(buf + 8);
     request->from   = ldq_be_p(buf + 16);
-    request->len    = ldl_be_p(buf + 24); /* widen 32 to 64 bits */
+    if (client->extended_headers) {
+        request->len = ldq_be_p(buf + 24);
+        expect = NBD_EXTENDED_REQUEST_MAGIC;
+    } else {
+        request->len = ldl_be_p(buf + 24); /* widen 32 to 64 bits */
+        expect = NBD_REQUEST_MAGIC;
+    }

     trace_nbd_receive_request(magic, request->flags, request->type,
                               request->from, request->len);

-    if (magic != NBD_REQUEST_MAGIC) {
+    if (magic != expect) {
         error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", magic);
         return -EINVAL;
     }
@@ -1890,14 +1923,37 @@ static int coroutine_fn nbd_co_send_iov(NBDClient *client, struct iovec *iov,
 }

 static inline void set_be_simple_reply(NBDClient *client, struct iovec *iov,
-                                       uint64_t error, NBDRequest *request)
+                                       uint32_t error, NBDStructuredError *err,
+                                       NBDRequest *request)
 {
-    NBDSimpleReply *reply = iov->iov_base;
+    if (client->extended_headers) {
+        NBDExtendedReplyChunk *chunk = iov->iov_base;

-    iov->iov_len = sizeof(*reply);
-    stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
-    stl_be_p(&reply->error, error);
-    stq_be_p(&reply->handle, request->handle);
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_EXTENDED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, NBD_REPLY_FLAG_DONE);
+        stq_be_p(&chunk->handle, request->handle);
+        stq_be_p(&chunk->offset, request->from);
+        if (error) {
+            assert(!iov[1].iov_base);
+            iov[1].iov_base = err;
+            iov[1].iov_len = sizeof(*err);
+            stw_be_p(&chunk->type, NBD_REPLY_TYPE_ERROR);
+            stq_be_p(&chunk->length, sizeof(*err));
+            stl_be_p(&err->error, error);
+            stw_be_p(&err->message_length, 0);
+        } else {
+            stw_be_p(&chunk->type, NBD_REPLY_TYPE_NONE);
+            stq_be_p(&chunk->length, 0);
+        }
+    } else {
+        NBDSimpleReply *reply = iov->iov_base;
+
+        iov->iov_len = sizeof(*reply);
+        stl_be_p(&reply->magic, NBD_SIMPLE_REPLY_MAGIC);
+        stl_be_p(&reply->error, error);
+        stq_be_p(&reply->handle, request->handle);
+    }
 }

 static int nbd_co_send_simple_reply(NBDClient *client, NBDRequest *request,
@@ -1908,30 +1964,44 @@ static int nbd_co_send_simple_reply(NBDClient *client, NBDRequest *request,
 {
     NBDReply hdr;
     int nbd_err = system_errno_to_nbd_errno(error);
+    NBDStructuredError err;
     struct iovec iov[] = {
         {.iov_base = &hdr},
         {.iov_base = data, .iov_len = len}
     };

+    assert(!len || !nbd_err);
     trace_nbd_co_send_simple_reply(request->handle, nbd_err,
                                    nbd_err_lookup(nbd_err), len);
-    set_be_simple_reply(client, &iov[0], nbd_err, request);
+    set_be_simple_reply(client, &iov[0], nbd_err, &err, request);

-    return nbd_co_send_iov(client, iov, len ? 2 : 1, errp);
+    return nbd_co_send_iov(client, iov, iov[1].iov_len ? 2 : 1, errp);
 }

 static inline void set_be_chunk(NBDClient *client, struct iovec *iov,
                                 uint16_t flags, uint16_t type,
                                 NBDRequest *request, uint32_t length)
 {
-    NBDStructuredReplyChunk *chunk = iov->iov_base;
+    if (client->extended_headers) {
+        NBDExtendedReplyChunk *chunk = iov->iov_base;

-    iov->iov_len = sizeof(*chunk);
-    stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
-    stw_be_p(&chunk->flags, flags);
-    stw_be_p(&chunk->type, type);
-    stq_be_p(&chunk->handle, request->handle);
-    stl_be_p(&chunk->length, length);
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_EXTENDED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, request->handle);
+        stq_be_p(&chunk->offset, request->from);
+        stq_be_p(&chunk->length, length);
+    } else {
+        NBDStructuredReplyChunk *chunk = iov->iov_base;
+
+        iov->iov_len = sizeof(*chunk);
+        stl_be_p(&chunk->magic, NBD_STRUCTURED_REPLY_MAGIC);
+        stw_be_p(&chunk->flags, flags);
+        stw_be_p(&chunk->type, type);
+        stq_be_p(&chunk->handle, request->handle);
+        stl_be_p(&chunk->length, length);
+    }
 }

 static int coroutine_fn nbd_co_send_structured_done(NBDClient *client,
@@ -2595,7 +2665,11 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request, -EINVAL,
                                           "need non-zero length", errp);
         }
-        assert(request->len <= UINT32_MAX);
+        if (request->len > UINT32_MAX) {
+            /* For now, truncate our response to a 32 bit window */
+            request->len = QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
+                                           client->check_align ?: 1);
+        }
         if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
             int contexts_remaining = client->export_meta.count;
-- 
2.38.1

