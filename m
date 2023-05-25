Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF78710CEF
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:03:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 60834204D5; Thu, 25 May 2023 13:03:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:03:13 2023
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
	by bendel.debian.org (Postfix) with ESMTP id D31B7204B5
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:02:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Pjm-NckU3jS3 for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:02:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CA82920481
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbAAiz9ur0k1hoqKwcg34ifUhtL0qoSjLaqfVJOgQFY=;
	b=AJjzeGKIwtJo0ZSmv32DvFBju+OASKU1GYmrpWbmbIrK7yFrIOINkK76L64z/lTUCCEO2b
	ld5iMmzLxCO/yAnSDou4ulU1qXvIiaYidhx28WVy+xYD/jLn0u84aqsV9Kc8fmb/9/MfA5
	hsmK3TrdAAk64lArBJIoi+3jMKV9VDk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-xcYfpuAVPfmroXCjGbtyKQ-1; Thu, 25 May 2023 09:01:14 -0400
X-MC-Unique: xcYfpuAVPfmroXCjGbtyKQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 035823C17C67;
	Thu, 25 May 2023 13:01:10 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95202492B0C;
	Thu, 25 May 2023 13:01:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 02/22] internal: Refactor layout of replies in sbuf
Date: Thu, 25 May 2023 08:00:48 -0500
Message-Id: <20230525130108.757242-3-eblake@redhat.com>
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
Resent-Message-ID: <Oxr_Qn7hTjJ.A.MGH.Ry1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2493
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-3-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:03:13 +0000 (UTC)

In order to more easily add a third reply type with an even larger
header, but where the payload will look the same for both structured
and extended replies, it is nicer if simple and structured replies are
nested inside the same layer of sbuf.reply.hdr.  While at it, note
that while .or and .sr are structs declared within the overall sbuf
union, we never read into both halves of those structs at the same
time, so it does not matter if their two halves are consecutive.
Dropping the packed notation on those structs means the compiler can
align .payload more naturally, which may slightly improve performance
on some platforms, even if it makes the overall union a few bytes
larger due to padding.

Visually, this patch changes the layout from:

 offset  simple                structured
+------------------------------------------------------------+
|     union sbuf                                             |
|     +---------------------+------------------------------+ |
|     | struct simple_reply | union sr                     | |
|     | +-----------------+ | +--------------------------+ | |
|     | |                 | | | struct structured_reply  | | |
|     | |                 | | | +----------------------+ | | |
|  0  | | uint32_t magic  | | | | uint32_t magic       | | | |
|  4  | | uint32_t error  | | | | uint16_t flags       | | | |
|  6  | |                 | | | | uint16_t type        | | | |
|  8  | | uint64_t handle | | | | uint64_t handle      | | | |
|     | +-----------------+ | | |                      | | | |
| 16  | [padding]           | | | uint32_t length      | | | |
|     |                     | | +----------------------+ | | |
|     |                     | | union payload            | | |
|     |                     | | +-----------+----------+ | | |
| 20  |                     | | | ...       | ...      | | | |
|     |                     | | +-----------+----------+ | | |
|     |                     | +--------------------------+ | |
|     +---------------------+------------------------------+ |
+------------------------------------------------------------+

to:

 offset  simple                structured
+-------------------------------------------------------------+
|     union sbuf                                              |
|     +-----------------------------------------------------+ |
|     | struct reply                                        | |
|     | +-------------------------------------------------+ | |
|     | | union hdr                                       | | |
|     | | +--------------------+------------------------+ | | |
|     | | | struct simple      | struct structured      | | | |
|     | | | +----------------+ | +--------------------+ | | | |
|  0  | | | | uint32_t magic | | | uint32_t magic     | | | | |
|  4  | | | | uint32_t error | | | uint16_t flags     | | | | |
|  6  | | | |                | | | uint16_t type      | | | | |
|  8  | | | | uint64_t handle| | | uint64_t handle    | | | | |
|     | | | +----------------+ | |                    | | | | |
| 16  | | | [padding]          | | uint32_t length    | | | | |
|     | | |                    | +--------------------+ | | | |
| 20  | | |                    | [padding]              | | | |
|     | | +--------------------+------------------------+ | | |
|     | | union payload                                   | | |
|     | | +--------------------+------------------------+ | | |
| 24  | | | ...                | ...                    | | | |
|     | | +--------------------+------------------------+ | | |
|     | +-------------------------------------------------+ | |
|     +-----------------------------------------------------+ |
+-------------------------------------------------------------+

