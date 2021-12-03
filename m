Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 778914680A3
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:35:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DC442015F; Fri,  3 Dec 2021 23:35:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:35:17 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 12CD920139
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:35:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CiFLkt4j5Sb3 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:35:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1A186200EC
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFgsUcfC1h8az0y3VTWWm6qG/l5X1huw2oQ+ZNKlM1I=;
	b=WA2jP0fCRF2NjAoT4WDcu/7Qs3rfs+hjwKuj31DQDTD9P3Mfu19+m0lyzX2jOO+ThRbBRn
	1vcaPCzzl7Q1o+AT4YKArROX4fgL03f90dBXAacCNl83TCTGd8mWJ4Ol+kcYNpFL9pu96/
	u3G4sOLe0YPxRWcn7Kqb4g8f8kotiZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-40-PZayFiBgP-qbyP7yhIDTlQ-1; Fri, 03 Dec 2021 18:18:00 -0500
X-MC-Unique: PZayFiBgP-qbyP7yhIDTlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022DF2F25;
	Fri,  3 Dec 2021 23:17:59 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FAB65DF37;
	Fri,  3 Dec 2021 23:17:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 06/13] protocol: Accept 64-bit holes during pread
Date: Fri,  3 Dec 2021 17:17:34 -0600
Message-Id: <20211203231741.3901263-7-eblake@redhat.com>
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
Resent-Message-ID: <aV4QG76hKJE.A.crD.1mqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1643
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-7-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:35:17 +0000 (UTC)

Even though we don't allow the user to request NBD_CMD_READ with more
than 64M (and even if we did, our API signature caps us at SIZE_MAX,
which is 32 bits on a 32-bit machine), the NBD extension to allow
64-bit requests implies that for symmetry we have to be able to
support 64-bit holes over the wire.  Note that we don't have to change
the signature of the callback for nbd_pread_structured; nor is it
worth adding a counterpart to LIBNBD_READ_HOLE, because it is unlikely
that a user callback will ever need to distinguish between which size
was sent over the wire, when the value is always less than 32 bits.

While we cannot guarantee which size structured reply the server will
use, it is easy enough to handle both sizes, even for a non-compliant
server that sends wide replies when extended headers were not
negotiated.  Of course, until a later patch enables extended headers
negotiation, no compliant server will trigger the new code here.
---
 lib/internal.h                      |  1 +
 generator/states-reply-structured.c | 41 +++++++++++++++++++++++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index c9f84441..06f3a65c 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -231,6 +231,7 @@ struct nbd_handle {
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
+        struct nbd_structured_reply_offset_hole_ext offset_hole_ext;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 1b675e8d..a3e0e2ac 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -26,15 +26,16 @@
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
@@ -182,6 +183,25 @@ STATE_MACHINE {
     SET_NEXT_STATE (%RECV_OFFSET_HOLE);
     return 0;
   }
+  else if (type == NBD_REPLY_TYPE_OFFSET_HOLE_EXT) {
+    if (cmd->type != NBD_CMD_READ) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (0, "invalid command for receiving offset-hole chunk, "
+                 "cmd->type=%" PRIu16 ", "
+                 "this is likely to be a bug in the server",
+                 cmd->type);
+      return 0;
+    }
+    if (length != sizeof h->sbuf.sr.payload.offset_hole_ext) {
+      SET_NEXT_STATE (%.DEAD);
+      set_error (0, "invalid length in NBD_REPLY_TYPE_OFFSET_HOLE_EXT");
+      return 0;
+    }
+    h->rbuf = &h->sbuf.sr.payload.offset_hole_ext;
+    h->rlen = sizeof h->sbuf.sr.payload.offset_hole_ext;
+    SET_NEXT_STATE (%RECV_OFFSET_HOLE);
+    return 0;
+  }
   else if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
     if (cmd->type != NBD_CMD_BLOCK_STATUS) {
       SET_NEXT_STATE (%.DEAD);
@@ -415,7 +435,8 @@ STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
   struct command *cmd = h->reply_cmd;
   uint64_t offset;
-  uint32_t length;
+  uint64_t length;
+  uint16_t type;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -425,7 +446,14 @@ STATE_MACHINE {
     return 0;
   case 0:
     offset = be64toh (h->sbuf.sr.payload.offset_hole.offset);
-    length = be32toh (h->sbuf.sr.payload.offset_hole.length);
+    type = be16toh (h->sbuf.sr.hdr.structured_reply.type);
+
+    if (type == NBD_REPLY_TYPE_OFFSET_HOLE)
+      length = be32toh (h->sbuf.sr.payload.offset_hole.length);
+    else {
+      /* XXX Insist on h->extended_headers? */
+      length = be64toh (h->sbuf.sr.payload.offset_hole_ext.length);
+    }

     assert (cmd); /* guaranteed by CHECK */

@@ -443,7 +471,10 @@ STATE_MACHINE {
     /* The spec states that 0-length requests are unspecified, but
      * 0-length replies are broken. Still, it's easy enough to support
      * them as an extension, and this works even when length == 0.
+     * Although length is 64 bits, the bounds check above ensures that
+     * it is no larger than the 64M cap we put on NBD_CMD_READ.
      */
+    assert (length <= SIZE_MAX);
     memset (cmd->data + offset, 0, length);
     if (CALLBACK_IS_NOT_NULL (cmd->cb.fn.chunk)) {
       int error = cmd->error;
-- 
2.33.1

