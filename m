Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4076646806E
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 297552016C; Fri,  3 Dec 2021 23:32:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:26 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1E1902016F
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.827 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7IzAfP63245P for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D841520154
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ9jZN2mFIPKC1TvOx/EIHpjsFOSdT4uXj0cLOay0Io=;
	b=N60pLguvk7Lt8L0pR9MfKr7Jgqex2RB7FVvFajPOLIzvC1lLJw0wqPj4hxxeWYAgdpw6o1
	GRaq6K4lxBiGZcCeq9kzvLe+PBnbuftK9gKIms3ZV9MI2KkAoh72bpukZLrLzHGYgKbU/X
	J26dqU5Q3w9sOYM7AzzWV/cSzxAe7d4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-syNAAt3rPAistbgMmqGFWw-1; Fri, 03 Dec 2021 18:16:34 -0500
X-MC-Unique: syNAAt3rPAistbgMmqGFWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643D494EE0;
	Fri,  3 Dec 2021 23:16:33 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD6F5D9D5;
	Fri,  3 Dec 2021 23:16:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 12/14] nbd/client: Accept 64-bit block status chunks
Date: Fri,  3 Dec 2021 17:15:37 -0600
Message-Id: <20211203231539.3900865-13-eblake@redhat.com>
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
Resent-Message-ID: <jyBmWeRchNE.A.JFD.KkqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1627
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-13-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:26 +0000 (UTC)

Because we use NBD_CMD_FLAG_REQ_ONE with NBD_CMD_BLOCK_STATUS, a
client in narrow mode should not be able to provoke a server into
sending a block status result larger than the client's 32-bit request.
But in extended mode, a 64-bit status request must be able to handle a
64-bit status result, once a future patch enables the client
requesting extended mode.  We can also tolerate a non-compliant server
sending the new chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c5dea864ebb6..bd4a9c407bde 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -563,13 +563,15 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
  */
 static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
                                          NBDStructuredReplyChunk *chunk,
-                                         uint8_t *payload, uint64_t orig_length,
-                                         NBDExtent *extent, Error **errp)
+                                         uint8_t *payload, bool wide,
+                                         uint64_t orig_length,
+                                         NBDExtentExt *extent, Error **errp)
 {
     uint32_t context_id;
+    size_t len = wide ? sizeof(*extent) : sizeof(NBDExtent);

     /* The server succeeded, so it must have sent [at least] one extent */
-    if (chunk->length < sizeof(context_id) + sizeof(*extent)) {
+    if (chunk->length < sizeof(context_id) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_BLOCK_STATUS");
         return -EINVAL;
@@ -584,8 +586,16 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
         return -EINVAL;
     }

-    extent->length = payload_advance32(&payload);
-    extent->flags = payload_advance32(&payload);
+    if (wide) {
+        extent->length = payload_advance64(&payload);
+        extent->flags = payload_advance32(&payload);
+        if (payload_advance32(&payload) != 0) {
+            trace_nbd_parse_blockstatus_compliance("non-zero extent padding");
+        }
+    } else {
+        extent->length = payload_advance32(&payload);
+        extent->flags = payload_advance32(&payload);
+    }

     if (extent->length == 0) {
         error_setg(errp, "Protocol error: server sent status chunk with "
@@ -625,7 +635,7 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
      * connection; just ignore trailing extents, and clamp things to
      * the length of our request.
      */
-    if (chunk->length > sizeof(context_id) + sizeof(*extent)) {
+    if (chunk->length > sizeof(context_id) + len) {
         trace_nbd_parse_blockstatus_compliance("more than one extent");
     }
     if (extent->length > orig_length) {
@@ -1081,7 +1091,7 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,

 static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
                                             uint64_t handle, uint64_t length,
-                                            NBDExtent *extent,
+                                            NBDExtentExt *extent,
                                             int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
@@ -1098,6 +1108,11 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
         assert(nbd_reply_is_structured(&reply));

         switch (chunk->type) {
+        case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
+            if (!s->info.extended_headers) {
+                trace_nbd_extended_headers_compliance("block_status_ext");
+            }
+            /* fallthrough */
         case NBD_REPLY_TYPE_BLOCK_STATUS:
             if (received) {
                 nbd_channel_error(s, -EINVAL);
@@ -1106,9 +1121,10 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
             }
             received = true;

-            ret = nbd_parse_blockstatus_payload(s, &reply.structured,
-                                                payload, length, extent,
-                                                &local_err);
+            ret = nbd_parse_blockstatus_payload(
+                s, &reply.structured, payload,
+                chunk->type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT,
+                length, extent, &local_err);
             if (ret < 0) {
                 nbd_channel_error(s, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
@@ -1337,7 +1353,7 @@ static int coroutine_fn nbd_client_co_block_status(
         int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
     int ret, request_ret;
-    NBDExtent extent = { 0 };
+    NBDExtentExt extent = { 0 };
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;

-- 
2.33.1

