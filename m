Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C719A7FC7FB
	for <lists+nbd@lfdr.de>; Tue, 28 Nov 2023 22:33:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A8C0320C3D; Tue, 28 Nov 2023 21:33:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 28 21:33:58 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDO_WHITELIST,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C6B9420BE0
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Nov 2023 21:17:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.468 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.058, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QLzeQCyOjV0T for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Nov 2023 21:16:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 616 seconds by postgrey-1.36 at bendel; Tue, 28 Nov 2023 21:16:58 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A5F3F20BD5
	for <nbd@other.debian.org>; Tue, 28 Nov 2023 21:16:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D7B360C1B;
	Tue, 28 Nov 2023 21:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B61C433C9;
	Tue, 28 Nov 2023 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205599;
	bh=ldiK7KuLUTDjHoUTrRv5GR28hpJAs7FlnaeFLTHn/uM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AD2hPT5xx2Bwf6lZlp/c+fcO5NUxuvSWifwH71NTsvBXV8SGI3QF+ZVIw385tN+WI
	 aJBy643deBaLZKcsBB8o5z/1Qld5TCdV9KdYiHndaa8HPcNqhKfUVM5BoM79TqFeke
	 cUqcs8SqO0AS4Z5Sn4tMduwljRaEXw359x24BzPDu7EM1k6QnX9dygDV8FTvwDWDKD
	 USrFSp2YzQNcQ6f8D6Qmd+foMCJ6YZN1cans8E1I5IcC6qVkpZDFJ0qQM/xRu4UBvP
	 jEvUTdjJX4aJKLlP1k5dfi8+XNYu/RTnOTzWxOJgPsQqzeQEcWv9whGuZE4U+WLeQ1
	 +KCLRkhHlVoUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Nan <linan122@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 6.6 12/40] nbd: factor out a helper to get nbd_config without holding 'config_lock'
Date: Tue, 28 Nov 2023 16:05:18 -0500
Message-ID: <20231128210615.875085-12-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9j6CxXFLLTJ.A.mDE.GzlZlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2682
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231128210615.875085-12-sashal@kernel.org
Resent-Date: Tue, 28 Nov 2023 21:33:58 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

[ Upstream commit 3123ac77923341774ca3ad1196ad20bb0732bf70 ]

There are no functional changes, just to make code cleaner and prepare
to fix null-ptr-dereference while accessing 'nbd->config'.

Signed-off-by: Li Nan <linan122@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20231116162316.1740402-3-linan666@huaweicloud.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 02f844832d912..daaf8805e876c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -395,6 +395,14 @@ static u32 req_to_nbd_cmd_type(struct request *req)
 	}
 }
 
+static struct nbd_config *nbd_get_config_unlocked(struct nbd_device *nbd)
+{
+	if (refcount_inc_not_zero(&nbd->config_refs))
+		return nbd->config;
+
+	return NULL;
+}
+
 static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 {
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
@@ -409,13 +417,13 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 		return BLK_EH_DONE;
 	}
 
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		cmd->status = BLK_STS_TIMEOUT;
 		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 		mutex_unlock(&cmd->lock);
 		goto done;
 	}
-	config = nbd->config;
 
 	if (config->num_connections > 1 ||
 	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
@@ -977,12 +985,12 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	struct nbd_sock *nsock;
 	int ret;
 
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
 				    "Socks array is empty\n");
 		return -EINVAL;
 	}
-	config = nbd->config;
 
 	if (index >= config->num_connections) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
@@ -1560,6 +1568,7 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 static int nbd_open(struct gendisk *disk, blk_mode_t mode)
 {
 	struct nbd_device *nbd;
+	struct nbd_config *config;
 	int ret = 0;
 
 	mutex_lock(&nbd_index_mutex);
@@ -1572,7 +1581,9 @@ static int nbd_open(struct gendisk *disk, blk_mode_t mode)
 		ret = -ENXIO;
 		goto out;
 	}
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		mutex_lock(&nbd->config_lock);
 		if (refcount_inc_not_zero(&nbd->config_refs)) {
 			mutex_unlock(&nbd->config_lock);
@@ -1588,7 +1599,7 @@ static int nbd_open(struct gendisk *disk, blk_mode_t mode)
 		mutex_unlock(&nbd->config_lock);
 		if (max_part)
 			set_bit(GD_NEED_PART_SCAN, &disk->state);
-	} else if (nbd_disconnected(nbd->config)) {
+	} else if (nbd_disconnected(config)) {
 		if (max_part)
 			set_bit(GD_NEED_PART_SCAN, &disk->state);
 	}
@@ -2205,7 +2216,8 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 	mutex_unlock(&nbd_index_mutex);
 
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		dev_err(nbd_to_dev(nbd),
 			"not configured, cannot reconfigure\n");
 		nbd_put(nbd);
@@ -2213,7 +2225,6 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	mutex_lock(&nbd->config_lock);
-	config = nbd->config;
 	if (!test_bit(NBD_RT_BOUND, &config->runtime_flags) ||
 	    !nbd->pid) {
 		dev_err(nbd_to_dev(nbd),
-- 
2.42.0