Technically, whether the payload union offset moves to byte 24 (with
20-23 now padding) or stays at 20 depends on compiler ABI; but many
systems prefer that any struct with a uint64_t provide 8-byte
alignment to its containing union.

The commit is largely mechanical, and there should be no semantic
change.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  12 ++--
 generator/states-reply-simple.c     |   4 +-
 generator/states-reply-structured.c | 103 ++++++++++++++--------------
 generator/states-reply.c            |  14 ++--
 4 files changed, 68 insertions(+), 65 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 25eeea34..c71980ef 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -231,14 +231,16 @@ struct nbd_handle {
         struct {
           struct nbd_fixed_new_option_reply_meta_context context;
           char str[NBD_MAX_STRING];
-        }  __attribute__ ((packed)) context;
+        } __attribute__ ((packed)) context;
         char err_msg[NBD_MAX_STRING];
       } payload;
-    }  __attribute__ ((packed)) or;
+    } or;
     struct nbd_export_name_option_reply export_name_reply;
-    struct nbd_simple_reply simple_reply;
     struct {
-      struct nbd_structured_reply structured_reply;
+      union {
+        struct nbd_simple_reply simple;
+        struct nbd_structured_reply structured;
+      } hdr;
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
@@ -249,7 +251,7 @@ struct nbd_handle {
           uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
         } __attribute__ ((packed)) error;
       } payload;
-    }  __attribute__ ((packed)) sr;
+    } reply;
     uint16_t gflags;
     uint32_t cflags;
     uint32_t len;
diff --git a/generator/states-reply-simple.c b/generator/states-reply-simple.c
index 8fd9f62a..e6f1ee23 100644
--- a/generator/states-reply-simple.c
+++ b/generator/states-reply-simple.c
@@ -23,7 +23,7 @@  REPLY.SIMPLE_REPLY.START:
   struct command *cmd = h->reply_cmd;
   uint32_t error;

-  error = be32toh (h->sbuf.simple_reply.error);
+  error = be32toh (h->sbuf.reply.hdr.simple.error);

   if (cmd == NULL) {
     /* Unexpected reply.  If error was set or we have structured
@@ -39,7 +39,7 @@  REPLY.SIMPLE_REPLY.START:
     if (error || h->structured_replies)
       SET_NEXT_STATE (%^FINISH_COMMAND);
     else {
-      uint64_t cookie = be64toh (h->sbuf.simple_reply.handle);
+      uint64_t cookie = be64toh (h->sbuf.reply.hdr.simple.handle);
       SET_NEXT_STATE (%.DEAD);
       set_error (EPROTO,
                  "no matching cookie %" PRIu64 " found for server reply, "
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index 96182222..6f96945a 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -49,9 +49,9 @@  REPLY.STRUCTURED_REPLY.START:
    * so read the remaining part.
    */
   h->rbuf = &h->sbuf;
-  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.simple_reply;
-  h->rlen = sizeof h->sbuf.sr.structured_reply;
-  h->rlen -= sizeof h->sbuf.simple_reply;
+  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
+  h->rlen = sizeof h->sbuf.reply.hdr.structured;
+  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
   SET_NEXT_STATE (%RECV_REMAINING);
   return 0;

@@ -71,9 +71,9 @@  REPLY.STRUCTURED_REPLY.CHECK:
   uint16_t flags, type;
   uint32_t length;

-  flags = be16toh (h->sbuf.sr.structured_reply.flags);
-  type = be16toh (h->sbuf.sr.structured_reply.type);
-  length = be32toh (h->sbuf.sr.structured_reply.length);
+  flags = be16toh (h->sbuf.reply.hdr.structured.flags);
+  type = be16toh (h->sbuf.reply.hdr.structured.type);
+  length = be32toh (h->sbuf.reply.hdr.structured.length);

   /* Reject a server that replies with too much information, but don't
    * reject a single structured reply to NBD_CMD_READ on the largest
@@ -82,7 +82,7 @@  REPLY.STRUCTURED_REPLY.CHECK:
    * oversized reply is going to take long enough to resync that it is
    * not worth keeping the connection alive.
    */
-  if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.sr.payload.offset_data) {
+  if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
     set_error (0, "invalid server reply length %" PRIu32, length);
     SET_NEXT_STATE (%.DEAD);
     return 0;
@@ -105,19 +105,19 @@  REPLY.STRUCTURED_REPLY.CHECK:
      * them as an extension, so we use < instead of <=.
      */
     if (cmd->type != NBD_CMD_READ ||
-        length < sizeof h->sbuf.sr.payload.offset_data)
+        length < sizeof h->sbuf.reply.payload.offset_data)
       goto resync;
