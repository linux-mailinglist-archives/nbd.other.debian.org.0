Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 820475409DA
	for <lists+nbd@lfdr.de>; Tue,  7 Jun 2022 20:15:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 63AED20455; Tue,  7 Jun 2022 18:15:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun  7 18:15:32 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 7A70920466
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jun 2022 17:58:26 +0000 (UTC)
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
	with ESMTP id hfmMubRggENX for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jun 2022 17:58:18 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1926820457
	for <nbd@other.debian.org>; Tue,  7 Jun 2022 17:58:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6499B8236C;
	Tue,  7 Jun 2022 17:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15AE4C36B00;
	Tue,  7 Jun 2022 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654624695;
	bh=2e5pUUto/Xuu9Y6V3/uItR2CGl7ZCPTgGB55aZ2W+dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqrNTX6HYGB7PZsPKKsbDPXMyJ4IT/5gMFozIs5s28+QI+SRL9Ali9wVeB6AmpQVh
	 bddhub/kX/bKKVvkrnVQOJ10IhIvBgKFmXaVDeQUHWYFnL4yT/8BPydcuqtPrgTIEM
	 oyrNydmGOlxzQBA6Dc0Nn3GTu78c41/67F2SEjvJyMhaoqyrN2oMY8Y6MwwiJW69iv
	 xBS5+JrHrtvr5kWDizENQ2N4sJUILea6ATpIZ3a3g6zbugqyp18NmPZWiKaZllMk2V
	 3wzVEVTChQQZFdqNDrjpUnqFblpUbNsqWU0ghxfpmunbm7yCVggVLeYQP8SXdc8Isp
	 YqkE0EVadb36Q==
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
Subject: [PATCH AUTOSEL 5.15 45/51] nbd: fix race between nbd_alloc_config() and module removal
Date: Tue,  7 Jun 2022 13:55:44 -0400
Message-Id: <20220607175552.479948-45-sashal@kernel.org>
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
Resent-Message-ID: <lsyhEgeBtZP.A.lHG.EX5niB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2123
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220607175552.479948-45-sashal@kernel.org
Resent-Date: Tue,  7 Jun 2022 18:15:32 +0000 (UTC)

From: Yu Kuai <yukuai3@huawei.com>

[ Upstream commit c55b2b983b0fa012942c3eb16384b2b722caa810 ]

When nbd module is being removing, nbd_alloc_config() may be
called concurrently by nbd_genl_connect(), although try_module_get()
will return false, but nbd_alloc_config() doesn't handle it.

The race may lead to the leak of nbd_config and its related
resources (e.g, recv_workq) and oops in nbd_read_stat() due
to the unload of nbd module as shown below:

  BUG: kernel NULL pointer dereference, address: 0000000000000040
  Oops: 0000 [#1] SMP PTI
  CPU: 5 PID: 13840 Comm: kworker/u17:33 Not tainted 5.14.0+ #1
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
  Workqueue: knbd16-recv recv_work [nbd]
  RIP: 0010:nbd_read_stat.cold+0x130/0x1a4 [nbd]
  Call Trace:
   recv_work+0x3b/0xb0 [nbd]
   process_one_work+0x1ed/0x390
   worker_thread+0x4a/0x3d0
   kthread+0x12a/0x150
   ret_from_fork+0x22/0x30

Fixing it by checking the return value of try_module_get()
in nbd_alloc_config(). As nbd_alloc_config() may return ERR_PTR(-ENODEV),
assign nbd->config only when nbd_alloc_config() succeeds to ensure
the value of nbd->config is binary (valid or NULL).

Also adding a debug message to check the reference counter
of nbd_config during module removal.

Signed-off-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20220521073749.3146892-3-yukuai3@huawei.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 576ff4b59b32..e5d0c7a1748b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1463,15 +1463,20 @@ static struct nbd_config *nbd_alloc_config(void)
 {
 	struct nbd_config *config;
 
+	if (!try_module_get(THIS_MODULE))
+		return ERR_PTR(-ENODEV);
+
 	config = kzalloc(sizeof(struct nbd_config), GFP_NOFS);
-	if (!config)
-		return NULL;
+	if (!config) {
+		module_put(THIS_MODULE);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
 	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
-	try_module_get(THIS_MODULE);
 	return config;
 }
 
@@ -1498,12 +1503,13 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
-		config = nbd->config = nbd_alloc_config();
-		if (!config) {
-			ret = -ENOMEM;
+		config = nbd_alloc_config();
+		if (IS_ERR(config)) {
+			ret = PTR_ERR(config);
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
+		nbd->config = config;
 		refcount_set(&nbd->config_refs, 1);
 		refcount_inc(&nbd->refs);
 		mutex_unlock(&nbd->config_lock);
@@ -1910,13 +1916,14 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		nbd_put(nbd);
 		return -EINVAL;
 	}
-	config = nbd->config = nbd_alloc_config();
-	if (!nbd->config) {
+	config = nbd_alloc_config();
+	if (IS_ERR(config)) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
 		printk(KERN_ERR "nbd: couldn't allocate config\n");
-		return -ENOMEM;
+		return PTR_ERR(config);
 	}
+	nbd->config = config;
 	refcount_set(&nbd->config_refs, 1);
 	set_bit(NBD_RT_BOUND, &config->runtime_flags);
 
@@ -2488,6 +2495,9 @@ static void __exit nbd_cleanup(void)
 	while (!list_empty(&del_list)) {
 		nbd = list_first_entry(&del_list, struct nbd_device, list);
 		list_del_init(&nbd->list);
+		if (refcount_read(&nbd->config_refs))
+			printk(KERN_ERR "nbd: possibly leaking nbd_config (ref %d)\n",
+					refcount_read(&nbd->config_refs));
 		if (refcount_read(&nbd->refs) != 1)
 			printk(KERN_ERR "nbd: possibly leaking a device\n");
 		nbd_put(nbd);
-- 
2.35.1

