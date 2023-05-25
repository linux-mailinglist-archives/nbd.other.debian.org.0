Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1F710CE7
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A08320617; Thu, 25 May 2023 13:02:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:34 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 6D586204D5
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id W6YrMg2bAb3L for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 7499020496
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2yVykIJntY5LZo/7F/EKQ3gpvDeaps3xDR+QyNEppE=;
	b=EvRLlYL90vWVRemrjccdeWJluFvCcg0VG6c2VaI6eJFoSF///xndO4qGi+3bdiETXf9SL4
	GMoHgrFelSdnl1kBvTwCk1K9oFXS1L+mnI1nNLBFi1Q/4KFS2RIrR6XYegPN6Oz9dkch4K
	DDX0ixZOn+1ZtCA1FrTrpS8UP9TgS90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-lDsZPe81MPySBT9qdWjl_Q-1; Thu, 25 May 2023 09:01:13 -0400
X-MC-Unique: lDsZPe81MPySBT9qdWjl_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69B1D28135A5;
	Thu, 25 May 2023 13:01:13 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 167D8492B0A;
	Thu, 25 May 2023 13:01:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 09/22] block_status: Accept 64-bit extents during block status
Date: Thu, 25 May 2023 08:00:55 -0500
Message-Id: <20230525130108.757242-10-eblake@redhat.com>
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
Resent-Message-ID: <Om6B8Oo1bbN.A.awE.qx1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2487
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-10-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:34 +0000 (UTC)

Support a server giving us a 64-bit extent.  Note that the protocol
says a server should not give a 64-bit answer when extended headers
are not negotiated; we can handle that by reporting EPROTO but
otherwise accepting the information.  Conversely, when extended
headers are in effect, the server must respond with the 64-bit extent
type, even if the extent length and flags both fit in 32 bits.  Since
we already store 64-bit extents internally, the user's 32-bit callback
doesn't have to care which reply chunk the server uses (the shim takes
care of that, and an upcoming patch adds new APIs to let the client
use a 64-bit callback).  Of course, until a later patch enables
extended headers negotiation, no compliant server will trigger the new
code here.

Implementation-wise, 'normal' and 'wide' are two different types but
have the same underlying size; keeping the two names makes it easier
to reason about when values are still in network byte order from the
server or native endian for local processing.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  3 +
 generator/states-reply-structured.c | 94 +++++++++++++++++++++++------
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 11186e24..e5423245 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -249,6 +249,7 @@ struct nbd_handle {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
         struct nbd_structured_reply_block_status_hdr bs_hdr;
+        struct nbd_structured_reply_block_status_ext_hdr bs_ext_hdr;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
@@ -307,6 +308,8 @@ struct nbd_handle {
     char *storage;      /* malloc's view */
     nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
     uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
+    struct nbd_block_descriptor_ext *wide;
+                        /* 64-bit NBD_REPLY_TYPE_BLOCK_STATUS_EXT; n slots */
   } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 784adb78..55d6bb2d 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -22,6 +22,8 @@
 #include <stdint.h>
 #include <inttypes.h>

+#include "minmax.h"
+
 /* Structured reply must be completely inside the bounds of the
  * requesting command.
  */
@@ -144,9 +146,34 @@  REPLY.STRUCTURED_REPLY.CHECK:
         length < 12 || ((length-4) & 7) != 0)
       goto resync;
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
+    if (h->extended_headers) {
+      debug (h, "unexpected 32-bit block status with extended headers, "
+             "this is probably a server bug");
+      if (cmd->error == 0)
+        cmd->error = EPROTO;
+    }
     /* Start by reading the context ID. */
     h->rbuf = &h->sbuf.reply.payload.bs_hdr;
     h->rlen = sizeof h->sbuf.reply.payload.bs_hdr;
+    h->sbuf.reply.payload.bs_ext_hdr.count = 0;
+    SET_NEXT_STATE (%RECV_BS_HEADER);
+    break;
+
+  case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+    if (cmd->type != NBD_CMD_BLOCK_STATUS ||
+        length < 24 ||
+        (length-8) % sizeof (struct nbd_block_descriptor_ext))
+      goto resync;
+    assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
+    if (!h->extended_headers) {
+      debug (h, "unexpected 64-bit block status without extended headers, "
+             "this is probably a server bug");
+      if (cmd->error == 0)
+        cmd->error = EPROTO;
+    }
+    /* Start by reading the context ID. */
+    h->rbuf = &h->sbuf.reply.payload.bs_ext_hdr;
+    h->rlen = sizeof h->sbuf.reply.payload.bs_ext_hdr;
     SET_NEXT_STATE (%RECV_BS_HEADER);
     break;

@@ -437,6 +464,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
   uint32_t count;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -446,24 +474,43 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     return 0;
   case 0:
     length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.reply.hdr.structured.type);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
-    assert (length >= 12);
-    length -= sizeof h->sbuf.reply.payload.bs_hdr;
-    count = length / (2 * sizeof (uint32_t));

-    /* Read raw data into a subset of h->bs_entries, then expand it
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+      assert (length >= 12);
+      length -= sizeof h->sbuf.reply.payload.bs_hdr;
+      count = length / (2 * sizeof (uint32_t));
+    }
+    else {
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      assert (length >= 24);
+      length -= sizeof h->sbuf.reply.payload.bs_ext_hdr;
+      count = length / sizeof (struct nbd_block_descriptor_ext);
+      if (count != be32toh (h->sbuf.reply.payload.bs_ext_hdr.count)) {
+        h->rbuf = NULL;
+        h->rlen = length;
+        SET_NEXT_STATE (%RESYNC);
+        return 0;
+      }
+    }
+    /* Normalize count for later use. */
+    h->sbuf.reply.payload.bs_ext_hdr.count = count;
+
+    /* Read raw data into an overlap of h->bs_entries, then move it
      * into place later during byte-swapping.
      */
     free (h->bs_entries.storage);
-    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
+    h->bs_entries.storage = malloc (MAX (count * sizeof *h->bs_entries.normal,
+                                         length));
     if (h->bs_entries.storage == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries.narrow;
+    h->rbuf = h->bs_entries.storage;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -471,11 +518,10 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:

  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   struct command *cmd = h->reply_cmd;
-  uint32_t length;
   uint32_t count;
   size_t i;
   uint32_t context_id;
-  uint32_t *raw;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -484,25 +530,35 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.reply.hdr.structured.type);
+    count = h->sbuf.reply.payload.bs_ext_hdr.count; /* normalized in BS_HEADER */

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    assert (h->bs_entries.normal);
-    assert (length >= 12);
+    assert (h->bs_entries.normal && count);
     assert (h->meta_valid);
-    count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
-      (2 * sizeof (uint32_t));

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.  Reverse order is essential, since we are
-     * expanding in-place from narrow to wider type.
+     * don't validate them.
      */
-    raw = h->bs_entries.narrow;
-    for (i = count; i-- > 0; ) {
-      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
-      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+      uint32_t *raw = h->bs_entries.narrow;
+
+      /* Expanding in-place from narrow to wide, must use reverse order. */
+      for (i = count; i-- > 0; ) {
+        h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+        h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+      }
+    }
+    else {
+      struct nbd_block_descriptor_ext *wide = h->bs_entries.wide;
+
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      for (i = 0; i < count; i++) {
+        h->bs_entries.normal[i].length = be64toh (wide[i].length);
+        h->bs_entries.normal[i].flags = be64toh (wide[i].status_flags);
+      }
     }

     /* Look up the context ID. */
-- 
2.40.1

