Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6B710CE3
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 104C820631; Thu, 25 May 2023 13:02:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:19 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6B39E204B1
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SyNzuY5EEWV0 for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 11A46204B5
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDusdu95i2ssBm65qOe9oWK7fxoxh7MykeX1AufuCps=;
	b=DftWXRaTGjom4wARZ+EUSjnA+vdCQYxK8K8+QlSG2p4H3e+RbcxcWbnDjBS7ZDkv//85Pm
	W0Bjq2+nOYLEE2VmNRQkDtcAvsQWsH0KodX8haMBVT6SFZJmf2/VZLIFCj5rVdF+Hipsq5
	fe3qeGKX8fzQ88U0S103Da9lAdKBaGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-HVvVk4Q8PC6ejQ2A8DBI6w-1; Thu, 25 May 2023 09:01:11 -0400
X-MC-Unique: HVvVk4Q8PC6ejQ2A8DBI6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CF01811E9F;
	Thu, 25 May 2023 13:01:11 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE06492B0A;
	Thu, 25 May 2023 13:01:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 05/22] states: Prepare to receive 64-bit replies
Date: Thu, 25 May 2023 08:00:51 -0500
Message-Id: <20230525130108.757242-6-eblake@redhat.com>
In-Reply-To: <20230525130108.757242-1-eblake@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5OuIIp31CaH.A.1z.ax1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2484
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-6-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:19 +0000 (UTC)

Support receiving headers for 64-bit replies if extended headers were
negotiated.  We already insist that the server not send us too much
payload in one reply, so we can exploit that and merge the 64-bit
length back into a normalized 32-bit field for the rest of the payload
length calculations.  The NBD protocol specifically documents that
extended mode takes precedence over structured replies, and that there
are no simple replies in extended mode.  We can also take advantage
that the handle field is in the same offset in all the various reply
types.

Note that if we negotiate extended headers, but a non-compliant server
replies with a non-extended header, this patch will stall waiting for
the server to send more bytes rather than noticing that the magic
number is wrong (for aio operations, you'll get a magic number
mismatch once you send a second command that elicits a reply; but for
blocking operations, we basically deadlock).  The easy alternative
would be to read just the first 4 bytes of magic, then determine how
many more bytes to expect; but that would require more states and
syscalls, and not worth it since the typical server will be compliant.
The other alternative is what the next patch implements: teaching
REPLY.RECV_REPLY to handle short reads that were at least long enough
to transmit magic to specifically look for magic number mismatch.

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  1 +
 generator/states-reply-structured.c | 52 +++++++++++++++++++----------
 generator/states-reply.c            | 34 ++++++++++++-------
 3 files changed, 58 insertions(+), 29 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 8a5f93d4..e4e21a4d 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -243,6 +243,7 @@ struct nbd_handle {
       union {
         struct nbd_simple_reply simple;
         struct nbd_structured_reply structured;
+        struct nbd_extended_reply extended;
       } hdr;
       union {
         struct nbd_structured_reply_offset_data offset_data;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index df509216..c53aed7b 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -45,14 +45,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,

 STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.START:
-  /* We've only read the simple_reply.  The structured_reply is longer,
-   * so read the remaining part.
+  /* If we have extended headers, we've already read the entire header.
+   * Otherwise, we've only read enough for a simple_reply; since structured
+   * replies are longer, read the remaining part.
    */
-  h->rbuf = &h->sbuf;
-  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
-  h->rlen = sizeof h->sbuf.reply.hdr.structured;
-  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
-  SET_NEXT_STATE (%RECV_REMAINING);
+  if (h->extended_headers) {
+    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*)&h->sbuf);
+    SET_NEXT_STATE (%CHECK);
+  }
+  else {
+    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf);
+    h->rlen = sizeof h->sbuf.reply.hdr.structured -
+      sizeof h->sbuf.reply.hdr.simple;
+    SET_NEXT_STATE (%RECV_REMAINING);
+  }
   return 0;

  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
@@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
  REPLY.STRUCTURED_REPLY.CHECK:
   struct command *cmd = h->reply_cmd;
   uint16_t flags, type;
