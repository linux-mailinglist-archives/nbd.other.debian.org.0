Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A82468074
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:33:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E3FCB2016F; Fri,  3 Dec 2021 23:33:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:33:33 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 9C43D2015F
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:33:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iZOzBvby7J0A for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:33:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B4302200E5
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u6Ss8C/z+8OhC9UA+VztzBTG49YIh39ZEWpj+Occ1Io=;
	b=PWvWIVH/efKeOTXKaPBf+9mqbBPC8t6BQXi/zIhGF5wiq5K9GB9cFjTAHlBs9eQXDVBKLB
	J9gKhJ3+F3DkAUDFaa4DK39paj+7P+sYfhYNAN3OYWLmUt/oPTn5XVJtHeL6zs2T+5yMON
	N6mvocK/v+wQ8ItstuQnbAFksc256YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-Uj-sTSyRPUORH2-YXorxKA-1; Fri, 03 Dec 2021 18:17:55 -0500
X-MC-Unique: Uj-sTSyRPUORH2-YXorxKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CCED8042E2;
	Fri,  3 Dec 2021 23:17:54 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 989725DF2B;
	Fri,  3 Dec 2021 23:17:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 02/13] block_status: Refactor array storage
Date: Fri,  3 Dec 2021 17:17:30 -0600
Message-Id: <20211203231741.3901263-3-eblake@redhat.com>
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
Resent-Message-ID: <nHl9gAf1mPI.A.OPD.NlqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1631
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-3-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:33:33 +0000 (UTC)

For 32-bit block status, we were able to cheat and use an array with
an odd number of elements, with array[0] holding the context id, and
passing &array[1] to the user's callback.  But once we have 64-bit
extents, we can no longer abuse array element 0 like that.  Split out
a new state to receive the context id separately from the extents
array.  No behavioral change, other than the rare possibility of
landing in the new state.
---
 lib/internal.h                      |  1 +
 generator/state_machine.ml          | 11 +++++-
 generator/states-reply-structured.c | 58 ++++++++++++++++++++---------
 3 files changed, 51 insertions(+), 19 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 0e205aba..7e96e8e9 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -274,6 +274,7 @@ struct nbd_handle {
   size_t querynum;

   /* When receiving block status, this is used. */
+  uint32_t bs_contextid;
   uint32_t *bs_entries;

   /* Commands which are waiting to be issued [meaning the request
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index 3bc77f24..99652948 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: state machine definition
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -862,10 +862,17 @@ and
     external_events = [];
   };

+  State {
+    default_state with
+    name = "RECV_BS_CONTEXTID";
+    comment = "Receive contextid of structured reply block-status payload";
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
index 70010474..e1da850d 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -185,19 +185,10 @@ STATE_MACHINE {
       set_error (0, "not expecting NBD_REPLY_TYPE_BLOCK_STATUS here");
       return 0;
     }
-    /* We read the context ID followed by all the entries into a
-     * single array and deal with it at the end.
-     */
-    free (h->bs_entries);
-    h->bs_entries = malloc (length);
-    if (h->bs_entries == NULL) {
-      SET_NEXT_STATE (%.DEAD);
-      set_error (errno, "malloc");
-      return 0;
-    }
-    h->rbuf = h->bs_entries;
-    h->rlen = length;
-    SET_NEXT_STATE (%RECV_BS_ENTRIES);
+    /* Start by reading the context ID. */
+    h->rbuf = &h->bs_contextid;
+    h->rlen = sizeof h->bs_contextid;
+    SET_NEXT_STATE (%RECV_BS_CONTEXTID);
     return 0;
   }
   else {
@@ -452,9 +443,41 @@ STATE_MACHINE {
   }
   return 0;

+ REPLY.STRUCTURED_REPLY.RECV_BS_CONTEXTID:
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
+    length -= sizeof h->bs_contextid;
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
   struct meta_context *meta_context;
@@ -473,15 +496,16 @@ STATE_MACHINE {
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     assert (h->bs_entries);
     assert (length >= 12);
+    count = (length - sizeof h->bs_contextid) / sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we
      * don't validate them.
      */
-    for (i = 0; i < length/4; ++i)
+    for (i = 0; i < count; ++i)
       h->bs_entries[i] = be32toh (h->bs_entries[i]);

     /* Look up the context ID. */
-    context_id = h->bs_entries[0];
+    context_id = be32toh (h->bs_contextid);
     for (meta_context = h->meta_contexts;
          meta_context;
          meta_context = meta_context->next)
@@ -494,7 +518,7 @@ STATE_MACHINE {

       if (CALL_CALLBACK (cmd->cb.fn.extent,
                          meta_context->name, cmd->offset,
-                         &h->bs_entries[1], (length-4) / 4,
+                         h->bs_entries, count,
                          &error) == -1)
         if (cmd->error == 0)
           cmd->error = error ? error : EPROTO;
-- 
2.33.1

