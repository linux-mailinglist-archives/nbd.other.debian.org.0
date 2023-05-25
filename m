Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE4710CFD
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:07:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D596C2050B; Thu, 25 May 2023 13:07:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:07:52 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 3824120504
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:07:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Zb9aT55eRWzy for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:07:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8E1B4204FA
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685020051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KW/8kWtZtjSGhmJyptcdUhp9EctXXMTrwKc301xJrSo=;
	b=imh5yGtwiFZexcxjXG/q/D9lwNRLDyItXHCsg3HVyiHh7cR6a7HCdtgJvNNKgZiBfdhDhX
	PQ6EirlGAkuIZrdI1cjYL8zgj50lSel+Z0tjNduL8BEcH0Uu1LM61ThRky6ZOW5MrwxOSg
	r/RwZRA6kpyVDJDaP+xAWSZz76lAZJo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-pmA1wxvdPTKTyAoER4zfiw-1; Thu, 25 May 2023 09:01:14 -0400
X-MC-Unique: pmA1wxvdPTKTyAoER4zfiw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59831C01725;
	Thu, 25 May 2023 13:01:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 934DD492B0A;
	Thu, 25 May 2023 13:01:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 08/22] block_status: Track 64-bit extents internally
Date: Thu, 25 May 2023 08:00:54 -0500
Message-Id: <20230525130108.757242-9-eblake@redhat.com>
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
Resent-Message-ID: <8_Up6MWqqRP.A.jkF.o21bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2497
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-9-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:07:52 +0000 (UTC)

When extended headers are in use, the server is required to use a
response that can include 64-bit extent lengths and flags (even if it
chooses to keep the extent length under 4G, and even for metacontexts
like "base:allocation" where the flags never need more than 32 bits).
For maximum flexibility, we are better off storing 64-bit data
internally, with a goal of letting the client's 32-bit interface work
as much as possible, and for a future API addition of a 64-bit
interface to work even with older servers that only give 32-bit
results.

For backwards compatibility, a client that never negotiates a 64-bit
status context can be handled without errors by truncating any 64-bit
lengths down to just under 4G; so the old 32-bit interface will
continue to work in most cases.  A server should not advertise a
metacontext that requires flags larger than 32 bits unless the client
negotiated extended headers; but if such a client still tries to use
the 32-bit interface, the code now reports EOVERFLOW for a server
response with a flags value that cannot be represented without using
the future API for 64-bit extent queries.

Note that the existing 32-bit nbd_block_status() API is now slightly
slower, particularly when talking with a server that lacks extended
headers: we are doing two size conversions (32 to 64 internally, 64
back to 32 to the user).  But this speed penalty is likely in the
noise compared to the network delays, and ideally clients will switch
over to the new 64-bit interfaces as more and more servers start
supporting extended headers.

