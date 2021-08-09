Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5D3E3E32
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 05:15:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E98C5203C4; Mon,  9 Aug 2021 03:15:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 03:15:31 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 32E60203C1
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 02:58:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zlKpmV5rcGni for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 02:58:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 25F98203B4
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 02:58:50 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GjgdT2VTyz84Dk;
	Mon,  9 Aug 2021 10:53:49 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 10:58:45 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 9 Aug
 2021 10:58:44 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <bvanassche@acm.org>,
	<ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 1/2] blk-mq: add a new interface to get request by tag
Date: Mon, 9 Aug 2021 11:09:26 +0800
Message-ID: <20210809030927.1946162-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809030927.1946162-1-yukuai3@huawei.com>
References: <20210809030927.1946162-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IkIqglPpoEP.A.0YG.T3JEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1254
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210809030927.1946162-2-yukuai3@huawei.com
Resent-Date: Mon,  9 Aug 2021 03:15:31 +0000 (UTC)

Ming Lei had fixed the request uaf while iterating tags in
commit bd63141d585b ("blk-mq: clear stale request in tags->rq[] before
freeing one request pool"). However, some drivers are still using
blk_mq_tag_to_rq(), which access request by tag directly.

Thus add a new interface for such drivers to avoid request uaf.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/blk-mq-tag.c     | 33 +++++++++++++++++++++++++++++++++
 block/blk-mq.c         |  1 +
 block/blk-mq.h         |  1 -
 include/linux/blk-mq.h |  3 +++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 86f87346232a..7921bd2019df 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -652,3 +652,36 @@ u32 blk_mq_unique_tag(struct request *rq)
 		(rq->tag & BLK_MQ_UNIQUE_TAG_MASK);
 }
 EXPORT_SYMBOL(blk_mq_unique_tag);
+
+/**
+ * blk_mq_get_rq_by_tag - if the request that is represented by the tag is
+ * not idle, increment it's reference and then return it. Otherwise return
+ * NULL.
+ */
+struct request *blk_mq_get_rq_by_tag(struct blk_mq_tags *tags,
+				     unsigned int tag)
+{
+	unsigned long flags;
+	struct request *rq;
+
+	/* hold lock to prevent accessing freed request by tag */
+	spin_lock_irqsave(&tags->lock, flags);
+	rq = blk_mq_tag_to_rq(tags, tag);
+	if (!rq)
+		goto out_unlock;
+
+	if (!refcount_inc_not_zero(&rq->ref)) {
+		rq = NULL;
+		goto out_unlock;
+	}
+
+	if (!blk_mq_request_started(rq)) {
+		blk_mq_put_rq_ref(rq);
+		rq = NULL;
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&tags->lock, flags);
+	return rq;
+}
+EXPORT_SYMBOL(blk_mq_get_rq_by_tag);
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 495f508c6300..7d0bd3809336 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -916,6 +916,7 @@ void blk_mq_put_rq_ref(struct request *rq)
 	else if (refcount_dec_and_test(&rq->ref))
 		__blk_mq_free_request(rq);
 }
+EXPORT_SYMBOL_GPL(blk_mq_put_rq_ref);
 
 static bool blk_mq_check_expired(struct blk_mq_hw_ctx *hctx,
 		struct request *rq, void *priv, bool reserved)
diff --git a/block/blk-mq.h b/block/blk-mq.h
index d08779f77a26..20ef743a3ff6 100644
--- a/block/blk-mq.h
+++ b/block/blk-mq.h
@@ -47,7 +47,6 @@ void blk_mq_add_to_requeue_list(struct request *rq, bool at_head,
 void blk_mq_flush_busy_ctxs(struct blk_mq_hw_ctx *hctx, struct list_head *list);
 struct request *blk_mq_dequeue_from_ctx(struct blk_mq_hw_ctx *hctx,
 					struct blk_mq_ctx *start);
-void blk_mq_put_rq_ref(struct request *rq);
 
 /*
  * Internal helpers for allocating/freeing the request map
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 1d18447ebebc..d460e5e2c07a 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -635,4 +635,7 @@ blk_qc_t blk_mq_submit_bio(struct bio *bio);
 void blk_mq_hctx_set_fq_lock_class(struct blk_mq_hw_ctx *hctx,
 		struct lock_class_key *key);
 
+struct request *blk_mq_get_rq_by_tag(struct blk_mq_tags *tags,
+		unsigned int tag);
+void blk_mq_put_rq_ref(struct request *rq);
 #endif
-- 
2.31.1

