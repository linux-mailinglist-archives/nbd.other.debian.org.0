Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DE1710CFF
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:08:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE69C204D5; Thu, 25 May 2023 13:08:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:08:03 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 79F6A2046E
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:07:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L154YSvi2e2D for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:07:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8D3C8204D5
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685020051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCkHeKDhGdAy2KcDNg4UvSLEikIzNntLcUJ8URSj7tg=;
	b=f8Dlcnz5b/Wxld1n6DeXh2MCaHdhDMqRavqUvV16UNsOd+Rh/h4GuAdyjjEl1mGrS0Lkn6
	Bl9Lp9Sl+isA9qm8YtU8REXgfijxFNaIXun6ffzqOgAFYqpn8WFwYsX2YWy8lOHwa97ERY
	zzBxyFPLOnYA3GHlTmTr5t9VmF6G6po=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-zGs1kOJVMNSFeIg_N9_uPw-1; Thu, 25 May 2023 09:01:12 -0400
X-MC-Unique: zGs1kOJVMNSFeIg_N9_uPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E133C382C96F;
	Thu, 25 May 2023 13:01:11 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB0A492B0A;
	Thu, 25 May 2023 13:01:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 06/22] states: Break deadlock if server goofs on extended replies
Date: Thu, 25 May 2023 08:00:52 -0500
Message-Id: <20230525130108.757242-7-eblake@redhat.com>
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
Resent-Message-ID: <yf9M26tOZuK.A.Rf.z21bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2499
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-7-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:08:03 +0000 (UTC)

One of the benefits of extended replies is that we can do a
fixed-length read for the entire header of every server reply, which
is fewer syscalls than the split-read approach required by structured
replies.  But one of the drawbacks of doing a large read is that if
the server is non-compliant (not a problem for normal servers, but
something I hit rather more than I'd like to admit while developing
extended header support in servers), nbd_pwrite() and friends will
deadlock if the server replies with the wrong header.  Add in some
code to catch that failure mode and move the state machine to DEAD
sooner, to make it easier to diagnose the fault in the server.

Unlike in the case of an unexpected simply reply from a structured
server (where we never over-read, and can therefore commit b31e7bac
can merely fail the command with EPROTO and successfully move on to
the next server reply), in this case we really do have to move to
DEAD: in addition to having already read the 16 or 20 bytes that the
server sent in its (short) reply for this command, we may have already
read the initial bytes of the server's next reply, but we have no way
to push those extra bytes back onto our read stream for parsing on our
next pass through the state machine.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 generator/states-reply.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/generator/states-reply.c b/generator/states-reply.c
index 4e9f2dde..d4710d91 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -109,7 +109,28 @@  REPLY.START:
  REPLY.RECV_REPLY:
   switch (recv_into_rbuf (h)) {
   case -1: SET_NEXT_STATE (%.DEAD); return 0;
-  case 1: SET_NEXT_STATE (%.READY); return 0;
+  case 1: SET_NEXT_STATE (%.READY);
+    /* Special case: if we have a short read, but got at least far
+     * enough to decode the magic number, we can check if the server
+     * is matching our expectations. This lets us avoid deadlocking if
+     * a buggy server sends only 16 bytes of a simple reply, and is
+     * waiting for our next command, while we are blocked waiting for
+     * the server to send 32 bytes of an extended reply.
+     */
+    if (h->extended_headers &&
+        (char *)h->rbuf >= (char *)&h->sbuf.reply.hdr.extended.flags) {
+      uint32_t magic = be32toh (h->sbuf.reply.hdr.extended.magic);
+      if (magic != NBD_EXTENDED_REPLY_MAGIC) {
+        SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
+        set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
+#if 0 /* uncomment to see desynchronized data */
+        nbd_internal_hexdump (&h->sbuf.reply.hdr.extended.flags,
+                              sizeof (h->sbuf.reply.hdr.extended.flags),
+                              stderr);
+#endif
+      }
+    }
+    return 0;
   case 0: SET_NEXT_STATE (%CHECK_SIMPLE_OR_STRUCTURED_REPLY);
   }
   return 0;
-- 
2.40.1

