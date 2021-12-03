Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A8002468072
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7ABA820154; Fri,  3 Dec 2021 23:32:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:41 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 35AAC2015F
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9IOhCtXOdZ0d for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 5021920153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XL3xf0GX+E6TSHDfhlS+aVqXH9zLrccK26EofTKa6aY=;
	b=US04h8dl9ZG84vg3H4s9MGLHJVVCZzmpDRL1hXSTYGMGiAVda0lNc5ooViR5//ebBYihBr
	T1uhiW31gctcQLCESe3EF5wxsi4/WtQGyi6dNr68ja0F69/F3RqDGWLC6Pwdk8eTpKZFX1
	papuB9FCXAokETH6vVcvtzzZnzqMoWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-0wQoYguXOw2bcK6K2EqpDg-1; Fri, 03 Dec 2021 18:16:26 -0500
X-MC-Unique: 0wQoYguXOw2bcK6K2EqpDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C5DC80402F;
	Fri,  3 Dec 2021 23:16:25 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A977C5D9D5;
	Fri,  3 Dec 2021 23:16:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com
Subject: [PATCH 09/14] nbd/server: Support 64-bit block status
Date: Fri,  3 Dec 2021 17:15:34 -0600
Message-Id: <20211203231539.3900865-10-eblake@redhat.com>
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
Resent-Message-ID: <RqLlv6SU29.A.5ID.ZkqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1630
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-10-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:41 +0000 (UTC)

The previous patch handled extended headers by truncating large block
status requests from the client back to 32 bits.  But this is not
ideal; for cases where we can truly determine the status of the entire
image quickly (for example, when reporting the entire image as
non-sparse because we lack the ability to probe for holes), this
causes more network traffic for the client to iterate through 4G
chunks than for us to just report the entire image at once.  For ease
of implementation, if extended headers were negotiated, then we always
reply with 64-bit block status replies, even when the result could
have fit in the older 32-bit block status chunk (clients supporting
extended headers have to be prepared for either chunk type, so
temporarily reverting this patch proves whether a client is
compliant).

Note that we previously had some interesting size-juggling on call
chains, such as:

nbd_co_send_block_status(uint32_t length)
-> blockstatus_to_extends(uint32_t bytes)
  -> bdrv_block_status_above(bytes, &uint64_t num)
  -> nbd_extent_array_add(uint64_t num)
    -> store num in 32-bit length

But we were lucky that it never overflowed: bdrv_block_status_above
never sets num larger than bytes, and we had previously been capping
'bytes' at 32 bits (either by the protocol, or in the previous patch
with an explicit truncation).  This patch adds some assertions that
ensure we continue to avoid overflowing 32 bits for a narrow client,
while fully utilizing 64-bits all the way through when the client
understands that.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 72 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 0e496f60ffbd..7e6140350797 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2106,20 +2106,26 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
 }

 typedef struct NBDExtentArray {
-    NBDExtent *extents;
+    union {
+        NBDExtent *narrow;
+        NBDExtentExt *extents;
+    };
     unsigned int nb_alloc;
     unsigned int count;
     uint64_t total_length;
+    bool extended; /* Whether 64-bit extents are allowed */
     bool can_add;
     bool converted_to_be;
 } NBDExtentArray;

-static NBDExtentArray *nbd_extent_array_new(unsigned int nb_alloc)
+static NBDExtentArray *nbd_extent_array_new(unsigned int nb_alloc,
+                                            bool extended)
 {
     NBDExtentArray *ea = g_new0(NBDExtentArray, 1);

     ea->nb_alloc = nb_alloc;
-    ea->extents = g_new(NBDExtent, nb_alloc);
+    ea->extents = g_new(NBDExtentExt, nb_alloc);
+    ea->extended = extended;
     ea->can_add = true;

     return ea;
@@ -2133,17 +2139,31 @@ static void nbd_extent_array_free(NBDExtentArray *ea)
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free);

 /* Further modifications of the array after conversion are abandoned */
