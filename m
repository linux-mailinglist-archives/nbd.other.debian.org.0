Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A57B46807B
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:33:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E187320166; Fri,  3 Dec 2021 23:33:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:33:54 2021
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
	by bendel.debian.org (Postfix) with ESMTP id BFDCE20160
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:33:38 +0000 (UTC)
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
	with ESMTP id dUao3P2UnAqV for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:33:35 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8C6512015F
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAikDzknh6GnT56mGmeoqGqtkzuR+VqfuYgmhIc0hOM=;
	b=AvkhtQlK4g1atQcNuht+w6EvlTBjMbEmfjLWqQMY++ar4PRwtdG2SzEf4gpK3Qr7aTc9Eb
	cYajHI+nCNC9qnAdZgzI1XiTW4yQ0wDYf+a7cdR0pCGMJiVHT1inIfpUAdA1RyXjgzNYj/
	CRwTjxxloJNcGXrB/yAGAD8FYXdcUJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-D6TiK4ddNQS-Hu3dl-jcUA-1; Fri, 03 Dec 2021 18:18:07 -0500
X-MC-Unique: D6TiK4ddNQS-Hu3dl-jcUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B79E104ECE7;
	Fri,  3 Dec 2021 23:18:06 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88A235DF2B;
	Fri,  3 Dec 2021 23:18:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 12/13] generator: Actually request extended headers
Date: Fri,  3 Dec 2021 17:17:40 -0600
Message-Id: <20211203231741.3901263-13-eblake@redhat.com>
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
Resent-Message-ID: <Uz40YphHLkM.A.CgD.ilqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1636
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-13-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:33:54 +0000 (UTC)

This is the culmination of the previous patches preparation work for
using extended headers when possible.  The new states in the state
machine are copied extensively from our handling of
OPT_STRUCTURED_REPLY.

At the same time I posted this patch, I had patches for qemu-nbd to
support extended headers as server (nbdkit is a bit tougher).  The
interop tests still pass when using a new enough qemu-nbd, showing
that we have cross-project interoperability and therefore an extension
worth standardizing.
---
 generator/Makefile.am                         |  3 +-
 generator/state_machine.ml                    | 41 +++++++++
 .../states-newstyle-opt-extended-headers.c    | 90 +++++++++++++++++++
 generator/states-newstyle-opt-starttls.c      | 10 +--
 4 files changed, 138 insertions(+), 6 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c

diff --git a/generator/Makefile.am b/generator/Makefile.am
index 594d23cf..c889eb7f 100644
--- a/generator/Makefile.am
+++ b/generator/Makefile.am
@@ -1,5 +1,5 @@
 # nbd client library in userspace
-# Copyright (C) 2013-2020 Red Hat Inc.
+# Copyright (C) 2013-2021 Red Hat Inc.
 #
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
@@ -30,6 +30,7 @@ states_code = \
 	states-issue-command.c \
 	states-magic.c \
 	states-newstyle-opt-export-name.c \
+	states-newstyle-opt-extended-headers.c \
 	states-newstyle-opt-list.c \
 	states-newstyle-opt-go.c \
 	states-newstyle-opt-meta-context.c \
diff --git a/generator/state_machine.ml b/generator/state_machine.ml
index 99652948..ad8eba5e 100644
--- a/generator/state_machine.ml
+++ b/generator/state_machine.ml
@@ -295,6 +295,7 @@ and
    * NEGOTIATING after OPT_STRUCTURED_REPLY or any failed OPT_GO.
    *)
   Group ("OPT_STARTTLS", newstyle_opt_starttls_state_machine);
+  Group ("OPT_EXTENDED_HEADERS", newstyle_opt_extended_headers_state_machine);
   Group ("OPT_STRUCTURED_REPLY", newstyle_opt_structured_reply_state_machine);
   Group ("OPT_META_CONTEXT", newstyle_opt_meta_context_state_machine);
   Group ("OPT_GO", newstyle_opt_go_state_machine);
@@ -432,6 +433,46 @@ and
   };
 ]

+(* Fixed newstyle NBD_OPT_EXTENDED_HEADERS option.
+ * Implementation: generator/states-newstyle-opt-extended-headers.c
+ *)
+and newstyle_opt_extended_headers_state_machine = [
+  State {
+    default_state with
+    name = "START";
+    comment = "Try to negotiate newstyle NBD_OPT_EXTENDED_HEADERS";
+    external_events = [];
+  };
+
+  State {
+    default_state with
+    name = "SEND";
+    comment = "Send newstyle NBD_OPT_EXTENDED_HEADERS negotiation request";
+    external_events = [ NotifyWrite, "" ];
+  };
+
+  State {
+    default_state with
+    name = "RECV_REPLY";
+    comment = "Receive newstyle NBD_OPT_EXTENDED_HEADERS option reply";
+    external_events = [ NotifyRead, "" ];
+  };
+
+  State {
+    default_state with
+    name = "RECV_REPLY_PAYLOAD";
+    comment = "Receive any newstyle NBD_OPT_EXTENDED_HEADERS reply payload";
+    external_events = [ NotifyRead, "" ];
+  };
+
+  State {
+    default_state with
+    name = "CHECK_REPLY";
+    comment = "Check newstyle NBD_OPT_EXTENDED_HEADERS option reply";
+    external_events = [];
+  };
+]
+
 (* Fixed newstyle NBD_OPT_STRUCTURED_REPLY option.
  * Implementation: generator/states-newstyle-opt-structured-reply.c
  *)
