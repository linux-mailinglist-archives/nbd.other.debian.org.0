Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100B5409D7
	for <lists+nbd@lfdr.de>; Tue,  7 Jun 2022 20:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EE85220457; Tue,  7 Jun 2022 18:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun  7 18:15:09 2022
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1AA002046F
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jun 2022 17:58:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.891 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.801,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nBWYLece7FxK for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jun 2022 17:58:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 22C9C203DB
	for <nbd@other.debian.org>; Tue,  7 Jun 2022 17:58:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D44A0B82182;
	Tue,  7 Jun 2022 17:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72414C36B01;
	Tue,  7 Jun 2022 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624693;
	bh=Vsv5FbMVw3pkEaLeZiCeMjY7P507BUWK9PNzPkTQKmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYZHm4GRdmnESf5Zysx7PeOjuCdy1IuRan9n4G1XEdJO6W3VWdZeJp2VNNgOPNakz
	 ve74giPDwcQQFyFbcEOAZx/ldbdFsLocS8uDYjaXhlCr943SD51KysJ6jk1ETASUay
	 akzNjyYiEc+ihnxPqwuHnf4rHJn8o9+Dts4MrpqPjrWltqVj3/YZnNKVF9OQhiBA81
	 GYUI/tSPom1wWGqjID3Ikk3UgCjBjw3ekRNOWGAZSfVfAPx7UuGLrZyX8Tmeztw2BQ
	 hzT7spfQyZgmmIouMZkDwDeTBWw+m50fAxLLWcCT8GdZYaD5Db8k34ytN4mWsVtEjK
	 d7ZnD9OnpIVcw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yu Kuai <yukuai3@huawei.com>,
	Hou Tao <houtao1@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 5.15 44/51] nbd: call genl_unregister_family() first in nbd_cleanup()
Date: Tue,  7 Jun 2022 13:55:43 -0400
Message-Id: <20220607175552.479948-44-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607175552.479948-1-sashal@kernel.org>
References: <20220607175552.479948-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <h26nQzmzVdE.A.GCG.tW5niB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2121
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220607175552.479948-44-sashal@kernel.org
Resent-Date: Tue,  7 Jun 2022 18:15:09 +0000 (UTC)

From: Yu Kuai <yukuai3@huawei.com>

[ Upstream commit 06c4da89c24e7023ea448cadf8e9daf06a0aae6e ]

Otherwise there may be race between module removal and the handling of
netlink command, which can lead to the oops as shown below:

  BUG: kernel NULL pointer dereference, address: 0000000000000098
  Oops: 0002 [#1] SMP PTI
  CPU: 1 PID: 31299 Comm: nbd-client Tainted: G            E     5.14.0-rc4
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
  RIP: 0010:down_write+0x1a/0x50
  Call Trace:
   start_creating+0x89/0x130
   debugfs_create_dir+0x1b/0x130
   nbd_start_device+0x13d/0x390 [nbd]
   nbd_genl_connect+0x42f/0x748 [nbd]
   genl_family_rcv_msg_doit.isra.0+0xec/0x150
   genl_rcv_msg+0xe5/0x1e0
   netlink_rcv_skb+0x55/0x100
   genl_rcv+0x29/0x40
   netlink_unicast+0x1a8/0x250
   netlink_sendmsg+0x21b/0x430
   ____sys_sendmsg+0x2a4/0x2d0
   ___sys_sendmsg+0x81/0xc0
   __sys_sendmsg+0x62/0xb0
   __x64_sys_sendmsg+0x1f/0x30
   do_syscall_64+0x3b/0xc0
   entry_SYSCALL_64_after_hwframe+0x44/0xae
  Modules linked in: nbd(E-)

Signed-off-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20220521073749.3146892-2-yukuai3@huawei.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 582b23befb5c..576ff4b59b32 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2473,6 +2473,12 @@ static void __exit nbd_cleanup(void)
 	struct nbd_device *nbd;
 	LIST_HEAD(del_list);
 
+	/*
+	 * Unregister netlink interface prior to waiting
+	 * for the completion of netlink commands.
+	 */
+	genl_unregister_family(&nbd_genl_family);
+
 	nbd_dbg_close();
 
 	mutex_lock(&nbd_index_mutex);
@@ -2491,7 +2497,6 @@ static void __exit nbd_cleanup(void)
 	destroy_workqueue(nbd_del_wq);
 
 	idr_destroy(&nbd_index_idr);
-	genl_unregister_family(&nbd_genl_family);
 	unregister_blkdev(NBD_MAJOR, "nbd");
 }
 
-- 
2.35.1