One of the trickier aspects of this patch is auditing that both the
user's extent and our malloc'd shim get cleaned up once on all
possible paths, so that there is neither a leak nor a double free.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 lib/internal.h                      |  8 +++-
 generator/states-reply-structured.c | 30 ++++++++-----
 lib/handle.c                        |  2 +-
 lib/rw.c                            | 70 ++++++++++++++++++++++++++++-
 4 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index e4e21a4d..11186e24 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -80,7 +80,7 @@ struct export {

 struct command_cb {
   union {
-    nbd_extent_callback extent;
+    nbd_extent64_callback extent;
     nbd_chunk_callback chunk;
     nbd_list_callback list;
     nbd_context_callback context;
@@ -303,7 +303,11 @@ struct nbd_handle {
   size_t querynum;

   /* When receiving block status, this is used. */
-  uint32_t *bs_entries;
+  union {
+    char *storage;      /* malloc's view */
+    nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
+    uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
+  } bs_entries;

   /* Commands which are waiting to be issued [meaning the request
    * packet is sent to the server].  This is used as a simple linked
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index c53aed7b..784adb78 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -436,6 +436,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
   struct command *cmd = h->reply_cmd;
   uint32_t length;
+  uint32_t count;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -450,15 +451,19 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (length >= 12);
     length -= sizeof h->sbuf.reply.payload.bs_hdr;
+    count = length / (2 * sizeof (uint32_t));

-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
+    /* Read raw data into a subset of h->bs_entries, then expand it
+     * into place later during byte-swapping.
+     */
+    free (h->bs_entries.storage);
+    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
+    if (h->bs_entries.storage == NULL) {
       SET_NEXT_STATE (%.DEAD);
       set_error (errno, "malloc");
       return 0;
     }
-    h->rbuf = h->bs_entries;
+    h->rbuf = h->bs_entries.narrow;
     h->rlen = length;
     SET_NEXT_STATE (%RECV_BS_ENTRIES);
   }
@@ -470,6 +475,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
   uint32_t count;
   size_t i;
   uint32_t context_id;
+  uint32_t *raw;

   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
@@ -483,17 +489,21 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
-    assert (h->bs_entries);
+    assert (h->bs_entries.normal);
     assert (length >= 12);
     assert (h->meta_valid);
     count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
-      sizeof *h->bs_entries;
+      (2 * sizeof (uint32_t));

     /* Need to byte-swap the entries returned, but apart from that we
-     * don't validate them.
+     * don't validate them.  Reverse order is essential, since we are
+     * expanding in-place from narrow to wider type.
      */
-    for (i = 0; i < count; ++i)
-      h->bs_entries[i] = be32toh (h->bs_entries[i]);
+    raw = h->bs_entries.narrow;
+    for (i = count; i-- > 0; ) {
+      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
+      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
+    }

     /* Look up the context ID. */
     context_id = be32toh (h->sbuf.reply.payload.bs_hdr.context_id);
@@ -507,7 +517,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          h->meta_contexts.ptr[i].name, cmd->offset,
-                         h->bs_entries, count,
+                         h->bs_entries.normal, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
diff --git a/lib/handle.c b/lib/handle.c
index 0f11bee5..fba6d1c4 100644
--- a/lib/handle.c
+++ b/lib/handle.c
@@ -130,7 +130,7 @@ nbd_close (struct nbd_handle *h)
   nbd_unlocked_clear_debug_callback (h);

   string_vector_empty (&h->querylist);
-  free (h->bs_entries);
+  free (h->bs_entries.storage);
   nbd_internal_reset_size_and_flags (h);
   for (i = 0; i < h->meta_contexts.len; ++i)
     free (h->meta_contexts.ptr[i].name);
diff --git a/lib/rw.c b/lib/rw.c
index 8b2bd4cc..58b05a4b 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -42,6 +42,61 @@ wait_for_command (struct nbd_handle *h, int64_t cookie)
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
+  bool fail = false;
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
+     * of the server's response; the client can then make progress
+     * instead of needing to see failure.  Rather than track the
+     * connection's alignment, just clamp the large extent to 4G-64M.
+     * However, if flags doesn't fit in 32 bits, it's better to inform
+     * the caller of an EOVERFLOW failure.
+     *
+     * Technically, a server with 64-bit answers is non-compliant if
+     * the client did not negotiate extended headers - contexts that
+     * include 64-bit flags should not have been negotiated in that
+     * case.
+     */
+    if (entries[i].length > UINT32_MAX) {
+      array[i++ * 2] = -MAX_REQUEST_SIZE;
+      break;
+    }
+    if (entries[i].flags > UINT32_MAX) {
+      *error = EOVERFLOW;
+      fail = true;
+      break;
+    }
+  }
+
+  ret = CALL_CALLBACK (*cb, metacontext, offset, array, i * 2, error);
+  free (array);
+  return fail ? -1 : ret;
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
@@ -487,12 +542,23 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
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

@@ -500,11 +566,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
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
2.40.1