-static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
+static void nbd_extent_array_convert_to_be(NBDExtentArray *ea,
+                                           struct iovec *iov)
 {
     int i;

     assert(!ea->converted_to_be);
+    assert(iov->iov_base == ea->extents);
     ea->can_add = false;
     ea->converted_to_be = true;

-    for (i = 0; i < ea->count; i++) {
-        ea->extents[i].flags = cpu_to_be32(ea->extents[i].flags);
-        ea->extents[i].length = cpu_to_be32(ea->extents[i].length);
+    if (ea->extended) {
+        for (i = 0; i < ea->count; i++) {
+            ea->extents[i].length = cpu_to_be64(ea->extents[i].length);
+            ea->extents[i].flags = cpu_to_be32(ea->extents[i].flags);
+            assert(ea->extents[i]._pad == 0);
+        }
+        iov->iov_len = ea->count * sizeof(ea->extents[0]);
+    } else {
+        /* Conversion reduces memory usage, order of iteration matters */
+        for (i = 0; i < ea->count; i++) {
+            assert(ea->extents[i].length <= UINT32_MAX);
+            ea->narrow[i].length = cpu_to_be32(ea->extents[i].length);
+            ea->narrow[i].flags = cpu_to_be32(ea->extents[i].flags);
+        }
+        iov->iov_len = ea->count * sizeof(ea->narrow[0]);
     }
 }

@@ -2157,19 +2177,23 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
  * would result in an incorrect range reported to the client)
  */
 static int nbd_extent_array_add(NBDExtentArray *ea,
-                                uint32_t length, uint32_t flags)
+                                uint64_t length, uint32_t flags)
 {
     assert(ea->can_add);

     if (!length) {
         return 0;
     }
+    if (!ea->extended) {
+        assert(length <= UINT32_MAX);
+    }

     /* Extend previous extent if flags are the same */
     if (ea->count > 0 && flags == ea->extents[ea->count - 1].flags) {
-        uint64_t sum = (uint64_t)length + ea->extents[ea->count - 1].length;
+        uint64_t sum = length + ea->extents[ea->count - 1].length;

-        if (sum <= UINT32_MAX) {
+        assert(sum >= length);
+        if (sum <= UINT32_MAX || ea->extended) {
             ea->extents[ea->count - 1].length = sum;
             ea->total_length += length;
             return 0;
@@ -2182,7 +2206,7 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
     }

     ea->total_length += length;
-    ea->extents[ea->count] = (NBDExtent) {.length = length, .flags = flags};
+    ea->extents[ea->count] = (NBDExtentExt) {.length = length, .flags = flags};
     ea->count++;

     return 0;
@@ -2253,15 +2277,16 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
     struct iovec iov[] = {
         {.iov_base = &hdr},
         {.iov_base = &chunk, .iov_len = sizeof(chunk)},
-        {.iov_base = ea->extents, .iov_len = ea->count * sizeof(ea->extents[0])}
+        {.iov_base = ea->extents}
     };

-    nbd_extent_array_convert_to_be(ea);
+    nbd_extent_array_convert_to_be(ea, &iov[2]);

     trace_nbd_co_send_extents(handle, ea->count, context_id, ea->total_length,
                               last);
     set_be_chunk(client, &iov[0], last ? NBD_REPLY_FLAG_DONE : 0,
-                 NBD_REPLY_TYPE_BLOCK_STATUS,
+                 client->extended_headers ? NBD_REPLY_TYPE_BLOCK_STATUS_EXT
+                 : NBD_REPLY_TYPE_BLOCK_STATUS,
                  handle, iov[1].iov_len + iov[2].iov_len);
     stl_be_p(&chunk.context_id, context_id);

@@ -2271,13 +2296,14 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
 /* Get block status from the exported device and send it to the client */
 static int nbd_co_send_block_status(NBDClient *client, uint64_t handle,
                                     BlockDriverState *bs, uint64_t offset,
-                                    uint32_t length, bool dont_fragment,
+                                    uint64_t length, bool dont_fragment,
                                     bool last, uint32_t context_id,
                                     Error **errp)
 {
     int ret;
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
-    g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
+    g_autoptr(NBDExtentArray) ea =
+        nbd_extent_array_new(nb_extents, client->extended_headers);

     if (context_id == NBD_META_ID_BASE_ALLOCATION) {
         ret = blockstatus_to_extents(bs, offset, length, ea);
@@ -2304,7 +2330,8 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     bdrv_dirty_bitmap_lock(bitmap);

     for (start = offset;
-         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end, INT32_MAX,
+         bdrv_dirty_bitmap_next_dirty_area(bitmap, start, end,
+                                           es->extended ? INT64_MAX : INT32_MAX,
                                            &dirty_start, &dirty_count);
          start = dirty_start + dirty_count)
     {
@@ -2326,11 +2353,12 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,

 static int nbd_co_send_bitmap(NBDClient *client, uint64_t handle,
                               BdrvDirtyBitmap *bitmap, uint64_t offset,
-                              uint32_t length, bool dont_fragment, bool last,
+                              uint64_t length, bool dont_fragment, bool last,
                               uint32_t context_id, Error **errp)
 {
     unsigned int nb_extents = dont_fragment ? 1 : NBD_MAX_BLOCK_STATUS_EXTENTS;
-    g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
+    g_autoptr(NBDExtentArray) ea =
+        nbd_extent_array_new(nb_extents, client->extended_headers);

     bitmap_to_extents(bitmap, offset, length, ea);

@@ -2607,11 +2635,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request->handle, -EINVAL,
                                           "need non-zero length", errp);
         }
-        if (request->len > UINT32_MAX) {
-            /* For now, truncate our response to a 32 bit window */
-            request->len = QEMU_ALIGN_DOWN(BDRV_REQUEST_MAX_BYTES,
-                                           client->check_align ?: 1);
-        }
+        assert(client->extended_headers || request->len <= UINT32_MAX);
         if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
             int contexts_remaining = client->export_meta.count;
-- 
2.33.1

