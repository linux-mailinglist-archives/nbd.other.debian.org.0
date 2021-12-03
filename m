Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 946F446808A
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:34:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7BBCD20166; Fri,  3 Dec 2021 23:34:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:34:26 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 36D7A2016C
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:34:17 +0000 (UTC)
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
	with ESMTP id ZYHkZF0Djg6t for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:34:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 7927A20153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLV12rQlPT4V/6VRD0TZQiSGadb3bwCF2gDh8grwgFQ=;
	b=RQM+35dcYV/+Ljj2wJ5iQj04o50yM7D8Vyeq2CCpxk2Kq7nlYrpOpQKMuou7xijP08ypqO
	bhXX8P5vCIENEnys7biFQ92Rge8Pc+UdMMP3Cq7v/GpCQRXoPNaiI0g2RKgl9BOdm6v9vw
	nTA+53/P9cJzWED5E43W7WEwHAH8a9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-PEQk-d6FMgmnaKAAabSLrg-1; Fri, 03 Dec 2021 18:18:03 -0500
X-MC-Unique: PEQk-d6FMgmnaKAAabSLrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5E42F38;
	Fri,  3 Dec 2021 23:18:01 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67CBC5DF2B;
	Fri,  3 Dec 2021 23:18:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 08/13] block_status: Track 64-bit extents internally
Date: Fri,  3 Dec 2021 17:17:36 -0600
Message-Id: <20211203231741.3901263-9-eblake@redhat.com>
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
Resent-Message-ID: <FtykaGKKTMK.A.AmD.CmqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1640
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-9-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:34:26 +0000 (UTC)

When extended headers are in use, the server can send us 64-bit
extents, even for a 32-bit query (if the server knows the entire image
is data, for example).  For maximum flexibility, we are thus better
off storing 64-bit lengths internally, even if we have to convert it
back to 32-bit lengths when invoking the user's 32-bit callback.  The
next patch will then add a new API for letting the user access the
full 64-bit extent information.  The goal is to let both APIs work all
the time, regardless of the size extents that the server actually
answered with.

Note that when using the old nbd_block_status() API with a server that
lacks extended headers, we now add a double-conversion speed penalty
(converting the server's 32-bit answer into 64-bit internally and back
to 32-bit for the callback).  But the speed penalty will not be a
problem for applications using the new nbd_block_status_64() API (we
have to give a 64-bit answer no matter what the server answered), and
ideally the situation will become less common as more servers learn
extended headers.  So for now I chose to unconditionally use a 64-bit
internal representation; but if it turns out to have noticeable
degredation, we could tweak things to conditionally retain 32-bit
internal representation for servers lacking extended headers at the
expense of more code maintenance.

