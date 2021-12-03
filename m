Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B942468096
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:34:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 839A720153; Fri,  3 Dec 2021 23:34:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:34:34 2021
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
	by bendel.debian.org (Postfix) with ESMTP id B697920160
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:34:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OFMfmsg742Oi for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:34:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D4FBA20166
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yq9+0y1UxR18S3xmAgY3WiBq2xgju+gepQpUQw8ewWE=;
	b=G/YWP1zCmAu13+dcWZ1iPdX0kcfp1ORie5wdLdUf2nPkSDU0tRy/6/WFMl8gAELMcVhH0n
	jLm6R9nCCjufHgB5N0pJ8RObV/u4Suo3kNThs7u+NwE9Iwzx3+4fCzuMUZd22/gpa16I6a
	YHZ4QFlaZmppnEXhANAUipLCyiqVgKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-rnSsou_pMJ24WIy0JL2fVw-1; Fri, 03 Dec 2021 18:18:04 -0500
X-MC-Unique: rnSsou_pMJ24WIy0JL2fVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1C58042F7;
	Fri,  3 Dec 2021 23:18:03 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B94A5DF2B;
	Fri,  3 Dec 2021 23:18:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 09/13] block_status: Accept 64-bit extents during block status
Date: Fri,  3 Dec 2021 17:17:37 -0600
Message-Id: <20211203231741.3901263-10-eblake@redhat.com>
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
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
Resent-Message-ID: <SuBGor-8UgM.A.OoD.KmqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1642
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-10-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:34:34 +0000 (UTC)

Support a server giving us a 64-bit extent.  Note that the protocol
says a server should not give a 64-bit answer when extended headers
are not negotiated, but since the client's size is merely a hint, it
is possible for a server to have a 64-bit answer even when the
original query was 32 bits.  At any rate, it is just as easy for us to
always support the new chunk type as it is to complain when it is used
incorrectly by the server, and the user's 32-bit callback doesn't have
to care which size the server's result used (either the server's
result was a 32-bit value, or our shim silently truncates it, but the
user still makes progress).  Of course, until a later patch enables
extended headers negotiation, no compliant server will trigger the new
code here.

