Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989D74A978
	for <lists+nbd@lfdr.de>; Fri,  7 Jul 2023 05:51:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4EC6C20503; Fri,  7 Jul 2023 03:51:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul  7 03:51:40 2023
Old-Return-Path: <zhongjinghua@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RDNS_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4C79920541
	for <lists-other-nbd@bendel.debian.org>; Fri,  7 Jul 2023 03:36:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.097 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RDNS_NONE=0.793, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lpFLt8DiwiZi for <lists-other-nbd@bendel.debian.org>;
	Fri,  7 Jul 2023 03:35:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C33B72053A
	for <nbd@other.debian.org>; Fri,  7 Jul 2023 03:35:53 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Qxz9q21NBz4f3nyG
	for <nbd@other.debian.org>; Fri,  7 Jul 2023 11:18:07 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgD3mp7vg6dk0X+NNQ--.406S6;
	Fri, 07 Jul 2023 11:18:09 +0800 (CST)
From: Zhong Jinghua <zhongjinghua@huaweicloud.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	zhongjinghua@huaweicloud.com,
	yi.zhang@huawei.com,
	yukuai3@huawei.com
Subject: [PATCH -next 2/3] nbd: factor out a helper to get nbd_config without holding 'config_lock'
Date: Fri,  7 Jul 2023 11:15:35 +0800
Message-Id: <20230707031536.666482-3-zhongjinghua@huaweicloud.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230707031536.666482-1-zhongjinghua@huaweicloud.com>
References: <20230707031536.666482-1-zhongjinghua@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgD3mp7vg6dk0X+NNQ--.406S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1xJr47Cr45CF45Ar1kZrb_yoW5tFykpF
	4UAFW5KrWUGF45uFWv9397WFnxtwn2gFyxGry7G3ZYvF9xArWakF1kK34xAa17Gr97JF45
	JFWrWFySka47KrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU=
X-CM-SenderInfo: x2kr0wpmlqwxtxd6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dQ3ckQYSTXD.A.BrD.Mv4pkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2565
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230707031536.666482-3-zhongjinghua@huaweicloud.com
Resent-Date: Fri,  7 Jul 2023 03:51:40 +0000 (UTC)

From: Zhong Jinghua <zhongjinghua@huawei.com>

There are no functional changes, just to make code cleaner and prepare
to fix null-ptr-dereference while accessing 'nbd->config'.

Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
---
 drivers/block/nbd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index cd6d78914954..7186a9a49445 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -393,6 +393,14 @@ static u32 req_to_nbd_cmd_type(struct request *req)
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
@@ -407,13 +415,13 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
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
@@ -975,12 +983,12 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
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
@@ -1556,6 +1564,7 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 static int nbd_open(struct block_device *bdev, fmode_t mode)
 {
 	struct nbd_device *nbd;
+	struct nbd_config *config;
 	int ret = 0;
 
 	mutex_lock(&nbd_index_mutex);
@@ -1568,7 +1577,9 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
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
@@ -1584,7 +1595,7 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 		mutex_unlock(&nbd->config_lock);
 		if (max_part)
 			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
-	} else if (nbd_disconnected(nbd->config)) {
+	} else if (nbd_disconnected(config)) {
 		if (max_part)
 			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
 	}
@@ -2194,7 +2205,8 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 	mutex_unlock(&nbd_index_mutex);
 
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
+	config = nbd_get_config_unlocked(nbd);
+	if (!config) {
 		dev_err(nbd_to_dev(nbd),
 			"not configured, cannot reconfigure\n");
 		nbd_put(nbd);
@@ -2202,7 +2214,6 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	mutex_lock(&nbd->config_lock);
-	config = nbd->config;
 	if (!test_bit(NBD_RT_BOUND, &config->runtime_flags) ||
 	    !nbd->pid) {
 		dev_err(nbd_to_dev(nbd),
-- 
2.31.1

