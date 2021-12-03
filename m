Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC6246807E
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:34:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E630F20178; Fri,  3 Dec 2021 23:34:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:34:17 2021
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
	by bendel.debian.org (Postfix) with ESMTP id DB658200E5
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:34:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d4b4Y0dfHXnE for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:34:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 34D0F20153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=68wLFDmhwgI93GM09cg1fWteej9OMa60cYVzyX0BSaI=;
	b=Nqk/DWtrdrsGNXdG3QAE5MgZg56Cc6ybIpb21PBbAmkN6QGzqs81S/R8XbA7Da31HdTsQr
	SXiV5MBEHb4Qx6f5IaBeogLfZTVGrjlWbEaFDuKaLSfYmKEtZ4UMMb2q8X8CldCxJUqGdd
	A0tUEUhATrK3+IUxt3CQNaDnmJKqQXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-wf9M9K8FNV6NjBdTz1VFkw-1; Fri, 03 Dec 2021 18:17:58 -0500
X-MC-Unique: wf9M9K8FNV6NjBdTz1VFkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0DA801B26;
	Fri,  3 Dec 2021 23:17:56 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E932EADD5;
	Fri,  3 Dec 2021 23:17:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 04/13] protocol: Prepare to send 64-bit requests
Date: Fri,  3 Dec 2021 17:17:32 -0600
Message-Id: <20211203231741.3901263-5-eblake@redhat.com>
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
Resent-Message-ID: <JZJwx_rezjI.A.TjD.5lqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1638
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-5-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:34:17 +0000 (UTC)

Support sending 64-bit requests if extended headers were negotiated.

At this point, h->extended_headers is permanently false (we can't
enable it until all other aspects of the protocol have likewise been
converted).
---
 lib/internal.h                      | 12 ++++++++---
 generator/states-issue-command.c    | 31 +++++++++++++++++++----------
 generator/states-reply-structured.c |  2 +-
 lib/rw.c                            | 10 ++++------
 4 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/lib/internal.h b/lib/internal.h
index 7e96e8e9..07378588 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: internal definitions
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -106,6 +106,9 @@ struct nbd_handle {
   char *tls_username;           /* Username, NULL = use current username */
   char *tls_psk_file;           /* PSK filename, NULL = no PSK */

+  /* Extended headers. */
+  bool extended_headers;        /* If we negotiated NBD_OPT_EXTENDED_HEADERS */
+
   /* Desired metadata contexts. */
   bool request_sr;
   string_vector request_meta_contexts;
@@ -242,7 +245,10 @@ struct nbd_handle {
   /* Issuing a command must use a buffer separate from sbuf, for the
    * case when we interrupt a request to service a reply.
    */
-  struct nbd_request request;
+  union {
+    struct nbd_request request;
+    struct nbd_request_ext request_ext;
+  } req;
   bool in_write_payload;
   bool in_write_shutdown;

@@ -347,7 +353,7 @@ struct command {
   uint16_t type;
   uint64_t cookie;
   uint64_t offset;
-  uint32_t count;
+  uint64_t count;
   void *data; /* Buffer for read/write */
   struct command_cb cb;
   enum state state; /* State to resume with on next POLLIN */
diff --git a/generator/states-issue-command.c b/generator/states-issue-command.c
index a8101144..7b1d6dc7 100644
--- a/generator/states-issue-command.c
+++ b/generator/states-issue-command.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -41,14 +41,23 @@ STATE_MACHINE {
     return 0;
   }

-  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
-  h->request.flags = htobe16 (cmd->flags);
-  h->request.type = htobe16 (cmd->type);
-  h->request.handle = htobe64 (cmd->cookie);
-  h->request.offset = htobe64 (cmd->offset);
-  h->request.count = htobe32 ((uint32_t) cmd->count);
-  h->wbuf = &h->request;
-  h->wlen = sizeof (h->request);
+  /* These fields are coincident between req.request and req.request_ext */
+  h->req.request.flags = htobe16 (cmd->flags);
+  h->req.request.type = htobe16 (cmd->type);
+  h->req.request.handle = htobe64 (cmd->cookie);
+  h->req.request.offset = htobe64 (cmd->offset);
+  if (h->extended_headers) {
+    h->req.request_ext.magic = htobe32 (NBD_REQUEST_EXT_MAGIC);
+    h->req.request_ext.count = htobe64 (cmd->count);
+    h->wlen = sizeof (h->req.request_ext);
+  }
+  else {
+    assert (cmd->count <= UINT32_MAX);
+    h->req.request.magic = htobe32 (NBD_REQUEST_MAGIC);
+    h->req.request.count = htobe32 (cmd->count);
+    h->wlen = sizeof (h->req.request);
+  }
+  h->wbuf = &h->req;
   if (cmd->type == NBD_CMD_WRITE || cmd->next)
     h->wflags = MSG_MORE;
   SET_NEXT_STATE (%SEND_REQUEST);
@@ -73,7 +82,7 @@ STATE_MACHINE {

   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.request.handle));
   if (cmd->type == NBD_CMD_WRITE) {
     h->wbuf = cmd->data;
     h->wlen = cmd->count;
@@ -119,7 +128,7 @@ STATE_MACHINE {
   assert (!h->wlen);
   assert (h->cmds_to_issue != NULL);
   cmd = h->cmds_to_issue;
-  assert (cmd->cookie == be64toh (h->request.handle));
+  assert (cmd->cookie == be64toh (h->req.request.handle));
   h->cmds_to_issue = cmd->next;
   if (h->cmds_to_issue_tail == cmd)
     h->cmds_to_issue_tail = NULL;
diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index e1da850d..5524e000 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -34,7 +34,7 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
       offset + length > cmd->offset + cmd->count) {
     set_error (0, "range of structured reply is out of bounds, "
                "offset=%" PRIu64 ", cmd->offset=%" PRIu64 ", "
-               "length=%" PRIu32 ", cmd->count=%" PRIu32 ": "
+               "length=%" PRIu32 ", cmd->count=%" PRIu64 ": "
                "this is likely to be a bug in the NBD server",
                offset, cmd->offset, length, cmd->count);
     return false;
diff --git a/lib/rw.c b/lib/rw.c
index 4ade7508..16c2e848 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -216,13 +216,11 @@ nbd_internal_command_common (struct nbd_handle *h,
     }
     break;

-    /* Other commands are currently limited by the 32 bit field in the
-     * command structure on the wire, but in future we hope to support
-     * 64 bit values here with a change to the NBD protocol which is
-     * being discussed upstream.
+    /* Other commands are limited by the 32 bit field in the command
+     * structure on the wire, unless extended headers were negotiated.
      */
   default:
-    if (count > UINT32_MAX) {
+    if (!h->extended_headers && count > UINT32_MAX) {
       set_error (ERANGE, "request too large: maximum request size is %" PRIu32,
                  UINT32_MAX);
       goto err;
-- 
2.33.1

