Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED19B237
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:37:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D539520436; Fri, 23 Aug 2019 14:37:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:37:58 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D3993204E7
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:37:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zlSCM6urFcaQ for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:37:40 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1DD22204F3
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:37:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFDC718C8910;
	Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB126CE58;
	Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	libguestfs@redhat.com,
	qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH 4/5] nbd: Implement server use of NBD FAST_ZERO
Date: Fri, 23 Aug 2019 09:37:25 -0500
Message-Id: <20190823143726.27062-5-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-1-eblake@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 14:37:36 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <J85I-TAJuiC.A.siC.Gp_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/637
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823143726.27062-5-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:37:58 +0000 (UTC)

The server side is fairly straightforward: we can always advertise
support for detection of fast zero, and implement it by mapping the
request to the block layer BDRV_REQ_NO_FALLBACK.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

Again, this may be worth merging with the previous patch.
---
 nbd/server.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 981bc3cb1151..3c0799eda87f 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1514,7 +1514,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uint64_t dev_offset,
             exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
         }
     } else {
-        exp->nbdflags |= NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES;
+        exp->nbdflags |= (NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES |
+                          NBD_FLAG_SEND_FAST_ZERO);
     }
     assert(size <= INT64_MAX - dev_offset);
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);
@@ -2167,7 +2168,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     if (request->type == NBD_CMD_READ && client->structured_reply) {
         valid_flags |= NBD_CMD_FLAG_DF;
     } else if (request->type == NBD_CMD_WRITE_ZEROES) {
-        valid_flags |= NBD_CMD_FLAG_NO_HOLE;
+        valid_flags |= NBD_CMD_FLAG_NO_HOLE | NBD_CMD_FLAG_FAST_ZERO;
     } else if (request->type == NBD_CMD_BLOCK_STATUS) {
         valid_flags |= NBD_CMD_FLAG_REQ_ONE;
     }
@@ -2306,6 +2307,9 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
         if (!(request->flags & NBD_CMD_FLAG_NO_HOLE)) {
             flags |= BDRV_REQ_MAY_UNMAP;
         }
+        if (request->flags & NBD_CMD_FLAG_FAST_ZERO) {
+            flags |= BDRV_REQ_NO_FALLBACK;
+        }
         ret = blk_pwrite_zeroes(exp->blk, request->from + exp->dev_offset,
                                 request->len, flags);
         return nbd_send_generic_reply(client, request->handle, ret,
-- 
2.21.0

