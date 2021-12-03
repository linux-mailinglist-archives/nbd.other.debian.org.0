Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC2468070
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 19CCB20154; Fri,  3 Dec 2021 23:32:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:34 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5CEA7200E5
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HLyca_hRsY3V for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D8DA120166
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXqedCwPvqpB0KfB2gP/avL3AK8S0eJ0pZYu/KEPRpY=;
	b=aXHcpyFmyfhm+uuM5AuuOc6dSPv4zsVwHqn1sWELToogMjenxdub8e9zeBaZPrACDFCq/C
	/5wgcVeZ9YFNC3Vdejt/aSvyEn3VitSlHhdLhNKC8Qow25lcWcZiPLdmx7IJG9nvkyTdlN
	raScINY/7VYZvvq5gd6cLuBQHDPPtwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-chM2I_uvPOeH1YPBOXAQYg-1; Fri, 03 Dec 2021 18:16:29 -0500
X-MC-Unique: chM2I_uvPOeH1YPBOXAQYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF8B102C888;
	Fri,  3 Dec 2021 23:16:28 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 351B95DF2B;
	Fri,  3 Dec 2021 23:16:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 11/14] nbd/client: Accept 64-bit hole chunks
Date: Fri,  3 Dec 2021 17:15:36 -0600
Message-Id: <20211203231539.3900865-12-eblake@redhat.com>
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
Resent-Message-ID: <ZXIN1ea5pWD.A.5HD.SkqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1629
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-12-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:34 +0000 (UTC)

Although our read requests are sized such that servers need not send
an extended hole chunk, we still have to be prepared for it to be
fully compliant if we request extended headers.  We can also tolerate
a non-compliant server sending the new chunk even when it should not.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c        | 26 ++++++++++++++++++++------
 block/trace-events |  1 +
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index da5e6ac2d9a5..c5dea864ebb6 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -518,20 +518,26 @@ static inline uint64_t payload_advance64(uint8_t **payload)

 static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
                                          NBDStructuredReplyChunk *chunk,
-                                         uint8_t *payload, uint64_t orig_offset,
+                                         uint8_t *payload, bool wide,
+                                         uint64_t orig_offset,
                                          QEMUIOVector *qiov, Error **errp)
 {
     uint64_t offset;
-    uint32_t hole_size;
+    uint64_t hole_size;
+    size_t len = wide ? sizeof(hole_size) : sizeof(uint32_t);

-    if (chunk->length != sizeof(offset) + sizeof(hole_size)) {
+    if (chunk->length != sizeof(offset) + len) {
         error_setg(errp, "Protocol error: invalid payload for "
                          "NBD_REPLY_TYPE_OFFSET_HOLE");
         return -EINVAL;
     }

     offset = payload_advance64(&payload);
-    hole_size = payload_advance32(&payload);
+    if (wide) {
+        hole_size = payload_advance64(&payload);
+    } else {
+        hole_size = payload_advance32(&payload);
+    }

     if (!hole_size || offset < orig_offset || hole_size > qiov->size ||
         offset > orig_offset + qiov->size - hole_size) {
@@ -544,6 +550,7 @@ static int nbd_parse_offset_hole_payload(BDRVNBDState *s,
         trace_nbd_structured_read_compliance("hole");
     }

+    assert(hole_size <= SIZE_MAX);
     qemu_iovec_memset(qiov, offset - orig_offset, 0, hole_size);

     return 0;
@@ -1037,9 +1044,16 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
              * in qiov
              */
             break;
+        case NBD_REPLY_TYPE_OFFSET_HOLE_EXT:
+            if (!s->info.extended_headers) {
+                trace_nbd_extended_headers_compliance("hole_ext");
+            }
+            /* fallthrough */
         case NBD_REPLY_TYPE_OFFSET_HOLE:
-            ret = nbd_parse_offset_hole_payload(s, &reply.structured, payload,
-                                                offset, qiov, &local_err);
+            ret = nbd_parse_offset_hole_payload(
+                s, &reply.structured, payload,
+                chunk->type == NBD_REPLY_TYPE_OFFSET_HOLE_EXT,
+                offset, qiov, &local_err);
             if (ret < 0) {
                 nbd_channel_error(s, ret);
                 nbd_iter_channel_error(&iter, ret, &local_err);
diff --git a/block/trace-events b/block/trace-events
index 549090d453e7..ee65da204dde 100644
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
2.33.1

