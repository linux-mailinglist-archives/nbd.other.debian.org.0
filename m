Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A672C4680E3
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:47:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7643020189; Fri,  3 Dec 2021 23:47:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:47:14 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 331662016C
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:47:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2Y2qSbGCJcZ7 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:47:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id AB20820139
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638575217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d2M5BA91p7+DJAjYJCDI39MXWP4gGbmjmAjOVcJ0kU=;
	b=B5uAzQJFrNERe++1/vjOb/4eQkpTAqP7tmoQePOaNU9+0uPRhJxObJseCnh3Z7KIpnnm9e
	2Vl91krjouEjia+J9A2yy4KRVsbrgGxZzMq+P+zb+JMylDN6JNrIEFpga64KcvQeZYdG6G
	E4hrvCwiib93J2OXpSx8UAFmNtmaPy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-5KLcAAhqNeejpY6Wu7hv_w-1; Fri, 03 Dec 2021 18:16:28 -0500
X-MC-Unique: 5KLcAAhqNeejpY6Wu7hv_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF4A794EE0;
	Fri,  3 Dec 2021 23:16:26 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6DC95D9D5;
	Fri,  3 Dec 2021 23:16:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 10/14] nbd/client: Initial support for extended headers
Date: Fri,  3 Dec 2021 17:15:35 -0600
Message-Id: <20211203231539.3900865-11-eblake@redhat.com>
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
Resent-Message-ID: <-FwmpklJ0uK.A.bxE.CyqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1647
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-11-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:47:14 +0000 (UTC)

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
 include/block/nbd.h |   2 +-
 block/nbd.c         |   3 +-
 nbd/client.c        | 112 +++++++++++++++++++++++++++++++-------------
 nbd/trace-events    |   1 +
 4 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5f9d86a86352..d489c67d98dc 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -366,7 +366,7 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
              Error **errp);
 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr);
 int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
-                                   NBDReply *reply, Error **errp);
+                                   NBDReply *reply, bool ext_hdrs);
 int nbd_client(int fd);
 int nbd_disconnect(int fd);
 int nbd_errno_to_system_errno(int err);
diff --git a/block/nbd.c b/block/nbd.c
index 3e9875241bec..da5e6ac2d9a5 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -401,7 +401,8 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)

         /* We are under mutex and handle is 0. We have to do the dirty work. */
         assert(s->reply.handle == 0);
