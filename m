Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAD402ABE
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 16:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B9BAB20AA2; Tue,  7 Sep 2021 14:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 14:27:09 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 76C95209AE
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 14:11:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id laOcwuDcAZLz for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 14:11:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D2F142099F
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 14:11:24 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H3mmw6Fl4zQtrf;
	Tue,  7 Sep 2021 21:48:00 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 21:52:01 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Tue, 7 Sep
 2021 21:52:00 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v4 1/6] blk-mq: export two symbols to get request by tag
Date: Tue, 7 Sep 2021 22:01:49 +0800
Message-ID: <20210907140154.2134091-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907140154.2134091-1-yukuai3@huawei.com>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
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
Resent-Message-ID: <BjJab37PqtG.A.i2E.9a3NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1404
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210907140154.2134091-2-yukuai3@huawei.com
Resent-Date: Tue,  7 Sep 2021 14:27:09 +0000 (UTC)

nbd has a defect that blk_mq_tag_to_rq() might return a freed
request in nbd_read_stat(). We need a new mechanism if we want to
fix this in nbd driver, which is rather complicated.

Thus use blk_mq_find_and_get_req() to replace blk_mq_tag_to_rq(),
which can make sure the returned request is not freed, and then we
can do more checking while 'cmd->lock' is hold.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/blk-mq-tag.c     | 5 +++--
 block/blk-mq.c         | 1 +
 include/linux/blk-mq.h | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 86f87346232a..b4f66b75b4d1 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -200,8 +200,8 @@ struct bt_iter_data {
 	bool reserved;
 };
 
-static struct request *blk_mq_find_and_get_req(struct blk_mq_tags *tags,
-		unsigned int bitnr)
+struct request *blk_mq_find_and_get_req(struct blk_mq_tags *tags,
+					unsigned int bitnr)
 {
 	struct request *rq;
 	unsigned long flags;
@@ -213,6 +213,7 @@ static struct request *blk_mq_find_and_get_req(struct blk_mq_tags *tags,
 	spin_unlock_irqrestore(&tags->lock, flags);
 	return rq;
 }
+EXPORT_SYMBOL(blk_mq_find_and_get_req);
 
 static bool bt_iter(struct sbitmap *bitmap, unsigned int bitnr, void *data)
 {
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 08626cb0534c..5113aa3788a2 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -916,6 +916,7 @@ void blk_mq_put_rq_ref(struct request *rq)
 	else if (refcount_dec_and_test(&rq->ref))
 		__blk_mq_free_request(rq);
 }
+EXPORT_SYMBOL(blk_mq_put_rq_ref);
 
 static bool blk_mq_check_expired(struct blk_mq_hw_ctx *hctx,
 		struct request *rq, void *priv, bool reserved)
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 13ba1861e688..03e02990609d 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -637,4 +637,7 @@ blk_qc_t blk_mq_submit_bio(struct bio *bio);
 void blk_mq_hctx_set_fq_lock_class(struct blk_mq_hw_ctx *hctx,
 		struct lock_class_key *key);
 
+void blk_mq_put_rq_ref(struct request *rq);
+struct request *blk_mq_find_and_get_req(struct blk_mq_tags *tags,
+					unsigned int bitnr);
 #endif
-- 
2.31.1

