Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBFA46806D
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 47FD120166; Fri,  3 Dec 2021 23:32:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:25 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 088B42016C
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Sr6MAIwFd2fY for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id AB62020153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjYgrIAEtIty4X+aptzEXKj4wdU3TPHUuNxJCtjWAdU=;
	b=hd4FWrrZVNSv1M/QUC69tf4xNrFRbk8u/gtPXyLGGz8Mbn1nFpykprz99l1ATADECMDXDF
	VUwUpB6g65pLOF++WXYYgDZ1VXsuhhi+WiG1mdpKrhw1eVQnpWIo/zORe6/Y8xnv/QbLti
	RIm7vIQW156C00Ac2sBakcvvPD5zG4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-ImXpeQSlP8yuRF2XULVQ-Q-1; Fri, 03 Dec 2021 18:15:59 -0500
X-MC-Unique: ImXpeQSlP8yuRF2XULVQ-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F8F801B01;
	Fri,  3 Dec 2021 23:15:58 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 061D95D9D5;
	Fri,  3 Dec 2021 23:15:56 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 02/14] qemu-io: Utilize 64-bit status during map
Date: Fri,  3 Dec 2021 17:15:27 -0600
Message-Id: <20211203231539.3900865-3-eblake@redhat.com>
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
Resent-Message-ID: <TwN-vsrPG8O.A.6DD.JkqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1626
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-3-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:25 +0000 (UTC)

The block layer has supported 64-bit block status from drivers since
commit 86a3d5c688 ("block: Add .bdrv_co_block_status() callback",
v2.12) and friends, with individual driver callbacks responsible for
capping things where necessary.  Artificially capping things below 2G
in the qemu-io 'map' command, added in commit d6a644bbfe ("block: Make
bdrv_is_allocated() byte-based", v2.10) is thus no longer necessary.

One way to test this is with qemu-nbd as server on a raw file larger
than 4G (the entire file should show as allocated), plus 'qemu-io -f
raw -c map nbd://localhost --trace=nbd_\*' as client.  Prior to this
patch, the NBD_CMD_BLOCK_STATUS requests are fragmented at 0x7ffffe00
distances; with this patch, the fragmenting changes to 0x7fffffff
(since the NBD protocol is currently still limited to 32-bit
transactions - see block/nbd.c:nbd_client_co_block_status).  Then in
later patches, once I add an NBD extension for a 64-bit block status,
the same map command completes with just one NBD_CMD_BLOCK_STATUS.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-io-cmds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 46593d632d8f..954955c12fb9 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1993,11 +1993,9 @@ static int map_is_allocated(BlockDriverState *bs, int64_t offset,
                             int64_t bytes, int64_t *pnum)
 {
     int64_t num;
-    int num_checked;
     int ret, firstret;

-    num_checked = MIN(bytes, BDRV_REQUEST_MAX_BYTES);
-    ret = bdrv_is_allocated(bs, offset, num_checked, &num);
+    ret = bdrv_is_allocated(bs, offset, bytes, &num);
     if (ret < 0) {
         return ret;
     }
@@ -2009,8 +2007,7 @@ static int map_is_allocated(BlockDriverState *bs, int64_t offset,
         offset += num;
         bytes -= num;

-        num_checked = MIN(bytes, BDRV_REQUEST_MAX_BYTES);
-        ret = bdrv_is_allocated(bs, offset, num_checked, &num);
+        ret = bdrv_is_allocated(bs, offset, bytes, &num);
         if (ret == firstret && num) {
             *pnum += num;
         } else {
-- 
2.33.1

