Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 733B1540980
	for <lists+nbd@lfdr.de>; Tue,  7 Jun 2022 20:09:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E57C520457; Tue,  7 Jun 2022 18:09:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun  7 18:09:20 2022
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,FVGT_m_MULTI_ODD,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4C42620455
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jun 2022 17:52:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.871 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.801,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8fP6AlEYUy3l for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jun 2022 17:52:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3FC13204B5
	for <nbd@other.debian.org>; Tue,  7 Jun 2022 17:52:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0950B82370;
	Tue,  7 Jun 2022 17:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CABC34119;
	Tue,  7 Jun 2022 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624349;
	bh=sAkOyYAdlcm/cEjKk2Eg7D9Ue+girWWWfYJDPt8GC8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9+EHjHMYHETD7EtIufbmi7eru40/QZs/3+KqAme6/ebuhD4HLoAgPr3CIhZykOIW
	 Y8p8GhseZSFH6OgDB/3aX9/VSB4dE54y0aasWF9RblwbYvf6q5ZRYi+vYEV8A7O7+T
	 u+bP3txnPV5qU86W+eANWs5q48Pa6ahV6J7ojf/F+N8TT4X6GKSKZ1uVZfPjSsKP5k
	 AIjscjc4PIbkmePG8paSrG362TeEF+3lkAoFO426I+/vUwMt4+dVWfD9n39B0/dOcx
	 uk6/X56lUpgzk/B7r89MDmSGSE0utEOgmBCsWGOuGlCJQG9PqCOo89XHIvwYxU5z4x
	 coUez3Tp5HFyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yu Kuai <yukuai3@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 5.18 58/68] nbd: fix io hung while disconnecting device
Date: Tue,  7 Jun 2022 13:48:24 -0400
Message-Id: <20220607174846.477972-58-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a988uUcA5XP.A.2YF.QR5niB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2116
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220607174846.477972-58-sashal@kernel.org
Resent-Date: Tue,  7 Jun 2022 18:09:20 +0000 (UTC)

From: Yu Kuai <yukuai3@huawei.com>

[ Upstream commit 09dadb5985023e27d4740ebd17e6fea4640110e5 ]

In our tests, "qemu-nbd" triggers a io hung:

INFO: task qemu-nbd:11445 blocked for more than 368 seconds.
      Not tainted 5.18.0-rc3-next-20220422-00003-g2176915513ca #884
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:qemu-nbd        state:D stack:    0 pid:11445 ppid:     1 flags:0x00000000
Call Trace:
 <TASK>
 __schedule+0x480/0x1050
 ? _raw_spin_lock_irqsave+0x3e/0xb0
 schedule+0x9c/0x1b0
 blk_mq_freeze_queue_wait+0x9d/0xf0
 ? ipi_rseq+0x70/0x70
 blk_mq_freeze_queue+0x2b/0x40
 nbd_add_socket+0x6b/0x270 [nbd]
 nbd_ioctl+0x383/0x510 [nbd]
 blkdev_ioctl+0x18e/0x3e0
 __x64_sys_ioctl+0xac/0x120
 do_syscall_64+0x35/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fd8ff706577
RSP: 002b:00007fd8fcdfebf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000040000000 RCX: 00007fd8ff706577
RDX: 000000000000000d RSI: 000000000000ab00 RDI: 000000000000000f
RBP: 000000000000000f R08: 000000000000fbe8 R09: 000055fe497c62b0
R10: 00000002aff20000 R11: 0000000000000246 R12: 000000000000006d
R13: 0000000000000000 R14: 00007ffe82dc5e70 R15: 00007fd8fcdff9c0

"qemu-ndb -d" will call ioctl 'NBD_DISCONNECT' first, however, following
message was found:

block nbd0: Send disconnect failed -32

Which indicate that something is wrong with the server. Then,
"qemu-nbd -d" will call ioctl 'NBD_CLEAR_SOCK', however ioctl can't clear
requests after commit 2516ab1543fd("nbd: only clear the queue on device
teardown"). And in the meantime, request can't complete through timeout
because nbd_xmit_timeout() will always return 'BLK_EH_RESET_TIMER', which
means such request will never be completed in this situation.

Now that the flag 'NBD_CMD_INFLIGHT' can make sure requests won't
complete multiple times, switch back to call nbd_clear_sock() in
nbd_clear_sock_ioctl(), so that inflight requests can be cleared.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20220521073749.3146892-5-yukuai3@huawei.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index f26cdb51812b..4a163bccd592 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1420,7 +1420,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 				 struct block_device *bdev)
 {
-	sock_shutdown(nbd);
+	nbd_clear_sock(nbd);
 	__invalidate_device(bdev, true);
 	nbd_bdev_reset(bdev);
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
-- 
2.35.1