-    h->rbuf = &h->sbuf.sr.payload.offset_data;
-    h->rlen = sizeof h->sbuf.sr.payload.offset_data;
+    h->rbuf = &h->sbuf.reply.payload.offset_data;
+    h->rlen = sizeof h->sbuf.reply.payload.offset_data;
     SET_NEXT_STATE (%RECV_OFFSET_DATA);
     break;

   case NBD_REPLY_TYPE_OFFSET_HOLE:
     if (cmd->type != NBD_CMD_READ ||
-        length != sizeof h->sbuf.sr.payload.offset_hole)
+        length != sizeof h->sbuf.reply.payload.offset_hole)
       goto resync;
-    h->rbuf = &h->sbuf.sr.payload.offset_hole;
-    h->rlen = sizeof h->sbuf.sr.payload.offset_hole;
+    h->rbuf = &h->sbuf.reply.payload.offset_hole;
+    h->rlen = sizeof h->sbuf.reply.payload.offset_hole;
     SET_NEXT_STATE (%RECV_OFFSET_HOLE);
     break;

@@ -127,8 +127,8 @@  REPLY.STRUCTURED_REPLY.CHECK:
       goto resync;
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     /* Start by reading the context ID. */
-    h->rbuf = &h->sbuf.sr.payload.bs_hdr;
-    h->rlen = sizeof h->sbuf.sr.payload.bs_hdr;
+    h->rbuf = &h->sbuf.reply.payload.bs_hdr;
+    h->rlen = sizeof h->sbuf.reply.payload.bs_hdr;
     SET_NEXT_STATE (%RECV_BS_HEADER);
     break;

@@ -139,10 +139,10 @@  REPLY.STRUCTURED_REPLY.CHECK:
        * compliant, will favor the wire error over EPROTO during more
        * length checks in RECV_ERROR_MESSAGE and RECV_ERROR_TAIL.
        */
-      if (length < sizeof h->sbuf.sr.payload.error.error.error)
+      if (length < sizeof h->sbuf.reply.payload.error.error.error)
         goto resync;
-      h->rbuf = &h->sbuf.sr.payload.error.error;
-      h->rlen = MIN (length, sizeof h->sbuf.sr.payload.error.error);
+      h->rbuf = &h->sbuf.reply.payload.error.error;
+      h->rlen = MIN (length, sizeof h->sbuf.reply.payload.error.error);
       SET_NEXT_STATE (%RECV_ERROR);
     }
     else
@@ -168,19 +168,19 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
-    assert (length >= sizeof h->sbuf.sr.payload.error.error.error);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    assert (length >= sizeof h->sbuf.reply.payload.error.error.error);
     assert (cmd);

-    if (length < sizeof h->sbuf.sr.payload.error.error)
+    if (length < sizeof h->sbuf.reply.payload.error.error)
       goto resync;

-    msglen = be16toh (h->sbuf.sr.payload.error.error.len);
-    if (msglen > length - sizeof h->sbuf.sr.payload.error.error ||
-        msglen > sizeof h->sbuf.sr.payload.error.msg)
+    msglen = be16toh (h->sbuf.reply.payload.error.error.len);
+    if (msglen > length - sizeof h->sbuf.reply.payload.error.error ||
+        msglen > sizeof h->sbuf.reply.payload.error.msg)
       goto resync;

-    h->rbuf = h->sbuf.sr.payload.error.msg;
+    h->rbuf = h->sbuf.reply.payload.error.msg;
     h->rlen = msglen;
     SET_NEXT_STATE (%RECV_ERROR_MESSAGE);
   }
