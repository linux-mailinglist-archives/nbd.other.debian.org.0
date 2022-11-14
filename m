Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A216C628C81
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:59:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 87F7C20688; Mon, 14 Nov 2022 22:59:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:59:41 2022
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
	by bendel.debian.org (Postfix) with ESMTP id C332D20681
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JNuXGtWNPOvv for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8044B20545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcnm5aMG/LUSV6x9rNqQu6bpIiyneV26ZG6lhU9ZMh4=;
	b=cgUURXXQPLZLW+/plzQZecErV4cZBWpTOsh9C5N9YHfi+xTwlNx0Bd4oT2F5KgtjFApgwn
	crPo9FGao4TNG2dAcXjs5kqlrgJqlBddhqkWNVWa7b8rAY7LIgUoJBUxBEa60Wti7ZH+K8
	+29GavqpFkPbJ/zFSbEPafCgyF/Yicc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-YsK2a6_mOtqnkpn016mR8Q-1; Mon, 14 Nov 2022 17:52:15 -0500
X-MC-Unique: YsK2a6_mOtqnkpn016mR8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F29D2811E81;
	Mon, 14 Nov 2022 22:52:14 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E02540E9786;
	Mon, 14 Nov 2022 22:52:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 23/23] RFC: pread: Accept 64-bit holes
Date: Mon, 14 Nov 2022 16:51:58 -0600
Message-Id: <20221114225158.2186742-24-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YgY66ZDc_yB.A.pjB.dhscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2260
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-24-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:59:41 +0000 (UTC)

Even though we don't currently allow the user to request NBD_CMD_READ
with more than 64M (and even if we did, our API signature caps us at
SIZE_MAX, which is 32 bits on a 32-bit machine), upstream NBD commit
XXX[*] states that for symmetry with 64-bit requests, extended header
clients must be prepared for a server response with a 64-bit hole,
even if the client never makes a read request that large.  Note that
we don't have to change the signature of the callback for
nbd_pread_structured; nor is it worth adding a 64-bit counterpart to
LIBNBD_READ_HOLE, because it is unlikely that a user callback will
ever need to distinguish between which size was sent over the wire,
when the value is always less than 32 bits.  Also note that the recent
NBD spec changes to add 64-bits did state that servers may allow
clients to request a read of larger than the max block size, but if
such read is not rejected with EOVERFLOW or EINVAL, then the reply
will be divided into chunks so that no chunk sends more than a max
block size payload.

While we cannot guarantee which size structured reply the server will
use, it is easy enough to handle both sizes, but tag the read with
EPROTO for a non-compliant server that sends wide replies when
extended headers were not negotiated.  A more likely reason that a
server may choose to send 64-bit hole chunks even for a 32-bit hole is
because the extended hole payload has nicer power-of-2 sizing.

---

