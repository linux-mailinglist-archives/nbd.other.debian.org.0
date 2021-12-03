Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F7468066
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:31:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6DA072016F; Fri,  3 Dec 2021 23:31:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:31:45 2021
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
	by bendel.debian.org (Postfix) with ESMTP id B170020166
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:31:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S9kVRGFwEZn8 for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:31:32 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B52072015F
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibcawdHRmUpfibv2B8Hsfyy1NTf7zArNMZpqL9nnHVc=;
	b=blJRen+N9BDkE6nGqgfivTDeDF8Am+iq5L10k4quwtbFJsTblyEIrDy86NVC4uGQCu9o4c
	yuFQzzHPG6M4S+KV8V17evT78apJ0LP/EMvTxmwsiKh0pxiFc6WkMhAQ6jyPoXqzLuNrSi
	mRz9A7vd4WkKhIidVV+ze8PUHvCqelA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-jfpZX-kXOIKrplRnXoXRow-1; Fri, 03 Dec 2021 18:16:06 -0500
X-MC-Unique: jfpZX-kXOIKrplRnXoXRow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E240E102C886;
	Fri,  3 Dec 2021 23:16:05 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF2E15D9D5;
	Fri,  3 Dec 2021 23:15:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com
Subject: [PATCH 04/14] nbd/client: Add safety check on chunk payload length
Date: Fri,  3 Dec 2021 17:15:29 -0600
Message-Id: <20211203231539.3900865-5-eblake@redhat.com>
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
Resent-Message-ID: <J7ROmc44JKC.A.D6C.hjqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1620
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-5-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:31:45 +0000 (UTC)

Our existing use of structured replies either reads into a qiov capped
at 32M (NBD_CMD_READ) or caps allocation to 1000 bytes (see
NBD_MAX_MALLOC_PAYLOAD in block/nbd.c).  But the existing length
checks are rather late; if we encounter a buggy (or malicious) server
that sends a super-large payload length, we should drop the connection
right then rather than assuming the layer on top will be careful.
This becomes more important when we permit 64-bit lengths which are
even more likely to have the potential for attempted denial of service
abuse.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/nbd/client.c b/nbd/client.c
index 30d5383cb195..8f137c2320bb 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -1412,6 +1412,18 @@ static int nbd_receive_structured_reply_chunk(QIOChannel *ioc,
     chunk->handle = be64_to_cpu(chunk->handle);
     chunk->length = be32_to_cpu(chunk->length);

+    /*
+     * Because we use BLOCK_STATUS with REQ_ONE, and cap READ requests
+     * at 32M, no valid server should send us payload larger than
+     * this.  Even if we stopped using REQ_ONE, sane servers will cap
+     * the number of extents they return for block status.
+     */
+    if (chunk->length > NBD_MAX_BUFFER_SIZE + sizeof(NBDStructuredReadData)) {
+        error_setg(errp, "server chunk %" PRIu32 " (%s) payload is too long",
+                   chunk->type, nbd_rep_lookup(chunk->type));
+        return -EINVAL;
+    }
+
     return 0;
 }

-- 
2.33.1

