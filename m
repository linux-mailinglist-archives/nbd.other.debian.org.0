Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8F628C63
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:56:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5B69B2067C; Mon, 14 Nov 2022 22:56:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:56:33 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DE9352067B
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:56:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ME5Kk8HA10OG for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:56:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 057072067A
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHsBQkgh32mZYDlsY0mZ2u45YAKMiJgOqFfn5u30FUM=;
	b=Ejow0YwJslsc0CbE8YywJSy17lLQN2nUT8FvjCOWdizME/mtYMJAFpDSKYoSkzabXUcVRf
	lYuo1WlaurGX4ldRXGRthiReTAZih18ILYtTH4Xn4xkpi/TRbCI/PKOypHIj1oh67fUoEe
	L3hkVRYGJFCpD6XeBGTNNXqDVdv7ddg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-Y1SxJHrLPdCwHXu-gqXVEA-1; Mon, 14 Nov 2022 17:49:06 -0500
X-MC-Unique: Y1SxJHrLPdCwHXu-gqXVEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47AFC101E989;
	Mon, 14 Nov 2022 22:49:06 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3AAE40E42E3;
	Mon, 14 Nov 2022 22:49:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v2 15/15] RFC: nbd/server: Send 64-bit hole chunk
Date: Mon, 14 Nov 2022 16:48:48 -0600
Message-Id: <20221114224848.2186298-16-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b3_l0YScABI.A.bv.hescjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2247
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-16-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:56:33 +0000 (UTC)

Since we cap NBD_CMD_READ requests to 32M, we never have a reason to
send a 64-bit chunk type for a hole; but it is worth producing these
for interoperability testing of clients that want extended headers.
---
 nbd/server.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index cd280f1721..04cb172f97 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2112,9 +2112,13 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
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

             trace_nbd_co_send_structured_read_hole(request->handle,
@@ -2122,9 +2126,17 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
                                                    pnum);
             set_be_chunk(client, &iov[0],
                          final ? NBD_REPLY_FLAG_DONE : 0,
-                         NBD_REPLY_TYPE_OFFSET_HOLE, request, iov[1].iov_len);
-            stq_be_p(&chunk.offset, offset + progress);
-            stl_be_p(&chunk.length, pnum);
+                         client->extended_headers
+                         ? NBD_REPLY_TYPE_OFFSET_HOLE_EXT
+                         : NBD_REPLY_TYPE_OFFSET_HOLE,
+                         request, iov[1].iov_len);
+            if (client->extended_headers) {
+                stq_be_p(&chunk_ext.offset, offset + progress);
+                stq_be_p(&chunk_ext.length, pnum);
+            } else {
+                stq_be_p(&chunk.offset, offset + progress);
+                stl_be_p(&chunk.length, pnum);
+            }
             ret = nbd_co_send_iov(client, iov, 2, errp);
         } else {
             ret = blk_pread(exp->common.blk, offset + progress, pnum,
-- 
2.38.1