@@ -188,11 +188,11 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:

  resync:
   /* Favor the error packet's errno over RESYNC's EPROTO. */
-  error = be32toh (h->sbuf.sr.payload.error.error.error);
+  error = be32toh (h->sbuf.reply.payload.error.error.error);
   if (cmd->error == 0)
     cmd->error = nbd_internal_errno_of_nbd_error (error);
   h->rbuf = NULL;
-  h->rlen = length - MIN (length, sizeof h->sbuf.sr.payload.error.error);
+  h->rlen = length - MIN (length, sizeof h->sbuf.reply.payload.error.error);
   SET_NEXT_STATE (%RESYNC);
   return 0;

@@ -207,15 +207,15 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
-    msglen = be16toh (h->sbuf.sr.payload.error.error.len);
-    type = be16toh (h->sbuf.sr.structured_reply.type);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    msglen = be16toh (h->sbuf.reply.payload.error.error.len);
+    type = be16toh (h->sbuf.reply.hdr.structured.type);

-    length -= sizeof h->sbuf.sr.payload.error.error + msglen;
+    length -= sizeof h->sbuf.reply.payload.error.error + msglen;

     if (msglen)
       debug (h, "structured error server message: %.*s", (int)msglen,
-             h->sbuf.sr.payload.error.msg);
+             h->sbuf.reply.payload.error.msg);

     /* Special case two specific errors; silently ignore tail for all others */
     h->rbuf = NULL;
@@ -227,11 +227,11 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
                "the server may have a bug");
       break;
     case NBD_REPLY_TYPE_ERROR_OFFSET:
-      if (length != sizeof h->sbuf.sr.payload.error.offset)
+      if (length != sizeof h->sbuf.reply.payload.error.offset)
         debug (h, "unable to safely extract error offset, "
                "the server may have a bug");
       else
-        h->rbuf = &h->sbuf.sr.payload.error.offset;
+        h->rbuf = &h->sbuf.reply.payload.error.offset;
       break;
     }
     SET_NEXT_STATE (%RECV_ERROR_TAIL);
@@ -250,8 +250,8 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_TAIL:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    error = be32toh (h->sbuf.sr.payload.error.error.error);
-    type = be16toh (h->sbuf.sr.structured_reply.type);
+    error = be32toh (h->sbuf.reply.payload.error.error.error);
+    type = be16toh (h->sbuf.reply.hdr.structured.type);

     assert (cmd); /* guaranteed by CHECK */

