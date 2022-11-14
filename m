Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D8628D19
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E54420678; Mon, 14 Nov 2022 23:05:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:00 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B1BEB20534
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id noAROmBOx92a for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 918E720545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PS+9G0eQgrAzbNlU7enH1i26FFIUC7sSv8GZMmvWhks=;
	b=fUyaqQMN4B1yH/pnfflEWXE4PXfg5xLjXetyQ729kNdvV90yMZP+XdKe0I6MAxMf0Cnk4s
	+5XgRWrvT98PmnkM9wYYZisD+I+Ae1l/9f6AStZuFQHSXHh2f3KqsgKjNt2IDVIHJOQr6f
	hmgt4C1x+MyLRzxLEMwTIerMTs1xRUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-wRz522GnMMapbMDV41tsog-1; Mon, 14 Nov 2022 17:49:01 -0500
X-MC-Unique: wRz522GnMMapbMDV41tsog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A4B8101E14C;
	Mon, 14 Nov 2022 22:49:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B81E440E42F2;
	Mon, 14 Nov 2022 22:49:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 09/15] nbd/client: Initial support for extended headers
Date: Mon, 14 Nov 2022 16:48:42 -0600
Message-Id: <20221114224848.2186298-10-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UaDawJKyuFH.A.O2D.cmscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2285
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-10-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:01 +0000 (UTC)

Update the client code to be able to send an extended request, and
parse an extended header from the server.  Note that since we reject
any structured reply with a too-large payload, we can always normalize
a valid header back into the compact form, so that the caller need not
deal with two branches of a union.  Still, until a later patch lets
the client negotiate extended headers, the code added here should not
be reached.  Note that because of the different magic numbers, it is
just as easy to trace and then tolerate a non-compliant server sending
the wrong header reply as it would be to insist that the server is
compliant.

The only caller to nbd_receive_reply() always passed NULL for errp;
since we are changing the signature anyways, I decided to sink the
decision to ignore errors one layer lower.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/nbd.h |  2 +-
 block/nbd.c         |  3 +-
 nbd/client.c        | 84 ++++++++++++++++++++++++++++++---------------
 nbd/trace-events    |  1 +
 4 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 357121ce76..02e31b2261 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -363,7 +363,7 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
              Error **errp);
 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr);
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
-                                   NBDReply *reply, Error **errp);
+                                   NBDReply *reply, bool ext_hdrs);
 int nbd_client(int fd);
 int nbd_disconnect(int fd);
 int nbd_errno_to_system_errno(int err);
diff --git a/block/nbd.c b/block/nbd.c
index 32681d2867..a8b1bc1054 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -457,7 +457,8 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)

         /* We are under mutex and handle is 0. We have to do the dirty work. */
         assert(s->reply.handle == 0);
-        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
+        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply,
+                                s->info.extended_headers);
         if (ret <= 0) {
             ret = ret ? ret : -EIO;
             nbd_channel_error(s, ret);
diff --git a/nbd/client.c b/nbd/client.c
index 2480a48ec6..70f06ce637 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1348,22 +1348,28 @@ int nbd_disconnect(int fd)

 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
+    uint8_t buf[NBD_EXTENDED_REQUEST_SIZE];
+    size_t len;

-    assert(!ext_hdr);
-    assert(request->len <= UINT32_MAX);
     trace_nbd_send_request(request->from, request->len, request->handle,
                            request->flags, request->type,
                            nbd_cmd_lookup(request->type));

-    stl_be_p(buf, NBD_REQUEST_MAGIC);
+    stl_be_p(buf, ext_hdr ? NBD_EXTENDED_REQUEST_MAGIC : NBD_REQUEST_MAGIC);
     stw_be_p(buf + 4, request->flags);
     stw_be_p(buf + 6, request->type);
     stq_be_p(buf + 8, request->handle);
     stq_be_p(buf + 16, request->from);
-    stl_be_p(buf + 24, request->len);
+    if (ext_hdr) {
+        stq_be_p(buf + 24, request->len);
+        len = NBD_EXTENDED_REQUEST_SIZE;
+    } else {
+        assert(request->len <= UINT32_MAX);
+        stl_be_p(buf + 24, request->len);
+        len = NBD_REQUEST_SIZE;
+    }

-    return nbd_write(ioc, buf, sizeof(buf), NULL);
+    return nbd_write(ioc, buf, len, NULL);
 }

 /* nbd_receive_simple_reply
@@ -1392,28 +1398,34 @@ static int nbd_receive_simple_reply(QIOChannel *ioc, NBDSimpleReply *reply,

 /* nbd_receive_structured_reply_chunk
  * Read structured reply chunk except magic field (which should be already
- * read).
+ * read).  Normalize into the compact form.
  * Payload is not read.
  */