[*] FIXME: Update this with the actual commit id, if upstream NBD even
goes with this option.
---
 lib/internal.h                      |  1 +
 lib/nbd-protocol.h                  |  6 +++++
 generator/states-reply-structured.c | 36 ++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index ac8d99c4..64d1941c 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -250,6 +250,7 @@ struct nbd_handle {
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
+        struct nbd_structured_reply_offset_hole_ext offset_hole_ext;
         struct nbd_structured_reply_block_status_hdr bs_hdr;
         struct nbd_structured_reply_block_status_ext_hdr bs_ext_hdr;
         struct {
diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index 2d1fabd0..2d1a3202 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -247,6 +247,11 @@ struct nbd_structured_reply_offset_hole {
   uint32_t length;              /* Length of hole. */
 } NBD_ATTRIBUTE_PACKED;

+struct nbd_structured_reply_offset_hole_ext {
+  uint64_t offset;
+  uint64_t length;              /* Length of hole. */
+} NBD_ATTRIBUTE_PACKED;
+
 /* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
 struct nbd_block_descriptor {
   uint32_t length;              /* length of block */
@@ -292,6 +297,7 @@ struct nbd_structured_reply_error {
 #define NBD_REPLY_TYPE_NONE             0
 #define NBD_REPLY_TYPE_OFFSET_DATA      1
 #define NBD_REPLY_TYPE_OFFSET_HOLE      2
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT  3
 #define NBD_REPLY_TYPE_BLOCK_STATUS     5
 #define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
 #define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 7e313b5a..e338bf74 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -28,15 +28,16 @@
  * requesting command.
  */
 static bool
-structured_reply_in_bounds (uint64_t offset, uint32_t length,
+structured_reply_in_bounds (uint64_t offset, uint64_t length,
                             const struct command *cmd)
 {
   if (offset < cmd->offset ||
       offset >= cmd->offset + cmd->count ||
-      offset + length > cmd->offset + cmd->count) {
+      length > cmd->offset + cmd->count ||
+      offset > cmd->offset + cmd->count - length) {
     set_error (0, "range of structured reply is out of bounds, "
                "offset=%" PRIu64 ", cmd->offset=%" PRIu64 ", "
-               "length=%" PRIu32 ", cmd->count=%" PRIu64 ": "
+               "length=%" PRIu64 ", cmd->count=%" PRIu64 ": "
                "this is likely to be a bug in the NBD server",
                offset, cmd->offset, length, cmd->count);
     return false;
@@ -141,6 +142,21 @@  REPLY.STRUCTURED_REPLY.CHECK:
     SET_NEXT_STATE (%RECV_OFFSET_HOLE);
     break;

+  case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+    if (cmd->type != NBD_CMD_READ ||
+        length != sizeof h->sbuf.reply.payload.offset_hole_ext)
+      goto resync;
+    if (!h->extended_headers) {
+      debug (h, "unexpected 64-bit hole without extended headers, "
+             "this is probably a server bug");
+      if (cmd->error == 0)
+        cmd->error = EPROTO;
+    }
+    h->rbuf = &h->sbuf.reply.payload.offset_hole_ext;
+    h->rlen = sizeof h->sbuf.reply.payload.offset_hole_ext;
+    SET_NEXT_STATE (%RECV_OFFSET_HOLE);
+    break;
+
   case NBD_REPLY_TYPE_BLOCK_STATUS:
     if (cmd->type != NBD_CMD_BLOCK_STATUS ||
         length < 12 || ((length-4) & 7) != 0)
@@ -406,7 +422,8 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
   struct command *cmd = h->reply_cmd;
   uint64_t offset;
-  uint32_t length;
+  uint64_t length;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -416,10 +433,14 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
     return 0;
   case 0:
     offset = be64toh (h->sbuf.reply.payload.offset_hole.offset);
-    length = be32toh (h->sbuf.reply.payload.offset_hole.length);
+    type = be16toh (h->sbuf.reply.hdr.structured.type);
+
+    if (type == NBD_REPLY_TYPE_OFFSET_HOLE)
+      length = be32toh (h->sbuf.reply.payload.offset_hole.length);
+    else
+      length = be64toh (h->sbuf.reply.payload.offset_hole_ext.length);

     assert (cmd); /* guaranteed by CHECK */
-
     assert (cmd->data && cmd->type == NBD_CMD_READ);

     /* Is the data within bounds? */
@@ -435,7 +456,10 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
     /* The spec states that 0-length requests are unspecified, but
      * 0-length replies are broken. Still, it's easy enough to support
      * them as an extension, and this works even when length == 0.
+     * Although length is 64 bits, the bounds check above ensures that
+     * it is no larger than the 64M cap we put on NBD_CMD_READ.
      */
+    assert (length <= SIZE_MAX);
     if (!cmd->initialized)
       memset ((char *) cmd->data + offset, 0, length);
     if (CALLBACK_IS_NOT_NULL (cmd->cb.fn.chunk)) {
-- 
2.38.1

