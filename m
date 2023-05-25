Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 847CC710CF0
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:03:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6943C204B5; Thu, 25 May 2023 13:03:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:03:22 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 5FCBF20481
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:02:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SkxrsYEcFRVe for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:02:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D372D20471
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ri7shTYrAtNvknSTvpRwr1IM93y8oWQkcUNhNp/4m0=;
	b=iFseswJcLq6WVkgpgJuhSvi2wHlbovE9xepKUW09U05/M7x/8WK4LdJjQC6ZzD6e0oRh5L
	XHVvZx5ytBy8HBuVHm49Ayvi+W1qur7qkjkFWyeVK8+HIG8yvWiz70kXHi16YyfJYSthFP
	GuVImbsMb7IhFPTZNG2tF/nRAByAMy4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-wMt_cTlBM-KS2T-a11mZ2g-1; Thu, 25 May 2023 09:01:41 -0400
X-MC-Unique: wMt_cTlBM-KS2T-a11mZ2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70E518039A4;
	Thu, 25 May 2023 13:01:09 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EF45492B0B;
	Thu, 25 May 2023 13:01:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 01/22] block_status: Refactor array storage
Date: Thu, 25 May 2023 08:00:47 -0500
Message-Id: <20230525130108.757242-2-eblake@redhat.com>
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
Resent-Message-ID: <UYt6HkcMr2O.A.VfB.ay1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2494
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-2-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:03:22 +0000 (UTC)

For 32-bit block status, we were able to cheat and use an array with
an odd number of elements, with array[0] holding the context id, and
passing &array[1] to the user's callback.  But once we have 64-bit
extents, we can no longer abuse array element 0 like that, for two
reasons: 64-bit extents contain uint64_t which might not be
alignment-compatible with an array of uint32_t on all architectures,
and the new NBD_REPLY_TYPE_BLOCK_STATUS_EXT adds an additional count
field before the array.

Split out a new state STRUCTURED_REPLY.BS_HEADER to receive the
context id (and eventually the new count field for 64-bit replies)
separately from the extents array, and add another structured_reply
type in the payload section for tracking it.  No behavioral change,
other than the rare possibility of landing in the new state.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  1 +
 lib/nbd-protocol.h                  | 17 +++++----
 generator/state_machine.ml          |  9 ++++-
 generator/states-reply-structured.c | 56 ++++++++++++++++++++---------
 4 files changed, 60 insertions(+), 23 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index b155681d..25eeea34 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -242,6 +242,7 @@ struct nbd_handle {
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
+        struct nbd_structured_reply_block_status_hdr bs_hdr;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index 0217891e..f4640a98 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -182,12 +182,6 @@ struct nbd_fixed_new_option_reply_meta_context {
   /* followed by a string */
 } NBD_ATTRIBUTE_PACKED;

-/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
-struct nbd_block_descriptor {
-  uint32_t length;              /* length of block */
-  uint32_t status_flags;        /* block type (hole etc) */
-} NBD_ATTRIBUTE_PACKED;
-
 /* Request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
@@ -224,6 +218,17 @@ struct nbd_structured_reply_offset_hole {
   uint32_t length;              /* Length of hole. */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
+struct nbd_block_descriptor {
+  uint32_t length;              /* length of block */
+  uint32_t status_flags;        /* block type (hole etc) */
+} NBD_ATTRIBUTE_PACKED;
+
+struct nbd_structured_reply_block_status_hdr {
+  uint32_t context_id;          /* metadata context ID */
+  /* followed by array of nbd_block_descriptor extents */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index 126159b9..1f0d00b0 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -871,10 +871,17 @@ and
     external_events = [];
   };

+  State {
+    default_state with
+    name = "RECV_BS_HEADER";
+    comment = "Receive header of structured reply block-status payload";
+    external_events = [];
+  };
+
   State {
     default_state with
     name = "RECV_BS_ENTRIES";
-    comment = "Receive a structured reply block-status payload";
+    comment = "Receive entries array of structured reply block-status payload";
     external_events = [];
   };

diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 5aca7262..96182222 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -126,19 +126,10 @@  REPLY.STRUCTURED_REPLY.CHECK:
         length < 12 || ((length-4) & 7) != 0)
       goto resync;
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    /* We read the context ID followed by all the entries into a
-     * single array and deal with it at the end.
-     */
-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
-      SET_NEXT_STATE (%.DEAD);
-      set_error (errno, "malloc");
-      break;
-    }
-    h->rbuf = h->bs_entries;
-    h->rlen = length;
-    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+    /* Start by reading the context ID. */
+    h->rbuf = &h->sbuf.sr.payload.bs_hdr;
+    h->rlen = sizeof h->sbuf.sr.payload.bs_hdr;
+    SET_NEXT_STATE (%RECV_BS_HEADER);
     break;

   default:
@@ -424,9 +415,41 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
   }
   return 0;

+ REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
+  struct command *cmd = h->reply_cmd;
+  uint32_t length;
+
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 1:
+    save_reply_state (h);
+    SET_NEXT_STATE (%.READY);
+    return 0;
+  case 0:
+    length = be32toh (h->sbuf.sr.structured_reply.length);
+
+    assert (cmd); /* guaranteed by CHECK */
+    assert (cmd->type == NBD_CMD_BLOCK_STATUS);
+    assert (length >= 12);
+    length -= sizeof h->sbuf.sr.payload.bs_hdr;
+
+    free (h->bs_entries);
+    h->bs_entries = malloc (length);
+    if (h->bs_entries == NULL) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (errno, "malloc");
+      return 0;
+    }
+    h->rbuf = h->bs_entries;
+    h->rlen = length;
+    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+  }
+  return 0;
+
  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
+  uint32_t count;
   size_t i;
   uint32_t context_id;

@@ -445,15 +468,16 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (h->bs_entries);
     assert (length >= 12);
     assert (h->meta_valid);
+    count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we
      * don't validate them.
      */
-    for (i = 0; i < length/4; ++i)
+    for (i = 0; i < count; ++i)
       h->bs_entries[i] = be32toh (h->bs_entries[i]);

     /* Look up the context ID. */
-    context_id = h->bs_entries[0];
+    context_id = be32toh (h->sbuf.sr.payload.bs_hdr.context_id);
     for (i = 0; i < h->meta_contexts.len; ++i)
       if (context_id == h->meta_contexts.ptr[i].context_id)
         break;
@@ -464,7 +488,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          h->meta_contexts.ptr[i].name, cmd->offset,
-                         &h->bs_entries[1], (length-4) / 4,
+                         h->bs_entries, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
-- 
2.40.1