-        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply, NULL);
+        ret = nbd_receive_reply(s->bs, s->ioc, &s->reply,
+                                s->info.extended_headers);
         if (ret <= 0) {
             ret = ret ? ret : -EIO;
             nbd_channel_error(s, ret);
diff --git a/nbd/client.c b/nbd/client.c
index aa162b9d08d5..f1aa5256c8bf 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1347,22 +1347,28 @@ int nbd_disconnect(int fd)

 int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
 {
-    uint8_t buf[NBD_REQUEST_SIZE];
+    uint8_t buf[NBD_REQUEST_EXT_SIZE];
+    size_t len;

-    assert(!ext_hdr);
-    assert(request->len <= UINT32_MAX);
     trace_nbd_send_request(request->from, request->len, request->handle,
                            request->flags, request->type,
                            nbd_cmd_lookup(request->type));

-    stl_be_p(buf, NBD_REQUEST_MAGIC);
+    stl_be_p(buf, ext_hdr ? NBD_REQUEST_EXT_MAGIC : NBD_REQUEST_MAGIC);
     stw_be_p(buf + 4, request->flags);
     stw_be_p(buf + 6, request->type);
     stq_be_p(buf + 8, request->handle);
     stq_be_p(buf + 16, request->from);
-    stl_be_p(buf + 24, request->len);
+    if (ext_hdr) {
+        stq_be_p(buf + 24, request->len);
+        len = NBD_REQUEST_EXT_SIZE;
+    } else {
+        assert(request->len <= UINT32_MAX);
+        stl_be_p(buf + 24, request->len);
+        len = NBD_REQUEST_SIZE;
+    }

-    return nbd_write(ioc, buf, sizeof(buf), NULL);
+    return nbd_write(ioc, buf, len, NULL);
 }

 /* nbd_receive_simple_reply
@@ -1370,49 +1376,69 @@ int nbd_send_request(QIOChannel *ioc, NBDRequest *request, bool ext_hdr)
  * Payload is not read (payload is possible for CMD_READ, but here we even
  * don't know whether it take place or not).
  */
-static int nbd_receive_simple_reply(QIOChannel *ioc, NBDSimpleReply *reply,
+static int nbd_receive_simple_reply(QIOChannel *ioc, NBDReply *reply,
                                     Error **errp)
 {
     int ret;
+    size_t len;

-    assert(reply->magic == NBD_SIMPLE_REPLY_MAGIC);
+    if (reply->magic == NBD_SIMPLE_REPLY_MAGIC) {
+        len = sizeof(reply->simple);
+    } else {
+        assert(reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC);
+        len = sizeof(reply->simple_ext);
+    }

     ret = nbd_read(ioc, (uint8_t *)reply + sizeof(reply->magic),
-                   sizeof(*reply) - sizeof(reply->magic), "reply", errp);
+                   len - sizeof(reply->magic), "reply", errp);
     if (ret < 0) {
         return ret;
     }

-    reply->error = be32_to_cpu(reply->error);
-    reply->handle = be64_to_cpu(reply->handle);
+    /* error and handle occupy same space between forms */
+    reply->simple.error = be32_to_cpu(reply->simple.error);
+    reply->simple.handle = be64_to_cpu(reply->handle);
+    if (reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC) {
+        if (reply->simple_ext._pad1 || reply->simple_ext._pad2) {
+            error_setg(errp, "Server used non-zero padding in extended header");
+            return -EINVAL;
+        }
+        reply->magic = NBD_SIMPLE_REPLY_MAGIC;
+    }

     return 0;
 }

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
+        assert(chunk->magic == NBD_STRUCTURED_REPLY_EXT_MAGIC);
+        len = sizeof(chunk->structured_ext);
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
@@ -1420,11 +1446,23 @@ static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
      * this.  Even if we stopped using REQ_ONE, sane servers will cap
      * the number of extents they return for block status.
      */
-    if (chunk->length > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
+    if (chunk->magic == NBD_STRUCTURED_REPLY_MAGIC) {
+        payload_len = be32_to_cpu(chunk->structured.length);
+    } else {
+        payload_len = be64_to_cpu(chunk->structured_ext.length);
+        if (chunk->structured_ext._pad) {
+            error_setg(errp, "Server used non-zero padding in extended header");
+            return -EINVAL;
+        }
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
@@ -1471,30 +1509,36 @@ nbd_read_eof(BlockDriverState *bs, QIOChannel *ioc, void *buffer, size_t size,

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
+    case NBD_SIMPLE_REPLY_EXT_MAGIC:
+        if (ext_hdrs != (reply->magic == NBD_SIMPLE_REPLY_EXT_MAGIC)) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_simple_reply(ioc, reply, NULL);
         if (ret < 0) {
             break;
         }
@@ -1503,7 +1547,11 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                        reply->handle);
         break;
     case NBD_STRUCTURED_REPLY_MAGIC:
-        ret = nbd_receive_structured_reply_chunk(ioc, &reply->structured, errp);
+    case NBD_STRUCTURED_REPLY_EXT_MAGIC:
+        if (ext_hdrs != (reply->magic == NBD_STRUCTURED_REPLY_EXT_MAGIC)) {
+            trace_nbd_receive_wrong_header(reply->magic);
+        }
+        ret = nbd_receive_structured_reply_chunk(ioc, reply, NULL);
         if (ret < 0) {
             break;
         }
@@ -1514,7 +1562,7 @@ int coroutine_fn nbd_receive_reply(BlockDriverState *bs, QIOChannel *ioc,
                                                  reply->structured.length);
         break;
     default:
-        error_setg(errp, "invalid magic (got 0x%" PRIx32 ")", reply->magic);
+        trace_nbd_receive_wrong_header(reply->magic);
         return -EINVAL;
     }
     if (ret < 0) {
diff --git a/nbd/trace-events b/nbd/trace-events
index d18da8b0b743..ad63e565fd6e 100644
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
2.33.1

