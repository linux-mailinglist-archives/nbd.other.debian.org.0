Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 501953E3814
	for <lists+nbd@lfdr.de>; Sun,  8 Aug 2021 05:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3530520426; Sun,  8 Aug 2021 03:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  8 03:24:09 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5C8CB2041D
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Aug 2021 03:07:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id madX-ic1slN6 for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Aug 2021 03:07:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0CD672040E
	for <nbd@other.debian.org>; Sun,  8 Aug 2021 03:07:13 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gj3z645vvzYlWZ;
	Sun,  8 Aug 2021 11:06:58 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 8 Aug 2021 11:07:09 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 8 Aug
 2021 11:07:08 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/2] blk-mq: add two interfaces to lock/unlock blk_mq_tags->lock
Date: Sun, 8 Aug 2021 11:17:51 +0800
Message-ID: <20210808031752.579882-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808031752.579882-1-yukuai3@huawei.com>
References: <20210808031752.579882-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <84fQ8CxwRLC.A.RXH.Z50DhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1247
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210808031752.579882-2-yukuai3@huawei.com
Resent-Date: Sun,  8 Aug 2021 03:24:09 +0000 (UTC)

Ming Lei had fixed the request UAF while iterating tags, however
some drivers is calling blk_mq_tag_to_rq() directly to get request
through tag. So the problem might still exist since that
blk_mq_tags->lock should be held.

Thus add blk_mq_tags_lock() and blk_mq_tags_unlock() so that drivers
can lock and unlock blk_mq_tags->lock if they are not sure that the
request is valid.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/blk-mq-tag.c     | 12 ++++++++++++
 include/linux/blk-mq.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 86f87346232a..388d447c993a 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -652,3 +652,15 @@ u32 blk_mq_unique_tag(struct request *rq)
 		(rq->tag & BLK_MQ_UNIQUE_TAG_MASK);
 }
 EXPORT_SYMBOL(blk_mq_unique_tag);
+
+void blk_mq_tags_lock(struct blk_mq_tags *tags, unsigned long *flags)
+{
+	spin_lock_irqsave(&tags->lock, *flags);
+}
+EXPORT_SYMBOL(blk_mq_tags_lock);
+
+void blk_mq_tags_unlock(struct blk_mq_tags *tags, unsigned long *flags)
+{
+	spin_unlock_irqrestore(&tags->lock, *flags);
+}
+EXPORT_SYMBOL(blk_mq_tags_unlock);
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 1d18447ebebc..b4bad4d6a3a8 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -635,4 +635,6 @@ blk_qc_t blk_mq_submit_bio(struct bio *bio);
 void blk_mq_hctx_set_fq_lock_class(struct blk_mq_hw_ctx *hctx,
 		struct lock_class_key *key);
 
+void blk_mq_tags_lock(struct blk_mq_tags *tags, unsigned long *flags);
+void blk_mq_tags_unlock(struct blk_mq_tags *tags, unsigned long *flags);
 #endif
-- 
2.31.1