diff --git a/generator/states-newstyle-opt-extended-headers.c b/generator/states-newstyle-opt-extended-headers.c
new file mode 100644
index 00000000..e2c9890e
--- /dev/null
+++ b/generator/states-newstyle-opt-extended-headers.c
@@ -0,0 +1,90 @@
+/* nbd client library in userspace: state machine
+ * Copyright (C) 2013-2021 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+/* State machine for negotiating NBD_OPT_EXTENDED_HEADERS. */
+
+STATE_MACHINE {
+ NEWSTYLE.OPT_EXTENDED_HEADERS.START:
+  assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
+  if (!h->request_eh) {
+    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    return 0;
+  }
+
+  h->sbuf.option.version = htobe64 (NBD_NEW_VERSION);
+  h->sbuf.option.option = htobe32 (NBD_OPT_EXTENDED_HEADERS);
+  h->sbuf.option.optlen = htobe32 (0);
+  h->wbuf = &h->sbuf;
+  h->wlen = sizeof h->sbuf.option;
+  SET_NEXT_STATE (%SEND);
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.SEND:
+  switch (send_from_wbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:
+    h->rbuf = &h->sbuf;
+    h->rlen = sizeof h->sbuf.or.option_reply;
+    SET_NEXT_STATE (%RECV_REPLY);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY:
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:
+    if (prepare_for_reply_payload (h, NBD_OPT_EXTENDED_HEADERS) == -1) {
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
+    SET_NEXT_STATE (%RECV_REPLY_PAYLOAD);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.RECV_REPLY_PAYLOAD:
+  switch (recv_into_rbuf (h)) {
+  case -1: SET_NEXT_STATE (%.DEAD); return 0;
+  case 0:  SET_NEXT_STATE (%CHECK_REPLY);
+  }
+  return 0;
+
+ NEWSTYLE.OPT_EXTENDED_HEADERS.CHECK_REPLY:
+  uint32_t reply;
+
+  reply = be32toh (h->sbuf.or.option_reply.reply);
+  switch (reply) {
+  case NBD_REP_ACK:
+    debug (h, "negotiated extended headers on this connection");
+    h->extended_headers = true;
+    break;
+  default:
+    if (handle_reply_error (h) == -1) {
+      SET_NEXT_STATE (%.DEAD);
+      return 0;
+    }
+
+    debug (h, "extended headers are not supported by this server");
+    h->extended_headers = false;
+    break;
+  }
+
+  /* Next option. */
+  SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+  return 0;
+
+} /* END STATE MACHINE */
diff --git a/generator/states-newstyle-opt-starttls.c b/generator/states-newstyle-opt-starttls.c
index 9eab023b..2aec3f3d 100644
--- a/generator/states-newstyle-opt-starttls.c
+++ b/generator/states-newstyle-opt-starttls.c
@@ -1,5 +1,5 @@
 /* nbd client library in userspace: state machine
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -23,7 +23,7 @@ STATE_MACHINE {
   assert (h->gflags & LIBNBD_HANDSHAKE_FLAG_FIXED_NEWSTYLE);
   /* If TLS was not requested we skip this option and go to the next one. */
   if (h->tls == LIBNBD_TLS_DISABLE) {
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }

@@ -102,7 +102,7 @@ STATE_MACHINE {
     debug (h,
            "server refused TLS (%s), continuing with unencrypted connection",
            reply == NBD_REP_ERR_POLICY ? "policy" : "not supported");
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   return 0;
@@ -121,7 +121,7 @@ STATE_MACHINE {
     nbd_internal_crypto_debug_tls_enabled (h);

     /* Continue with option negotiation. */
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   /* Continue handshake. */
@@ -144,7 +144,7 @@ STATE_MACHINE {
     debug (h, "connection is using TLS");

     /* Continue with option negotiation. */
-    SET_NEXT_STATE (%^OPT_STRUCTURED_REPLY.START);
+    SET_NEXT_STATE (%^OPT_EXTENDED_HEADERS.START);
     return 0;
   }
   /* Continue handshake. */
-- 
2.33.1

