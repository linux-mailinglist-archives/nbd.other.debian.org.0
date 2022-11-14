Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6821D628D1C
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1EEEA2067E; Mon, 14 Nov 2022 23:05:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:12 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 790A52067D
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fiJEk3O9LPYq for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D5CBD20668
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzTEBYqs7XYX4CjhiYRYgBnv2AzlV5X742T2Py1Whn8=;
	b=ONuuxEXaZP4emqoogl4QiUmZk11LqnEmWmSuQlrcQvbL3CJBPQLQqYecQKiy9SMpJOMwRP
	8teg+f6ydIg47FyyyqRAcbvSccqO386Y3grPa77qxmp8SffHBGaA0l4avBrV7Q7YQKQpqr
	fGCpFFJj21xWh3p47iabcTBV7NXp8HI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-2mtY7N2BO5aHhvGgVXZN8g-1; Mon, 14 Nov 2022 17:48:55 -0500
X-MC-Unique: 2mtY7N2BO5aHhvGgVXZN8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B2BC85A59D;
	Mon, 14 Nov 2022 22:48:55 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B91940B48EA;
	Mon, 14 Nov 2022 22:48:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 01/15] nbd/client: Add safety check on chunk payload length
Date: Mon, 14 Nov 2022 16:48:34 -0600
Message-Id: <20221114224848.2186298-2-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5XV2p0r7A9F.A.V_D.omscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2287
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-2-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:13 +0000 (UTC)

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
index 90a6b7b38b..cd97a2aa09 100644
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
2.38.1

