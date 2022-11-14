Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6713D628D15
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:04:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4C1E92067F; Mon, 14 Nov 2022 23:04:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:04:53 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 908E72067C
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ew29B2ZX48BM for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B6A0520534
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NrkZVHAocJOLpKWjaSIw4pPOaz/H1tbWxK3Giv3VKM=;
	b=TPw4Q+v3gQ/ItcWh/A8m7MHPqbhN4xTmRBSLLMsQEiVfHEXGW0cwXVWdk57acuRq7IQFXN
	Gm6laX6y5ReQCGRlSyEHoPOdd3Z5gPGb/WIR50WxA/x7SV/aOQjAFPMl3X4Iy4JpSVSYJn
	xZ3gAzPQBrl+qrngORIYOGv/Avry8Gc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-ngUCwPe3OpGx83CvUIPf1w-1; Mon, 14 Nov 2022 17:48:58 -0500
X-MC-Unique: ngUCwPe3OpGx83CvUIPf1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FB3B101AA45;
	Mon, 14 Nov 2022 22:48:58 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0940D40AE7EF;
	Mon, 14 Nov 2022 22:48:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 05/15] nbd/server: Refactor handling of request payload
Date: Mon, 14 Nov 2022 16:48:38 -0600
Message-Id: <20221114224848.2186298-6-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EsBjESxQpoL.A.uyD.VmscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2284
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-6-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:04:53 +0000 (UTC)

Upcoming additions to support NBD 64-bit effect lengths allow for the
possibility to distinguish between payload length (capped at 32M) and
effect length (up to 63 bits).  Without that extension, only the
NBD_CMD_WRITE request has a payload; but with the extension, it makes
sense to allow at least NBD_CMD_BLOCK_STATUS to have both a payload
and effect length (where the payload is a limited-size struct that in
turns gives the real effect length as well as a subset of known ids
for which status is requested).  Other future NBD commands may also
have a request payload, so the 64-bit extension introduces a new
NBD_CMD_FLAG_PAYLOAD_LEN that distinguishes between whether the header
length is a payload length or an effect length, rather than
hard-coding the decision based on the command.  Note that we do not
support the payload version of BLOCK_STATUS yet.

For this patch, no semantic change is intended for a compliant client.
For a non-compliant client, it is possible that the error behavior
changes (a different message, a change on whether the connection is
killed or remains alive for the next command, or so forth), but all
errors should still be handled gracefully.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c     | 53 ++++++++++++++++++++++++++++++++----------------
 nbd/trace-events |  1 +
 2 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 7738f5f899..ad5c2052b5 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2316,6 +2316,8 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
                                   Error **errp)
 {
     NBDClient *client = req->client;
+    bool extended_with_payload;
+    int payload_len = 0;
     int valid_flags;
     int ret;

@@ -2329,27 +2331,40 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
                                              nbd_cmd_lookup(request->type));

-    if (request->type != NBD_CMD_WRITE) {
-        /* No payload, we are ready to read the next request.  */
-        req->complete = true;
-    }
-
     if (request->type == NBD_CMD_DISC) {
         /* Special case: we're going to disconnect without a reply,
          * whether or not flags, from, or len are bogus */
+        req->complete = true;
         return -EIO;
     }

+    /* Payload and buffer handling. */
+    extended_with_payload = client->extended_headers &&
+        (request->flags & NBD_CMD_FLAG_PAYLOAD_LEN);
     if (request->type == NBD_CMD_READ || request->type == NBD_CMD_WRITE ||
-        request->type == NBD_CMD_CACHE)
-    {
+        request->type == NBD_CMD_CACHE || extended_with_payload) {
         if (request->len > NBD_MAX_BUFFER_SIZE) {
             error_setg(errp, "len (%" PRIu64" ) is larger than max len (%u)",
                        request->len, NBD_MAX_BUFFER_SIZE);
             return -EINVAL;
         }

-        if (request->type != NBD_CMD_CACHE) {
+        if (request->type == NBD_CMD_WRITE || extended_with_payload) {
+            payload_len = request->len;
+            if (request->type != NBD_CMD_WRITE) {
+                /*
+                 * For now, we don't support payloads on other
+                 * commands; but we can keep the connection alive.
+                 */
+                request->len = 0;
+            } else if (client->extended_headers && !extended_with_payload) {
+                /* The client is noncompliant. Trace it, but proceed. */
+                trace_nbd_co_receive_ext_payload_compliance(request->from,
+                                                            request->len);
+            }
+        }
+
+        if (request->type == NBD_CMD_WRITE || request->type == NBD_CMD_READ) {
             req->data = blk_try_blockalign(client->exp->common.blk,
                                            request->len);
             if (req->data == NULL) {
@@ -2359,18 +2374,20 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
         }
     }

-    if (request->type == NBD_CMD_WRITE) {
-        assert(request->len <= NBD_MAX_BUFFER_SIZE);
-        if (nbd_read(client->ioc, req->data, request->len, "CMD_WRITE data",
-                     errp) < 0)
-        {
+    if (payload_len) {
+        if (req->data) {
+            ret = nbd_read(client->ioc, req->data, payload_len,
+                           "CMD_WRITE data", errp);
+        } else {
+            ret = nbd_drop(client->ioc, payload_len, errp);
+        }
+        if (ret < 0) {
             return -EIO;
         }
-        req->complete = true;
-
         trace_nbd_co_receive_request_payload_received(request->handle,
-                                                      request->len);
+                                                      payload_len);
     }
+    req->complete = true;

     /* Sanity checks. */
     if (client->exp->nbdflags & NBD_FLAG_READ_ONLY &&
@@ -2400,7 +2417,9 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
                                               client->check_align);
     }
     valid_flags = NBD_CMD_FLAG_FUA;
-    if (request->type == NBD_CMD_READ && client->structured_reply) {
+    if (request->type == NBD_CMD_WRITE && client->extended_headers) {
+        valid_flags |= NBD_CMD_FLAG_PAYLOAD_LEN;
+    } else if (request->type == NBD_CMD_READ && client->structured_reply) {
         valid_flags |= NBD_CMD_FLAG_DF;
     } else if (request->type == NBD_CMD_WRITE_ZEROES) {
         valid_flags |= NBD_CMD_FLAG_NO_HOLE | NBD_CMD_FLAG_FAST_ZERO;
diff --git a/nbd/trace-events b/nbd/trace-events
index e2c1d68688..adf5666e20 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -71,6 +71,7 @@ nbd_co_send_extents(uint64_t handle, unsigned int extents, uint32_t id, uint64_t
 nbd_co_send_structured_error(uint64_t handle, int err, const char *errname, const char *msg) "Send structured error reply: handle = %" PRIu64 ", error = %d (%s), msg = '%s'"
 nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *name) "Decoding type: handle = %" PRIu64 ", type = %" PRIu16 " (%s)"
 nbd_co_receive_request_payload_received(uint64_t handle, uint64_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu64
+nbd_co_receive_ext_payload_compliance(uint64_t from, uint64_t len) "client sent non-compliant write without payload flag: from=0x%" PRIx64 ", len=0x%" PRIx64
 nbd_co_receive_align_compliance(const char *op, uint64_t from, uint64_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx64 ", align=0x%" PRIx32
 nbd_trip(void) "Reading request"

-- 
2.38.1

