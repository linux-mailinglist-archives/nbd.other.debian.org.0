Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7F7FC7FC
	for <lists+nbd@lfdr.de>; Tue, 28 Nov 2023 22:34:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0C60E20C3D; Tue, 28 Nov 2023 21:34:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 28 21:34:12 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,LDO_WHITELIST,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0ACE520BD5
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Nov 2023 21:17:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.548 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.058, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V_eIPk8ayn63 for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Nov 2023 21:16:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A698420BDA
	for <nbd@other.debian.org>; Tue, 28 Nov 2023 21:16:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8055661924;
	Tue, 28 Nov 2023 21:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBE9C433B7;
	Tue, 28 Nov 2023 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205690;
	bh=NhH1ja/MBrIvZybAaObPl8IYMrcmD7AIH5aLMUelUPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DhXNZJa8EC3Vb6ONsFm8mZnBWpymIbhyBc0WeMWy+ZMcwT3Ku5j5DLBBZFvf6Ap+m
	 ARaUyAhkvG9UxFdkcOQC4tv2tQ2FWFIyLNju5L8JoulvTmyWE9hMj+j8087ma9/Dy6
	 MvO5fqCYHMXXaCBnMn+HKJclUBZ4yM0QEiOvozliTwqtljCO10ZbbOagS8zyWhDN+t
	 LRbdXLMPTPts6nkwKFXN5wowN3AzYQrSGk/Qge/4JMhJyDOn0Ic8YNtzPB4/WRjDbx
	 ummTMU6QgtojZBOh/btnfpiiJwPsdslFAEb8cjrvOP471zedIPDDAC/TL1uh1TerE7
	 81/XMwJ8h99Ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Nan <linan122@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 6.1 10/25] nbd: fold nbd config initialization into nbd_alloc_config()
Date: Tue, 28 Nov 2023 16:07:26 -0500
Message-ID: <20231128210750.875945-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210750.875945-1-sashal@kernel.org>
References: <20231128210750.875945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.64
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0fwBVT8Ru8F.A.2JE.UzlZlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2683
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231128210750.875945-10-sashal@kernel.org
Resent-Date: Tue, 28 Nov 2023 21:34:13 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

[ Upstream commit 1b59860540a4018e8071dc18d4893ec389506b7d ]

There are no functional changes, make the code cleaner and prepare to
fix null-ptr-dereference while accessing 'nbd->config'.

Signed-off-by: Li Nan <linan122@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20231116162316.1740402-2-linan666@huaweicloud.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index e94d2ff6b1223..e70733c76e884 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1530,17 +1530,20 @@ static int nbd_ioctl(struct block_device *bdev, fmode_t mode,
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
 
 static int nbd_open(struct block_device *bdev, fmode_t mode)
@@ -1567,21 +1573,17 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
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
@@ -1990,22 +1992,17 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
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
2.42.0

