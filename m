Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 415DB46806A
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A4C720160; Fri,  3 Dec 2021 23:32:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:13 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 47291200E5
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sFpcfRa7K9BV for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 9465520153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tY7h3+bq2nYHgwaUd6pL1PiQc9UJocScO6g1ctQu6O4=;
	b=HIUrgxV0mdVlkSxAhtY88nObzAE8EKavaAA8V9LeAGs9QOnLpzM6LQwqWU5AI4q5VHucHm
	kCX26Tw7PJ1wDt1ChS8SYlKZeyecP6f+tquonzPapIxeVbQLmFxYlJfmskjDONdDXo6C9V
	CYX3BdkyR+mPr+1fQdeq6iS8Rq/+3js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-105-DjEC12nGOGqBolIv-x8Tmg-1; Fri, 03 Dec 2021 18:16:37 -0500
X-MC-Unique: DjEC12nGOGqBolIv-x8Tmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1A5102C886;
	Fri,  3 Dec 2021 23:16:36 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD5C5D9D5;
	Fri,  3 Dec 2021 23:16:35 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com
Subject: [PATCH 14/14] do not apply: nbd/server: Send 64-bit hole chunk
Date: Fri,  3 Dec 2021 17:15:39 -0600
Message-Id: <20211203231539.3900865-15-eblake@redhat.com>
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
Resent-Message-ID: <-AO7LABzW0L.A.tAD.9jqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1624
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-15-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:13 +0000 (UTC)

Since we cap NBD_CMD_READ requests to 32M, we never have a reason to
send a 64-bit chunk type for a hole; but it is worth producing these
for interoperability testing of clients that want extended headers.
---
 nbd/server.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 7e6140350797..4369a9a8ff08 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2071,19 +2071,29 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
         if (status & BDRV_BLOCK_ZERO) {
             NBDReply hdr;
             NBDStructuredReadHole chunk;
+            NBDStructuredReadHoleExt chunk_ext;
             struct iovec iov[] = {
                 {.iov_base = &hdr},
-                {.iov_base = &chunk, .iov_len = sizeof(chunk)},
+                {.iov_base = client->extended_headers ? &chunk_ext
+                 : (void *) &chunk,
+                 .iov_len = client->extended_headers ? sizeof(chunk_ext)
+                 : sizeof(chunk)},
             };

             trace_nbd_co_send_structured_read_hole(handle, offset + progress,
                                                    pnum);
             set_be_chunk(client, &iov[0],
                          final ? NBD_REPLY_FLAG_DONE : 0,
-                         NBD_REPLY_TYPE_OFFSET_HOLE,
+                         client->extended_headers ? NBD_REPLY_TYPE_OFFSET_HOLE_EXT
+                         : NBD_REPLY_TYPE_OFFSET_HOLE,
                          handle, iov[1].iov_len);
-            stq_be_p(&chunk.offset, offset + progress);
-            stl_be_p(&chunk.length, pnum);
+            if (client->extended_headers) {
+                stq_be_p(&chunk_ext.offset, offset + progress);
+                stq_be_p(&chunk_ext.length, pnum);
+            } else {
+                stq_be_p(&chunk.offset, offset + progress);
+                stl_be_p(&chunk.length, pnum);
+            }
             ret = nbd_co_send_iov(client, iov, 2, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress,
-- 
2.33.1