Implementation-wise, we don't care if we will be narrowing from the
server's 16-byte extent (including explicit padding) to a 12-byte
struct, or if our 'nbd_extent' type has implicit padding and is thus
also 16 bytes; either way, the order of our byte-swapping traversal is
safe.
---
 lib/internal.h                      |  1 +
 generator/states-reply-structured.c | 75 +++++++++++++++++++++++------
 2 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 4800df83..97abf4f2 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -289,6 +289,7 @@ struct nbd_handle {
   union {
     nbd_extent *normal; /* Our 64-bit preferred internal form */
     uint32_t *narrow;   /* 32-bit form of NBD_REPLY_TYPE_BLOCK_STATUS */
+    struct nbd_block_descriptor_ext *wide; /* NBD_REPLY_TYPE_BLOCK_STATUS_EXT */
   } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 71c761e9..29b1c3d8 100644
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
@@ -202,7 +204,8 @@ STATE_MACHINE {
     SET_NEXT_STATE (%RECV_OFFSET_HOLE);
     return 0;
   }
-  else if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+  else if (type == NBD_REPLY_TYPE_BLOCK_STATUS ||
+           type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT) {
     if (cmd->type != NBD_CMD_BLOCK_STATUS) {
       SET_NEXT_STATE (%.DEAD);
       set_error (0, "invalid command for receiving block-status chunk, "
@@ -211,12 +214,19 @@ STATE_MACHINE {
                  cmd->type);
       return 0;
     }
-    /* XXX We should be able to skip the bad reply in these two cases. */
-    if (length < 12 || ((length-4) & 7) != 0) {
+    /* XXX We should be able to skip the bad reply in these cases. */
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS &&
+        (length < 12 || (length-4) % (2 * sizeof(uint32_t)))) {
       SET_NEXT_STATE (%.DEAD);
       set_error (0, "invalid length in NBD_REPLY_TYPE_BLOCK_STATUS");
       return 0;
     }
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT &&
+        (length < 20 || (length-4) % sizeof(struct nbd_block_descriptor_ext))) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (0, "invalid length in NBD_REPLY_TYPE_BLOCK_STATUS_EXT");
+      return 0;
+    }
     if (CALLBACK_IS_NULL (cmd->cb.fn.extent)) {
       SET_NEXT_STATE (%.DEAD);
       set_error (0, "not expecting NBD_REPLY_TYPE_BLOCK_STATUS here");
@@ -495,6 +505,7 @@ STATE_MACHINE {
   struct command *cmd = h->reply_cmd;
   uint32_t length;
   uint32_t count;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -504,24 +515,33 @@ STATE_MACHINE {
     return 0;
   case 0:
     length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (length >= 12);
     length -= sizeof h->bs_contextid;
-    count = length / (2 * sizeof (uint32_t));
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS)
+      count = length / (2 * sizeof (uint32_t));
+    else {
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      /* XXX Insist on h->extended_headers? */
+      count = length / sizeof (struct nbd_block_descriptor_ext);
+    }

-    /* Read raw data into a subset of h->bs_entries, then expand it
+    /* Read raw data into an overlap of h->bs_entries, then move it
      * into place later later during byte-swapping.
      */
     free (h->bs_entries.normal);
-    h->bs_entries.normal = malloc (count * sizeof *h->bs_entries.normal);
+    h->bs_entries.normal = malloc (MAX (count * sizeof *h->bs_entries.normal,
+                                        length));
     if (h->bs_entries.normal == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries.narrow;
+    h->rbuf = type == NBD_REPLY_TYPE_BLOCK_STATUS
+      ? h->bs_entries.narrow : (void *) h->bs_entries.wide;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -533,7 +553,7 @@ STATE_MACHINE {
   uint32_t count;
   size_t i;
   uint32_t context_id;
-  uint32_t *raw;
+  uint16_t type;
   struct meta_context *meta_context;

   switch (recv_into_rbuf (h)) {
@@ -544,23 +564,46 @@ STATE_MACHINE {
     return 0;
   case 0:
     length = h->sbuf.sr.hdr.structured_reply.length; /* normalized in CHECK */
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     assert (h->bs_entries.normal);
     assert (length >= 12);
-    count = (length - sizeof h->bs_contextid) / (2 * sizeof (uint32_t));
+    length -= sizeof h->bs_contextid;

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.  Reverse order is essential, since we are
-     * expanding in-place from narrow to wider type.
+     * don't validate them.
      */
-    raw = h->bs_entries.narrow;
-    for (i = count; i > 0; ) {
-      --i;
-      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
-      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
+      uint32_t *raw = h->bs_entries.narrow;
+
+      /* Expanding in-place from narrow to wide, must use reverse order. */
+      count = length / (2 * sizeof (uint32_t));
+      for (i = count; i > 0; ) {
+        --i;
+        h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+        h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+      }
+    }
+    else {
+      struct nbd_block_descriptor_ext *wide = h->bs_entries.wide;
+
+      /* ABI determines whether nbd_extent is 12 or 16 bytes, but the
+       * server sent us 16 bytes, so we must process in forward order.
+       */
+      assert (type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT);
+      count = length / sizeof (struct nbd_block_descriptor_ext);
+      for (i = 0; i < count; i++) {
+        h->bs_entries.normal[i].length = be64toh (wide[i].length);
+        h->bs_entries.normal[i].flags = be32toh (wide[i].status_flags);
+        if (wide[i].pad) {
+          set_error (0, "server sent non-zero padding in block status");
+          SET_NEXT_STATE(%.DEAD);
+          return 0;
+        }
+      }
     }

     /* Look up the context ID. */
-- 
2.33.1