@@ -266,7 +266,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_TAIL:
      * user callback if present.  Ignore the offset if it was bogus.
      */
     if (type == NBD_REPLY_TYPE_ERROR_OFFSET && h->rbuf) {
-      uint64_t offset = be64toh (h->sbuf.sr.payload.error.offset);
+      uint64_t offset = be64toh (h->sbuf.reply.payload.error.offset);
       if (structured_reply_in_bounds (offset, 0, cmd) &&
           cmd->type == NBD_CMD_READ &&
           CALLBACK_IS_NOT_NULL (cmd->cb.fn.chunk)) {
@@ -307,8 +307,8 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
-    offset = be64toh (h->sbuf.sr.payload.offset_data.offset);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */

@@ -346,8 +346,8 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
-    offset = be64toh (h->sbuf.sr.payload.offset_data.offset);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);
+    offset = be64toh (h->sbuf.reply.payload.offset_data.offset);

     assert (cmd); /* guaranteed by CHECK */
     if (CALLBACK_IS_NOT_NULL (cmd->cb.fn.chunk)) {
@@ -377,8 +377,8 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    offset = be64toh (h->sbuf.sr.payload.offset_hole.offset);
-    length = be32toh (h->sbuf.sr.payload.offset_hole.length);
+    offset = be64toh (h->sbuf.reply.payload.offset_hole.offset);
+    length = be32toh (h->sbuf.reply.payload.offset_hole.length);

     assert (cmd); /* guaranteed by CHECK */

@@ -426,12 +426,12 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (length >= 12);
-    length -= sizeof h->sbuf.sr.payload.bs_hdr;
+    length -= sizeof h->sbuf.reply.payload.bs_hdr;

     free (h->bs_entries);
     h->bs_entries = malloc (length);
@@ -460,7 +460,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     SET_NEXT_STATE (%.READY);
     return 0;
   case 0:
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
@@ -468,7 +468,8 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (h->bs_entries);
     assert (length >= 12);
     assert (h->meta_valid);
-    count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;
+    count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
+      sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we
      * don't validate them.
@@ -477,7 +478,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
       h->bs_entries[i] = be32toh (h->bs_entries[i]);

     /* Look up the context ID. */
-    context_id = be32toh (h->sbuf.sr.payload.bs_hdr.context_id);
+    context_id = be32toh (h->sbuf.reply.payload.bs_hdr.context_id);
     for (i = 0; i < h->meta_contexts.len; ++i)
       if (context_id == h->meta_contexts.ptr[i].context_id)
         break;
@@ -524,8 +525,8 @@  REPLY.STRUCTURED_REPLY.RESYNC:
       SET_NEXT_STATE (%^FINISH_COMMAND);
       return 0;
     }
-    type = be16toh (h->sbuf.sr.structured_reply.type);
-    length = be32toh (h->sbuf.sr.structured_reply.length);
+    type = be16toh (h->sbuf.reply.hdr.structured.type);
+    length = be32toh (h->sbuf.reply.hdr.structured.length);
     debug (h, "unexpected reply type %u or payload length %" PRIu32
            " for cookie %" PRIu64 " and command %" PRIu32
            ", this is probably a server bug",
@@ -539,7 +540,7 @@  REPLY.STRUCTURED_REPLY.RESYNC:
  REPLY.STRUCTURED_REPLY.FINISH:
   uint16_t flags;

-  flags = be16toh (h->sbuf.sr.structured_reply.flags);
+  flags = be16toh (h->sbuf.reply.hdr.structured.flags);
   if (flags & NBD_REPLY_FLAG_DONE) {
     SET_NEXT_STATE (%^FINISH_COMMAND);
   }
diff --git a/generator/states-reply.c b/generator/states-reply.c
index f7888154..31e4bd2f 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -69,8 +69,8 @@  REPLY.START:
   assert (h->reply_cmd == NULL);
   assert (h->rlen == 0);

-  h->rbuf = &h->sbuf;
-  h->rlen = sizeof h->sbuf.simple_reply;
+  h->rbuf = &h->sbuf.reply.hdr;
+  h->rlen = sizeof h->sbuf.reply.hdr.simple;

   r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
   if (r == -1) {
@@ -115,7 +115,7 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
   uint32_t magic;
   uint64_t cookie;

-  magic = be32toh (h->sbuf.simple_reply.magic);
+  magic = be32toh (h->sbuf.reply.hdr.simple.magic);
   if (magic == NBD_SIMPLE_REPLY_MAGIC) {
     SET_NEXT_STATE (%SIMPLE_REPLY.START);
   }
@@ -127,8 +127,8 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
     SET_NEXT_STATE (%.DEAD);
     set_error (0, "invalid reply magic 0x%" PRIx32, magic);
 #if 0 /* uncomment to see desynchronized data */
-    nbd_internal_hexdump (&h->sbuf.simple_reply,
-                          sizeof (h->sbuf.simple_reply),
+    nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
+                          sizeof (h->sbuf.reply.hdr.simple),
                           stderr);
 #endif
     return 0;
@@ -138,7 +138,7 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
    * handle (our cookie) is stored at the same offset.
    */
   h->chunks_received++;
-  cookie = be64toh (h->sbuf.simple_reply.handle);
+  cookie = be64toh (h->sbuf.reply.hdr.simple.handle);
   /* Find the command amongst the commands in flight. If the server sends
    * a reply for an unknown cookie, FINISH will diagnose that later.
    */
@@ -157,7 +157,7 @@  REPLY.FINISH_COMMAND:
   /* NB: This works for both simple and structured replies because the
    * handle (our cookie) is stored at the same offset.
    */
-  cookie = be64toh (h->sbuf.simple_reply.handle);
+  cookie = be64toh (h->sbuf.reply.hdr.simple.handle);
   /* Find the command amongst the commands in flight. */
   for (cmd = h->cmds_in_flight, prev_cmd = NULL;
        cmd != NULL;
-- 
2.40.1

