Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1A52F9C8
	for <lists+nbd@lfdr.de>; Sat, 21 May 2022 09:42:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B52FF20250; Sat, 21 May 2022 07:42:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 21 07:42:33 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 66A4F202C9
	for <lists-other-nbd@bendel.debian.org>; Sat, 21 May 2022 07:24:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.17 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lNXu1hK4M621 for <lists-other-nbd@bendel.debian.org>;
	Sat, 21 May 2022 07:24:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AC716202DE
	for <nbd@other.debian.org>; Sat, 21 May 2022 07:24:17 +0000 (UTC)
Received: from kwepemi100012.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L4w7B33RVzhYlL;
	Sat, 21 May 2022 15:23:34 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi100012.china.huawei.com (7.221.188.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 21 May 2022 15:24:13 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 21 May
 2022 15:24:12 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <yukuai3@huawei.com>,
	<ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
Subject: [PATCH -next v3 4/6] nbd: fix io hung while disconnecting device
Date: Sat, 21 May 2022 15:37:47 +0800
Message-ID: <20220521073749.3146892-5-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220521073749.3146892-1-yukuai3@huawei.com>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <L6INOrriyhG.A.i0F.pfJiiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2088
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220521073749.3146892-5-yukuai3@huawei.com
Resent-Date: Sat, 21 May 2022 07:42:33 +0000 (UTC)

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
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a0d0910dae2a..ec736cc52134 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1429,7 +1429,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 				 struct block_device *bdev)
 {
-	sock_shutdown(nbd);
+	nbd_clear_sock(nbd);
 	__invalidate_device(bdev, true);
 	nbd_bdev_reset(nbd);
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
-- 
2.31.1

