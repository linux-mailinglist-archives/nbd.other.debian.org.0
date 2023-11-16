Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D9F7EDD4B
	for <lists+nbd@lfdr.de>; Thu, 16 Nov 2023 10:03:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 973F420625; Thu, 16 Nov 2023 09:03:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 16 09:03:14 2023
Old-Return-Path: <linan666@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=DATE_IN_FUTURE_06_12,
	FVGT_m_MULTI_ODD,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E1D6520616
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Nov 2023 08:45:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.044 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DATE_IN_FUTURE_06_12=1.947, FVGT_m_MULTI_ODD=0.02,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NL4TxWDk80rc for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Nov 2023 08:44:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 946 seconds by postgrey-1.36 at bendel; Thu, 16 Nov 2023 08:44:54 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C1E3E20614
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 08:44:54 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SWCqb4Cg6z4f3kKC
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:28:59 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2686A1A01A3
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:29:02 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxHL0lVlgbRFBA--.19869S5;
	Thu, 16 Nov 2023 16:29:02 +0800 (CST)
From: linan666@huaweicloud.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	linan122@huawei.com,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	houtao1@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH 1/3] nbd: fold nbd config initialization into nbd_alloc_config()
Date: Fri, 17 Nov 2023 00:23:14 +0800
Message-Id: <20231116162316.1740402-2-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116162316.1740402-1-linan666@huaweicloud.com>
References: <20231116162316.1740402-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCnqxHL0lVlgbRFBA--.19869S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXw43urWrAF1xGrWftr15XFb_yoW5ArWkpF
	45AFWUKr48JF43GFWkA3s7WF15twn7GFy7Gry7J3Wvyr93CrWakr1kG34fZFyUJr9rJF15
	JFWrWFWSka4xXrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcx
	kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0uwZ3UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y9MjZXjdRNN.A.AsE.SrdVlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2671
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231116162316.1740402-2-linan666@huaweicloud.com
Resent-Date: Thu, 16 Nov 2023 09:03:14 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

There are no functional changes, make the code cleaner and prepare to
fix null-ptr-dereference while accessing 'nbd->config'.

Signed-off-by: Li Nan <linan122@huawei.com>
---
 drivers/block/nbd.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index df1cd0f718b8..904d01796d37 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1530,17 +1530,20 @@ static int nbd_ioctl(struct block_device *bdev, blk_mode_t mode,
 	return error;
 }
 
-static struct nbd_config *nbd_alloc_config(void)
+static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 {
 	struct nbd_config *config;
 
+	if (WARN_ON(nbd->config))
+		return -EINVAL;
+
 	if (!try_module_get(THIS_MODULE))
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 
 	config = kzalloc(sizeof(struct nbd_config), GFP_NOFS);
 	if (!config) {
 		module_put(THIS_MODULE);
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
 	atomic_set(&config->recv_threads, 0);
@@ -1548,7 +1551,10 @@ static struct nbd_config *nbd_alloc_config(void)
 	init_waitqueue_head(&config->conn_wait);
 	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
-	return config;
+	nbd->config = config;
+	refcount_set(&nbd->config_refs, 1);
+
+	return 0;
 }
 
 static int nbd_open(struct gendisk *disk, blk_mode_t mode)
@@ -1567,21 +1573,17 @@ static int nbd_open(struct gendisk *disk, blk_mode_t mode)
 		goto out;
 	}
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
-		struct nbd_config *config;
-
 		mutex_lock(&nbd->config_lock);
 		if (refcount_inc_not_zero(&nbd->config_refs)) {
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
-		config = nbd_alloc_config();
-		if (IS_ERR(config)) {
-			ret = PTR_ERR(config);
+		ret = nbd_alloc_and_init_config(nbd);
+		if (ret) {
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
-		nbd->config = config;
-		refcount_set(&nbd->config_refs, 1);
+
 		refcount_inc(&nbd->refs);
 		mutex_unlock(&nbd->config_lock);
 		if (max_part)
@@ -1982,22 +1984,17 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		pr_err("nbd%d already in use\n", index);
 		return -EBUSY;
 	}
-	if (WARN_ON(nbd->config)) {
-		mutex_unlock(&nbd->config_lock);
-		nbd_put(nbd);
-		return -EINVAL;
-	}
-	config = nbd_alloc_config();
-	if (IS_ERR(config)) {
+
+	ret = nbd_alloc_and_init_config(nbd);
+	if (ret) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
 		pr_err("couldn't allocate config\n");
-		return PTR_ERR(config);
+		return ret;
 	}
-	nbd->config = config;
-	refcount_set(&nbd->config_refs, 1);
-	set_bit(NBD_RT_BOUND, &config->runtime_flags);
 
+	config = nbd->config;
+	set_bit(NBD_RT_BOUND, &config->runtime_flags);
 	ret = nbd_genl_size_set(info, nbd);
 	if (ret)
 		goto out;
-- 
2.39.2

