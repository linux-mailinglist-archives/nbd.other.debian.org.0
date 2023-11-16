Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 851197EDD50
	for <lists+nbd@lfdr.de>; Thu, 16 Nov 2023 10:03:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6875720625; Thu, 16 Nov 2023 09:03:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 16 09:03:57 2023
Old-Return-Path: <linan666@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DATE_IN_FUTURE_06_12,FOURLA,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CF14120616
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Nov 2023 08:46:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.036 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DATE_IN_FUTURE_06_12=1.947, FOURLA=0.1,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7q1oZk0nndNG for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Nov 2023 08:46:03 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4A29120625
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 08:46:03 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SWCqd1f6dz4f3lw6
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:29:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 92AD51A0175
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:29:02 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxHL0lVlgbRFBA--.19869S6;
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
Subject: [PATCH 2/3] nbd: factor out a helper to get nbd_config without holding 'config_lock'
Date: Fri, 17 Nov 2023 00:23:15 +0800
Message-Id: <20231116162316.1740402-3-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116162316.1740402-1-linan666@huaweicloud.com>
References: <20231116162316.1740402-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCnqxHL0lVlgbRFBA--.19869S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZr17AF1kJr15Xr1kuFW3ZFb_yoW5tryrpF
	4UAFW5Kr4UGF45uFWvv397WF15twn7WFyxGry7G3ZYvF9xArWakF1kK343XF17Gr97JF13
	JFWrWFySka4xtrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK
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
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnItC3UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y_QOAthFQnH.A.AGF.9rdVlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2674
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231116162316.1740402-3-linan666@huaweicloud.com
Resent-Date: Thu, 16 Nov 2023 09:03:57 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

There are no functional changes, just to make code cleaner and prepare
to fix null-ptr-dereference while accessing 'nbd->config'.

Signed-off-by: Li Nan <linan122@huawei.com>
---
 drivers/block/nbd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 904d01796d37..1b9ee96d3b8a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -396,6 +396,14 @@ static u32 req_to_nbd_cmd_type(struct request *req)
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
@@ -410,13 +418,13 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
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
@@ -978,12 +986,12 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
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
@@ -2197,7 +2208,8 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 	mutex_unlock(&nbd_index_mutex);
 
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		dev_err(nbd_to_dev(nbd),
 			"not configured, cannot reconfigure\n");
 		nbd_put(nbd);
@@ -2205,7 +2217,6 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	mutex_lock(&nbd->config_lock);
-	config = nbd->config;
 	if (!test_bit(NBD_RT_BOUND, &config->runtime_flags) ||
 	    !nbd->pid) {
 		dev_err(nbd_to_dev(nbd),
-- 
2.39.2

