Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B883628CD4
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:00:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6075020668; Mon, 14 Nov 2022 23:00:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:00:56 2022
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
	by bendel.debian.org (Postfix) with ESMTP id AAE7B20687
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:59:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id snpjsMKWTGCA for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:59:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AAF9E20686
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDtXC+vARe66jRIcdES2jWaXwJ20uxlRPIx8ZWr1N8M=;
	b=a/VfuUpvzJFVQaoBXiIoML8H8SfsqV9RIH4y8BHm8DlcFRNqPygqXQLivYnUNk49HOd50X
	Stf5j94L4yKqaAf04jloQA7+2DA+UXbgo2h4h3CMPtGwKYQyRck2eyZEn9aqGHG8ajlXUv
	+/qZW6JHwek/CvLXBEfhttO8V8saq+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-q_XoddxBOPalLCO1acSQvw-1; Mon, 14 Nov 2022 17:52:05 -0500
X-MC-Unique: q_XoddxBOPalLCO1acSQvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63D4C101CC6B;
	Mon, 14 Nov 2022 22:52:05 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0050940E9786;
	Mon, 14 Nov 2022 22:52:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 06/23] states: Break deadlock if server goofs on extended replies
Date: Mon, 14 Nov 2022 16:51:41 -0600
Message-Id: <20221114225158.2186742-7-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1XIDPIZB7E.A.KED.oiscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2271
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-7-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:00:56 +0000 (UTC)

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
---
 generator/states-reply.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/generator/states-reply.c b/generator/states-reply.c
index dde23b39..e89e9019 100644
--- a/generator/states-reply.c
+++ b/generator/states-reply.c
@@ -109,7 +109,23 @@  REPLY.START:
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
+        (char *) h->rbuf >= (char *) &h->sbuf.reply.hdr.extended.flags) {
+      uint32_t magic = be32toh (h->sbuf.reply.hdr.extended.magic);
+      if (magic != NBD_EXTENDED_REPLY_MAGIC) {
+        SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
+        set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
+      }
+    }
+    return 0;
   case 0: SET_NEXT_STATE (%CHECK_SIMPLE_OR_STRUCTURED_REPLY);
   }
   return 0;
-- 
2.38.1

