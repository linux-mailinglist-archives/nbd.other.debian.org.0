Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A81409A9
	for <lists+nbd@lfdr.de>; Fri, 17 Jan 2020 13:24:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BCC9E218D6; Fri, 17 Jan 2020 12:24:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 17 12:24:12 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 881F2216C7
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jan 2020 12:06:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id F1jV9Gte9e66 for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jan 2020 12:06:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 941 seconds by postgrey-1.36 at bendel; Fri, 17 Jan 2020 12:06:50 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 84053216A6
	for <nbd@other.debian.org>; Fri, 17 Jan 2020 12:06:50 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A345CB9D861EFE57526B;
	Fri, 17 Jan 2020 19:51:03 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 19:50:54 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <sunke32@huawei.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] nbd: fix potential NULL pointer fault in connect and disconnect process
Date: Fri, 17 Jan 2020 19:50:05 +0800
Message-ID: <20200117115005.37006-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ouu6zcsmiJ.A.uqF.sdaIeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/769
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200117115005.37006-1-sunke32@huawei.com
Resent-Date: Fri, 17 Jan 2020 12:24:12 +0000 (UTC)

Connect and disconnect a nbd device repeatedly, will cause
NULL pointer fault.

It will appear by the steps:
1. Connect the nbd device and disconnect it, but now nbd device
   is not disconnected totally.
2. Connect the same nbd device again immediately, it will fail
   in nbd_start_device with a EBUSY return value.
3. Wait a second to make sure the last config_refs is reduced
   and run nbd_config_put to disconnect the nbd device totally.
4. Start another process to open the nbd_device, config_refs
   will increase and at the same time disconnect it.

To fix it, add a NBD_HAS_STARTED flag. Set it in nbd_start_device_ioctl
and nbd_genl_connect if nbd device is started successfully.
Clear it in nbd_config_put. Test it in nbd_genl_disconnect and
nbd_genl_reconfigure.

Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/block/nbd.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b4607dd96185..ddd364e208ab 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -83,6 +83,7 @@ struct link_dead_args {
 
 #define NBD_DESTROY_ON_DISCONNECT	0
 #define NBD_DISCONNECT_REQUESTED	1
+#define NBD_HAS_STARTED				2
 
 struct nbd_config {
 	u32 flags;
@@ -1215,6 +1216,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 		nbd->disk->queue->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
 		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, nbd->disk->queue);
+		clear_bit(NBD_HAS_STARTED, &nbd->flags);
 
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
@@ -1290,6 +1292,8 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 	ret = nbd_start_device(nbd);
 	if (ret)
 		return ret;
+	else
+		set_bit(NBD_HAS_STARTED, &nbd->flags);
 
 	if (max_part)
 		bdev->bd_invalidated = 1;
@@ -1961,6 +1965,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	mutex_unlock(&nbd->config_lock);
 	if (!ret) {
 		set_bit(NBD_RT_HAS_CONFIG_REF, &config->runtime_flags);
+		set_bit(NBD_HAS_STARTED, &nbd->flags);
 		refcount_inc(&nbd->config_refs);
 		nbd_connect_reply(info, nbd->index);
 	}
@@ -2008,6 +2013,14 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 		       index);
 		return -EINVAL;
 	}
+
+	if (!test_bit(NBD_HAS_STARTED, &nbd->flags)) {
+		mutex_unlock(&nbd_index_mutex);
+		printk(KERN_ERR "nbd: device at index %d failed to start\n",
+		       index);
+		return -EBUSY;
+	}
+
 	if (!refcount_inc_not_zero(&nbd->refs)) {
 		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: device at index %d is going down\n",
@@ -2049,6 +2062,14 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 		       index);
 		return -EINVAL;
 	}
+
+	if (!test_bit(NBD_HAS_STARTED, &nbd->flags)) {
+		mutex_unlock(&nbd_index_mutex);
+		printk(KERN_ERR "nbd: device at index %d failed to start\n",
+		       index);
+		return -EBUSY;
+	}
+
 	if (!refcount_inc_not_zero(&nbd->refs)) {
 		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: device at index %d is going down\n",
-- 
2.17.2

