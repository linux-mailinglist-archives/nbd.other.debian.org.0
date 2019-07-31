Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1047C132
	for <lists+nbd@lfdr.de>; Wed, 31 Jul 2019 14:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 969142029C; Wed, 31 Jul 2019 12:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 31 12:24:09 2019
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,FOURLA,GMAIL,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6A11820280
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jul 2019 12:07:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, GMAIL=1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KeH4PpS7uXNR for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jul 2019 12:07:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4E1F920163
	for <nbd@other.debian.org>; Wed, 31 Jul 2019 12:07:31 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 26166B29F60F478F0E4D;
	Wed, 31 Jul 2019 20:07:27 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Wed, 31 Jul 2019 20:07:18 +0800
From: SunKe <sunke32@huawei.com>
To: <sunke32@huawei.com>, <josef@toxicpanda.com>, <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <kamatam@amazon.com>, <manoj.br@gmail.com>,
	<stable@vger.kernel.org>, <dwmw@amazon.com>
Subject: [PATCH v2] nbd: replace kill_bdev() with __invalidate_device() again
Date: Wed, 31 Jul 2019 20:13:10 +0800
Message-ID: <1564575190-132357-1-git-send-email-sunke32@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v34eS95j2DB.A.42F.phYQdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/610
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1564575190-132357-1-git-send-email-sunke32@huawei.com
Resent-Date: Wed, 31 Jul 2019 12:24:09 +0000 (UTC)

From: Munehisa Kamata <kamatam@amazon.com>

Commit abbbdf12497d ("replace kill_bdev() with __invalidate_device()")
once did this, but 29eaadc03649 ("nbd: stop using the bdev everywhere")
resurrected kill_bdev() and it has been there since then. So buffer_head
mappings still get killed on a server disconnection, and we can still
hit the BUG_ON on a filesystem on the top of the nbd device.

  EXT4-fs (nbd0): mounted filesystem with ordered data mode. Opts: (null)
  block nbd0: Receive control failed (result -32)
  block nbd0: shutting down sockets
  print_req_error: I/O error, dev nbd0, sector 66264 flags 3000
  EXT4-fs warning (device nbd0): htree_dirblock_to_tree:979: inode #2: lblock 0: comm ls: error -5 reading directory block
  print_req_error: I/O error, dev nbd0, sector 2264 flags 3000
  EXT4-fs error (device nbd0): __ext4_get_inode_loc:4690: inode #2: block 283: comm ls: unable to read itable block
  EXT4-fs error (device nbd0) in ext4_reserve_inode_write:5894: IO failure
  ------------[ cut here ]------------
  kernel BUG at fs/buffer.c:3057!
  invalid opcode: 0000 [#1] SMP PTI
  CPU: 7 PID: 40045 Comm: jbd2/nbd0-8 Not tainted 5.1.0-rc3+ #4
  Hardware name: Amazon EC2 m5.12xlarge/, BIOS 1.0 10/16/2017
  RIP: 0010:submit_bh_wbc+0x18b/0x190
  ...
  Call Trace:
   jbd2_write_superblock+0xf1/0x230 [jbd2]
   ? account_entity_enqueue+0xc5/0xf0
   jbd2_journal_update_sb_log_tail+0x94/0xe0 [jbd2]
   jbd2_journal_commit_transaction+0x12f/0x1d20 [jbd2]
   ? __switch_to_asm+0x40/0x70
   ...
   ? lock_timer_base+0x67/0x80
   kjournald2+0x121/0x360 [jbd2]
   ? remove_wait_queue+0x60/0x60
   kthread+0xf8/0x130
   ? commit_timeout+0x10/0x10 [jbd2]
   ? kthread_bind+0x10/0x10
   ret_from_fork+0x35/0x40

With __invalidate_device(), I no longer hit the BUG_ON with sync or
unmount on the disconnected device.

Fixes: 29eaadc03649 ("nbd: stop using the bdev everywhere")
Cc: linux-block@vger.kernel.org
Cc: Ratna Manoj Bolla <manoj.br@gmail.com>
Cc: nbd@other.debian.org
Cc: stable@vger.kernel.org
Cc: David Woodhouse <dwmw@amazon.com>
Signed-off-by: Munehisa Kamata <kamatam@amazon.com>

---
I reproduced this phenomenon on the fat file system.
reproduce steps :
1.Establish a nbd connection.
2.Run two threads:one do mount and umount,anther one do clear_sock ioctl
3.Then hit the BUG_ON.

v2: Delete a link.

Signed-off-by: SunKe <sunke32@huawei.com>

 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9bcde23..e21d2de 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1231,7 +1231,7 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 				 struct block_device *bdev)
 {
 	sock_shutdown(nbd);
-	kill_bdev(bdev);
+	__invalidate_device(bdev, true);
 	nbd_bdev_reset(bdev);
 	if (test_and_clear_bit(NBD_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
-- 
2.7.4