-  uint32_t length;
+  uint64_t length;
+  uint64_t offset = -1;

+  assert (cmd);
   flags = be16toh (h->sbuf.reply.hdr.structured.flags);
   type = be16toh (h->sbuf.reply.hdr.structured.type);
-  length = be32toh (h->sbuf.reply.hdr.structured.length);
+  if (h->extended_headers) {
+    length = be64toh (h->sbuf.reply.hdr.extended.length);
+    offset = be64toh (h->sbuf.reply.hdr.extended.offset);
+  }
+  else
+    length = be32toh (h->sbuf.reply.hdr.structured.length);

   /* Reject a server that replies with too much information, but don't
    * reject a single structured reply to NBD_CMD_READ on the largest
@@ -83,13 +96,18 @@  REPLY.STRUCTURED_REPLY.CHECK:
    * not worth keeping the connection alive.
    */
   if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
-    set_error (0, "invalid server reply length %" PRIu32, length);
+    set_error (0, "invalid server reply length %" PRIu64, length);
     SET_NEXT_STATE (%.DEAD);
     return 0;
   }
+  /* For convenience, we now normalize extended replies into compact,
+   * doable since we validated that payload length fits in 32 bits.
+   */
+  h->sbuf.reply.hdr.structured.length = length;

   /* Skip an unexpected structured reply, including to an unknown cookie. */
-  if (cmd == NULL || !h->structured_replies)
+  if (cmd == NULL || !h->structured_replies ||
+      (h->extended_headers && offset != cmd->offset))
     goto resync;

   switch (type) {
@@ -168,7 +186,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     assert (length >= sizeof h->sbuf.reply.payload.error.error.error);
     assert (cmd);

@@ -207,7 +225,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     msglen = be16toh (h->sbuf.reply.payload.error.error.len);
     type = be16toh (h->sbuf.reply.hdr.structured.type);

@@ -307,7 +325,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -346,7 +364,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
     offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
@@ -426,7 +444,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
@@ -460,7 +478,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
diff --git a/generator/states-reply.c b/generator/states-reply.c
index 31e4bd2f..4e9f2dde 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -62,15 +62,19 @@  REPLY.START:
    */
   ssize_t r;

-  /* We read all replies initially as if they are simple replies, but
-   * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
-   * This works because the structured_reply header is larger.
+  /* With extended headers, there is only one size to read, so we can do it
+   * all in one syscall.  But for older structured replies, we don't know if
+   * we have a simple or structured reply until we read the magic number,
+   * requiring a two-part read with CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
    */
   assert (h->reply_cmd == NULL);
   assert (h->rlen == 0);

   h->rbuf = &h->sbuf.reply.hdr;
-  h->rlen = sizeof h->sbuf.reply.hdr.simple;
+  if (h->extended_headers)
+    h->rlen = sizeof h->sbuf.reply.hdr.extended;
+  else
+    h->rlen = sizeof h->sbuf.reply.hdr.simple;

   r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
   if (r == -1) {
@@ -116,16 +120,22 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
   uint64_t cookie;

   magic = be32toh (h->sbuf.reply.hdr.simple.magic);
-  if (magic == NBD_SIMPLE_REPLY_MAGIC) {
+  switch (magic) {
+  case NBD_SIMPLE_REPLY_MAGIC:
+    if (h->extended_headers)
+      goto invalid;
     SET_NEXT_STATE (%SIMPLE_REPLY.START);
-  }
-  else if (magic == NBD_STRUCTURED_REPLY_MAGIC) {
+    break;
+  case NBD_STRUCTURED_REPLY_MAGIC:
+  case NBD_EXTENDED_REPLY_MAGIC:
+    if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)
+      goto invalid;
     SET_NEXT_STATE (%STRUCTURED_REPLY.START);
-  }
-  else {
-    /* We've probably lost synchronization. */
-    SET_NEXT_STATE (%.DEAD);
-    set_error (0, "invalid reply magic 0x%" PRIx32, magic);
+    break;
+  default:
+  invalid:
+    SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
+    set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
 #if 0 /* uncomment to see desynchronized data */
     nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
                           sizeof (h->sbuf.reply.hdr.simple),
-- 
2.40.1

