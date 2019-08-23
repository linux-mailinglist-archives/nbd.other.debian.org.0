Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8969B236
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:37:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3A0B720384; Fri, 23 Aug 2019 14:37:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:37:54 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8EFCF204F6
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vw2ds8m0OSIt for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:39 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5D688204E7
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 462F989AC9;
	Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC1856CE58;
	Fri, 23 Aug 2019 14:37:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH 3/5] nbd: Implement client use of NBD FAST_ZERO
Date: Fri, 23 Aug 2019 09:37:24 -0500
Message-Id: <20190823143726.27062-4-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-vEbzs7_kzJ.A.ZhC.Cp_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/636
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-4-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:37:54 +0000 (UTC)

The client side is fairly straightforward: if the server advertised
fast zero support, then we can map that to BDRV_REQ_NO_FALLBACK
support.  A server that advertises FAST_ZERO but not WRITE_ZEROES
is technically broken, but we can ignore that situation as it does
not change our behavior.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

Perhaps this is worth merging with the previous patch.
---
 block/nbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index beed46fb3414..8339d7106366 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1044,6 +1044,10 @@ static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     if (!(flags & BDRV_REQ_MAY_UNMAP)) {
         request.flags |= NBD_CMD_FLAG_NO_HOLE;
     }
+    if (flags & BDRV_REQ_NO_FALLBACK) {
+        assert(s->info.flags & NBD_FLAG_SEND_FAST_ZERO);
+        request.flags |= NBD_CMD_FLAG_FAST_ZERO;
+    }

     if (!bytes) {
         return 0;
@@ -1239,6 +1243,9 @@ static int nbd_client_connect(BlockDriverState *bs, Error **errp)
     }
     if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
         bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
+        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
+            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
+        }
     }

     s->sioc = sioc;
-- 
2.21.0

