Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F063E2826
	for <lists+nbd@lfdr.de>; Fri,  6 Aug 2021 12:09:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6AE3320607; Fri,  6 Aug 2021 10:09:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  6 10:09:22 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A3F5A205E9
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Aug 2021 09:51:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h8pP377gNu4A for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Aug 2021 09:51:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 1005 seconds by postgrey-1.36 at bendel; Fri, 06 Aug 2021 09:51:15 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AED9F205CC
	for <nbd@other.debian.org>; Fri,  6 Aug 2021 09:51:15 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gh0ft1PWwzYlQk;
	Fri,  6 Aug 2021 17:34:14 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 17:34:22 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 6 Aug
 2021 17:34:22 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] nbd: hold tags->lock to prevent access freed request through blk_mq_tag_to_rq()
Date: Fri, 6 Aug 2021 17:44:58 +0800
Message-ID: <20210806094458.2330093-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QwIMphgLRhD.A.3bE.SpQDhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1240
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210806094458.2330093-1-yukuai3@huawei.com
Resent-Date: Fri,  6 Aug 2021 10:09:22 +0000 (UTC)

Our test reported a uaf problem:

Read of size 4 at addr ffff80036b790b54 by task kworker/u9:1/31105

Workqueue: knbd0-recv recv_work
Call trace:
 dump_backtrace+0x0/0x310 arch/arm64/kernel/time.c:78
 show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x144/0x1b4 lib/dump_stack.c:118
 print_address_description+0x68/0x2d0 mm/kasan/report.c:253
 kasan_report_error mm/kasan/report.c:351 [inline]
 kasan_report+0x134/0x2f0 mm/kasan/report.c:409
 check_memory_region_inline mm/kasan/kasan.c:260 [inline]
 __asan_load4+0x88/0xb0 mm/kasan/kasan.c:699
 __read_once_size include/linux/compiler.h:193 [inline]
 blk_mq_rq_state block/blk-mq.h:106 [inline]
 blk_mq_request_started+0x24/0x40 block/blk-mq.c:644
 nbd_read_stat drivers/block/nbd.c:670 [inline]
 recv_work+0x1bc/0x890 drivers/block/nbd.c:749
 process_one_work+0x3ec/0x9e0 kernel/workqueue.c:2147
 worker_thread+0x80/0x9d0 kernel/workqueue.c:2302
 kthread+0x1d8/0x1e0 kernel/kthread.c:255
 ret_from_fork+0x10/0x18 arch/arm64/kernel/entry.S:1174

This is because tags->static_rq can be freed without clearing tags->rq,
Ming Lei had fixed the problem while itering tags, howerver, the problem
still exist in blk_mq_tag_to_rq().

Thus fix the problem by holding tags->lock, so that tags->rq can be
cleared before tags->static_rq is freed.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..a0784d0b89ac 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -712,12 +712,22 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	memcpy(&handle, reply.handle, sizeof(handle));
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
-	if (hwq < nbd->tag_set.nr_hw_queues)
-		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
-				       blk_mq_unique_tag_to_tag(tag));
-	if (!req || !blk_mq_request_started(req)) {
-		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
-			tag, req);
+	if (hwq < nbd->tag_set.nr_hw_queues) {
+		unsigned long flags;
+		struct blk_mq_tags *tags = nbd->tag_set.tags[hwq];
+
+		spin_lock_irqsave(&tags->lock, flags);
+		req = blk_mq_tag_to_rq(tags, blk_mq_unique_tag_to_tag(tag));
+		if (!blk_mq_request_started(req)) {
+			dev_err(disk_to_dev(nbd->disk), "Request not started (%d) %p\n",
+				tag, req);
+			req = NULL;
+		}
+		spin_unlock_irqrestore(&tags->lock, flags);
+	}
+
+	if (!req) {
+		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d)\n", tag);
 		return ERR_PTR(-ENOENT);
 	}
 	trace_nbd_header_received(req, handle);
-- 
2.31.1