One of the trickier aspects of this patch is auditing that both the
user's extent and our malloc'd shim get cleaned up once on all
possible paths, so that there is neither a leak nor a double free.
---
 lib/internal.h                      |  7 +++-
 generator/states-reply-structured.c | 31 ++++++++++-----
 lib/handle.c                        |  4 +-
 lib/rw.c                            | 59 ++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 16 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 06f3a65c..4800df83 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -75,7 +75,7 @@ struct export {

 struct command_cb {
   union {
-    nbd_extent_callback extent;
+    nbd_extent64_callback extent;
     nbd_chunk_callback chunk;
     nbd_list_callback list;
     nbd_context_callback context;
@@ -286,7 +286,10 @@ struct nbd_handle {

   /* When receiving block status, this is used. */
   uint32_t bs_contextid;
-  uint32_t *bs_entries;
+  union {
+    nbd_extent *normal; /* Our 64-bit preferred internal form */
+    uint32_t *narrow;   /* 32-bit form of NBD_REPLY_TYPE_BLOCK_STATUS */
+  } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
    * packet is sent to the server].  This is used as a simple linked
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index a3e0e2ac..71c761e9 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -494,6 +494,7 @@ STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.RECV_BS_CONTEXTID:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
+  uint32_t count;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -508,15 +509,19 @@ STATE_MACHINE {
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (length >= 12);
     length -= sizeof h->bs_contextid;
+    count = length / (2 * sizeof (uint32_t));

-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
+    /* Read raw data into a subset of h->bs_entries, then expand it
+     * into place later later during byte-swapping.
+     */
+    free (h->bs_entries.normal);
+    h->bs_entries.normal = malloc (count * sizeof *h->bs_entries.normal);
+    if (h->bs_entries.normal == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries;
+    h->rbuf = h->bs_entries.narrow;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -528,6 +533,7 @@ STATE_MACHINE {
   uint32_t count;
   size_t i;
   uint32_t context_id;
+  uint32_t *raw;
   struct meta_context *meta_context;

   switch (recv_into_rbuf (h)) {
@@ -542,15 +548,20 @@ STATE_MACHINE {
     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    assert (h->bs_entries);
+    assert (h->bs_entries.normal);
     assert (length >= 12);
-    count = (length - sizeof h->bs_contextid) / sizeof *h->bs_entries;
+    count = (length - sizeof h->bs_contextid) / (2 * sizeof (uint32_t));

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.
+     * don't validate them.  Reverse order is essential, since we are
+     * expanding in-place from narrow to wider type.
      */
-    for (i = 0; i < count; ++i)
-      h->bs_entries[i] = be32toh (h->bs_entries[i]);
+    raw = h->bs_entries.narrow;
+    for (i = count; i > 0; ) {
+      --i;
+      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    }

     /* Look up the context ID. */
     context_id = be32toh (h->bs_contextid);
@@ -566,7 +577,7 @@ STATE_MACHINE {

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          meta_context->name, cmd->offset,
-                         h->bs_entries, count,
+                         h->bs_entries.normal, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
diff --git a/lib/handle.c b/lib/handle.c
index cbb37e89..74fe87ec 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -123,7 +123,7 @@ nbd_close (struct nbd_handle *h)
   /* Free user callbacks first. */
   nbd_unlocked_clear_debug_callback (h);

-  free (h->bs_entries);
+  free (h->bs_entries.normal);
   nbd_internal_reset_size_and_flags (h);
   nbd_internal_free_option (h);
   free_cmd_list (h->cmds_to_issue);
diff --git a/lib/rw.c b/lib/rw.c
index 16c2e848..f36f4e15 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -42,6 +42,50 @@ wait_for_command (struct nbd_handle *h, int64_t cookie)
   return r == -1 ? -1 : 0;
 }

+/* Convert from 64-bit to 32-bit extent callback. */
+static int
+nbd_convert_extent (void *data, const char *metacontext, uint64_t offset,
+                    nbd_extent *entries, size_t nr_entries, int *error)
+{
+  nbd_extent_callback *cb = data;
+  uint32_t *array = malloc (nr_entries * 2 * sizeof *array);
+  size_t i;
+  int ret;
+
+  if (array == NULL) {
+    set_error (*error = errno, "malloc");
+    return -1;
+  }
+
+  for (i = 0; i < nr_entries; i++) {
+    array[i * 2] = entries[i].length;
+    array[i * 2 + 1] = entries[i].flags;
+    /* If an extent is larger than 32 bits, silently truncate the rest
+     * of the server's response.  Technically, such a server was
+     * non-compliant if the client did not negotiate extended headers,
+     * but it is easier to let the caller make progress than to make
+     * the call fail.  Rather than track the connection's alignment,
+     * just blindly truncate the large extent to 4G-64M.
+     */
+    if (entries[i].length > UINT32_MAX) {
+      array[i++ * 2] = -MAX_REQUEST_SIZE;
+      break;
+    }
+  }
+
+  ret = CALL_CALLBACK (*cb, metacontext, offset, array, i * 2, error);
+  free (array);
+  return ret;
+}
+
+static void
+nbd_convert_extent_free (void *data)
+{
+  nbd_extent_callback *cb = data;
+  FREE_CALLBACK (*cb);
+  free (cb);
+}
+
 /* Issue a read command and wait for the reply. */
 int
 nbd_unlocked_pread (struct nbd_handle *h, void *buf,
@@ -469,12 +513,23 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
                                nbd_completion_callback *completion,
                                uint32_t flags)
 {
-  struct command_cb cb = { .fn.extent = *extent,
+  nbd_extent_callback *shim = malloc (sizeof *shim);
+  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
+                           .fn.extent.user_data = shim,
+                           .fn.extent.free = nbd_convert_extent_free,
                            .completion = *completion };

+  if (shim == NULL) {
+    set_error (errno, "malloc");
+    return -1;
+  }
+  *shim = *extent;
+  SET_CALLBACK_TO_NULL (*extent);
+
   if (h->strict & LIBNBD_STRICT_COMMANDS) {
     if (!h->structured_replies) {
       set_error (ENOTSUP, "server does not support structured replies");
+      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }

@@ -482,11 +537,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
       set_error (ENOTSUP, "did not negotiate any metadata contexts, "
                  "either you did not call nbd_add_meta_context before "
                  "connecting or the server does not support it");
+      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }
   }

-  SET_CALLBACK_TO_NULL (*extent);
   SET_CALLBACK_TO_NULL (*completion);
   return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
                                       count, EINVAL, NULL, &cb);
-- 
2.33.1

