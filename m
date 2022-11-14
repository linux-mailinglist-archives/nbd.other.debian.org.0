Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D52628D22
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A580B20615; Mon, 14 Nov 2022 23:05:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:51 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 6DDCF2066B
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:05:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UEWktD-f099a for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:05:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BB12820616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNpwGX13xWfOmVQIRvlGoXlq2hyxspUY7BXP43GdQ8I=;
	b=MpEaMfii414/6iqERu4fesZoPGJYBuk9ZMIHyscaUtwlCwuNd3MrgOHb9ZANBmcQU+x5PN
	ao33t6vvzBQwFerPw9AosGut7DB/J6nBIyHVyok9dA9vVLdBItmS/XVzAqKkIhpErpMn3w
	dEuiuMH9ssfk+tnfZMk25CNMfcAVm/8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-TFGQOHzJMxOLsHPn4RMPlw-1; Mon, 14 Nov 2022 17:49:02 -0500
X-MC-Unique: TFGQOHzJMxOLsHPn4RMPlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 321EE38164C1;
	Mon, 14 Nov 2022 22:49:02 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E85140E42E3;
	Mon, 14 Nov 2022 22:49:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 10/15] nbd/client: Accept 64-bit block status chunks
Date: Mon, 14 Nov 2022 16:48:43 -0600
Message-Id: <20221114224848.2186298-11-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n7Nodk7dXbD.A.WLE.PnscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2293
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-11-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:51 +0000 (UTC)

Because we use NBD_CMD_FLAG_REQ_ONE with NBD_CMD_BLOCK_STATUS, a
client in narrow mode should not be able to provoke a server into
sending a block status result larger than the client's 32-bit request.
But in extended mode, a 64-bit status request must be able to handle a
64-bit status result, once a future patch enables the client
requesting extended mode.  We can also tolerate a non-compliant server
sending the new chunk even when it should not.

In normal execution, we are only requesting "base:allocation" which
never exceeds 32 bits. But during testing with x-dirty-bitmap, we can
force qemu to connect to some other context that might have 64-bit
status bit; however, we ignore those upper bits (other than mapping
qemu:allocation-depth into something that 'qemu-img map --output=json'
can expose), and since it is only testing, we really don't bother with
checking whether more than the two least-significant bits are set.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c        | 38 +++++++++++++++++++++++++++-----------
 block/trace-events |  1 +
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a8b1bc1054..44ab5437ea 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -608,13 +608,16 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
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
+    uint32_t count = 0;
+    size_t len = wide ? sizeof(*extent) : sizeof(NBDExtent);

     /* The server succeeded, so it must have sent [at least] one extent */
-    if (chunk->length < sizeof(context_id) + sizeof(*extent)) {
+    if (chunk->length < sizeof(context_id) + wide * sizeof(count) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_BLOCK_STATUS");
         return -EINVAL;
@@ -629,8 +632,14 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
         return -EINVAL;
     }

-    extent->length = payload_advance32(&payload);
-    extent->flags = payload_advance32(&payload);
+    if (wide) {
+        count = payload_advance32(&payload);
+        extent->length = payload_advance64(&payload);
+        extent->flags = payload_advance64(&payload);
+    } else {
+        extent->length = payload_advance32(&payload);
+        extent->flags = payload_advance32(&payload);
+    }

     if (extent->length == 0) {
         error_setg(errp, "Protocol error: server sent status chunk with "
@@ -670,7 +679,8 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
      * connection; just ignore trailing extents, and clamp things to
      * the length of our request.
      */
-    if (chunk->length > sizeof(context_id) + sizeof(*extent)) {
+    if (count > 1 ||
+        chunk->length > sizeof(context_id) + wide * sizeof(count) + len) {
         trace_nbd_parse_blockstatus_compliance("more than one extent");
     }
     if (extent->length > orig_length) {
@@ -1114,7 +1124,7 @@ static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t h

 static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
                                                          uint64_t handle, uint64_t length,
-                                                         NBDExtent *extent,
+                                                         NBDExtentExt *extent,
                                                          int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
@@ -1131,6 +1141,11 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
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
@@ -1139,9 +1154,10 @@ static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
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
@@ -1369,7 +1385,7 @@ static int coroutine_fn nbd_client_co_block_status(
         int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
     int ret, request_ret;
-    NBDExtent extent = { 0 };
+    NBDExtentExt extent = { 0 };
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;

diff --git a/block/trace-events b/block/trace-events
index 48dbf10c66..b84a5155a3 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -168,6 +168,7 @@ iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t dst_off, ui
 # nbd.c
 nbd_parse_blockstatus_compliance(const char *err) "ignoring extra data from non-compliant server: %s"
 nbd_structured_read_compliance(const char *type) "server sent non-compliant unaligned read %s chunk"
+nbd_extended_headers_compliance(const char *type) "server sent non-compliant %s chunk without extended headers"
 nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
 nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
 nbd_client_handshake(const char *export_name) "export '%s'"
-- 
2.38.1