-static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
-                                              NBDStructuredReplyChunk *chunk,
+static int nbd_receive_structured_reply_chunk(QIOChannel *ioc, NBDReply *chunk,
                                               Error **errp)
 {
     int ret;
+    size_t len;
+    uint64_t payload_len;

-    assert(chunk->magic == NBD_STRUCTURED_REPLY_MAGIC);
+    if (chunk->magic == NBD_STRUCTURED_REPLY_MAGIC) {
+        len = sizeof(chunk->structured);
+    } else {
+        assert(chunk->magic == NBD_EXTENDED_REPLY_MAGIC);
+        len = sizeof(chunk->extended);
+    }

     ret = nbd_read(ioc, (uint8_t *)chunk + sizeof(chunk->magic),
-                   sizeof(*chunk) - sizeof(chunk->magic), "structured chunk",
+                   len - sizeof(chunk->magic), "structured chunk",
                    errp);
     if (ret < 0) {
         return ret;
     }

-    chunk->flags = be16_to_cpu(chunk->flags);
-    chunk->type = be16_to_cpu(chunk->type);
-    chunk->handle = be64_to_cpu(chunk->handle);
-    chunk->length = be32_to_cpu(chunk->length);
+    /* flags, type, and handle occupy same space between forms */
+    chunk->structured.flags = be16_to_cpu(chunk->structured.flags);
+    chunk->structured.type = be16_to_cpu(chunk->structured.type);
+    chunk->structured.handle = be64_to_cpu(chunk->structured.handle);

     /*
      * Because we use BLOCK_STATUS with REQ_ONE, and cap READ requests
@@ -1421,11 +1433,20 @@ static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
      * this.  Even if we stopped using REQ_ONE, sane servers will cap
      * the number of extents they return for block status.
      */
-    if (chunk->length > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
+    if (chunk->magic == NBD_STRUCTURED_REPLY_MAGIC) {
+        payload_len = be32_to_cpu(chunk->structured.length);
+    } else {
+        /* For now, we are ignoring the extended header offset. */
+        payload_len = be64_to_cpu(chunk->extended.length);
+        chunk->magic = NBD_STRUCTURED_REPLY_MAGIC;
+    }
+    if (payload_len > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
         error_setg(errp, "server chunk %" PRIu32 " (%s) payload is too long",
-                   chunk->type, nbd_rep_lookup(chunk->type));
+                   chunk->structured.type,
+                   nbd_rep_lookup(chunk->structured.type));
         return -EINVAL;
     }
+    chunk->structured.length = payload_len;

     return 0;
 }
@@ -1472,30 +1493,35 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,

 /* nbd_receive_reply
  *
- * Decreases bs->in_flight while waiting for a new reply. This yield is where
- * we wait indefinitely and the coroutine must be able to be safely reentered
- * for nbd_client_attach_aio_context().
+ * Wait for a new reply. If this yields, the coroutine must be able to be
+ * safely reentered for nbd_client_attach_aio_context().  @ext_hdrs determines
+ * which reply magic we are expecting, although this normalizes the result
+ * so that the caller only has to work with compact headers.
  *
  * Returns 1 on success
- *         0 on eof, when no data was read (errp is not set)
- *         negative errno on failure (errp is set)
+ *         0 on eof, when no data was read
+ *         negative errno on failure
  */
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
-                                   NBDReply *reply, Error **errp)
+                                   NBDReply *reply, bool ext_hdrs)
 {
     int ret;
     const char *type;

-    ret = nbd_read_eof(bs, ioc, &reply->magic, sizeof(reply->magic), errp);
+    ret = nbd_read_eof(bs, ioc, &reply->magic, sizeof(reply->magic), NULL);
     if (ret <= 0) {
         return ret;
     }

     reply->magic = be32_to_cpu(reply->magic);

+    /* Diagnose but accept wrong-width header */
     switch (reply->magic) {
     case NBD_SIMPLE_REPLY_MAGIC:
-        ret = nbd_receive_simple_reply(ioc, &reply->simple, errp);
+        if (ext_hdrs) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_simple_reply(ioc, &reply->simple, NULL);
         if (ret < 0) {
             break;
         }
@@ -1504,7 +1530,11 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                        reply->handle);
         break;
     case NBD_STRUCTURED_REPLY_MAGIC:
-        ret = nbd_receive_structured_reply_chunk(ioc, &reply->structured, errp);
+    case NBD_EXTENDED_REPLY_MAGIC:
+        if (ext_hdrs != (reply->magic == NBD_EXTENDED_REPLY_MAGIC)) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_structured_reply_chunk(ioc, reply, NULL);
         if (ret < 0) {
             break;
         }
@@ -1515,7 +1545,7 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                                  reply->structured.length);
         break;
     default:
-        error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", reply->magic);
+        trace_nbd_receive_wrong_header(reply->magic);
         return -EINVAL;
     }
     if (ret < 0) {
diff --git a/nbd/trace-events b/nbd/trace-events
index adf5666e20..c20df33a43 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -34,6 +34,7 @@ nbd_client_clear_socket(void) "Clearing NBD socket"
 nbd_send_request(uint64_t from, uint64_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name) "Sending request to server: { .from = %" PRIu64", .len = %" PRIu64 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) }"
 nbd_receive_simple_reply(int32_t error, const char *errname, uint64_t handle) "Got simple reply: { .error = %" PRId32 " (%s), handle = %" PRIu64" }"
 nbd_receive_structured_reply_chunk(uint16_t flags, uint16_t type, const char *name, uint64_t handle, uint32_t length) "Got structured reply chunk: { flags = 0x%" PRIx16 ", type = %d (%s), handle = %" PRIu64 ", length = %" PRIu32 " }"
+nbd_receive_wrong_header(uint32_t magic) "Server sent unexpected magic 0x%" PRIx32

 # common.c
 nbd_unknown_error(int err) "Squashing unexpected error %d to EINVAL"
-- 
2.38.1

