Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BC39839F
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:51:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E578206CD; Wed,  2 Jun 2021 07:51:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:51:31 2021
Old-Return-Path: <BATV+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 102AC206CD
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:35:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lv_ojfhvWoXj for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:35:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 922DB206D5
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=myJzdG0UY+YhduciAvl62vV0+eYIWXuf0viapKKEim4=; b=iGVLX51PspxKKCnzMpC4EouJj5
	B2zrb4+pSV9mnMrSg79gkg0MGmfd8cZ1WB50YixRgjFbx4kOwp4juWx6b16UoCxx1LpymNY6Yk0x8
	1nzXicL+0dUmecEKqHWZqBXMyeC2V5zboJkZLT8Z5vqTYJk/8WfYA9rvi3yfvAsJVwtzqljPiu8AS
	Za/PcTal9v5fdMjqkHRd71J1Y7Beckc40vm4RzsUt68TBw5T15mRNRvzTDicRFuks4v90WQ7UfdEb
	6GRv3x0E21udpoMdOjy7ckRjA7wLy9iC+PnSFHrTfG3ucQpfezI0IJkNiWgyB2fdem2B9y0l01OTl
	3C4E0UGA==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlL-0025I2-Rr; Wed, 02 Jun 2021 06:54:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 02/30] blk-mq: improve the blk_mq_init_allocated_queue interface
Date: Wed,  2 Jun 2021 09:53:17 +0300
Message-Id: <20210602065345.355274-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <F5OFQyFT0QC.A.RwD.DiztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1191
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-3-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:51:31 +0000 (UTC)

Don't return the passed in request_queue but a normal error code, and
drop the elevator_init argument in favor of just calling elevator_init_mq
directly from dm-rq.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c           | 36 ++++++++++++++----------------------
 block/blk.h              |  1 -
 block/elevator.c         |  2 +-
 drivers/md/dm-rq.c       |  9 +++------
 include/linux/blk-mq.h   |  5 ++---
 include/linux/elevator.h |  1 +
 6 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index eaacfa963a73..6112741e1ff9 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3115,21 +3115,18 @@ void blk_mq_release(struct request_queue *q)
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata)
 {
-	struct request_queue *uninit_q, *q;
+	struct request_queue *q;
+	int ret;
 
-	uninit_q = blk_alloc_queue(set->numa_node);
-	if (!uninit_q)
+	q = blk_alloc_queue(set->numa_node);
+	if (!q)
 		return ERR_PTR(-ENOMEM);
-	uninit_q->queuedata = queuedata;
-
-	/*
-	 * Initialize the queue without an elevator. device_add_disk() will do
-	 * the initialization.
-	 */
-	q = blk_mq_init_allocated_queue(set, uninit_q, false);
-	if (IS_ERR(q))
-		blk_cleanup_queue(uninit_q);
-
+	q->queuedata = queuedata;
+	ret = blk_mq_init_allocated_queue(set, q);
+	if (ret) {
+		blk_cleanup_queue(q);
+		return ERR_PTR(ret);
+	}
 	return q;
 }
 EXPORT_SYMBOL_GPL(blk_mq_init_queue_data);
@@ -3273,9 +3270,8 @@ static void blk_mq_realloc_hw_ctxs(struct blk_mq_tag_set *set,
 	mutex_unlock(&q->sysfs_lock);
 }
 
-struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q,
-						  bool elevator_init)
+int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
+		struct request_queue *q)
 {
 	/* mark the queue as mq asap */
 	q->mq_ops = set->ops;
@@ -3325,11 +3321,7 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	blk_mq_init_cpu_queues(q, set->nr_hw_queues);
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
-
-	if (elevator_init)
-		elevator_init_mq(q);
-
-	return q;
+	return 0;
 
 err_hctxs:
 	kfree(q->queue_hw_ctx);
@@ -3340,7 +3332,7 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	q->poll_cb = NULL;
 err_exit:
 	q->mq_ops = NULL;
-	return ERR_PTR(-ENOMEM);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL(blk_mq_init_allocated_queue);
 
diff --git a/block/blk.h b/block/blk.h
index 3440142f029b..d3fa47af3607 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -192,7 +192,6 @@ void blk_account_io_done(struct request *req, u64 now);
 
 void blk_insert_flush(struct request *rq);
 
-void elevator_init_mq(struct request_queue *q);
 int elevator_switch_mq(struct request_queue *q,
 			      struct elevator_type *new_e);
 void __elevator_exit(struct request_queue *, struct elevator_queue *);
diff --git a/block/elevator.c b/block/elevator.c
index 440699c28119..06e203426410 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -693,7 +693,7 @@ void elevator_init_mq(struct request_queue *q)
 		elevator_put(e);
 	}
 }
-
+EXPORT_SYMBOL_GPL(elevator_init_mq); /* only for dm-rq */
 
 /*
  * switch to new_e io scheduler. be careful not to introduce deadlocks -
diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 9c3bc3711b33..0dbd48cbdff9 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -530,7 +530,6 @@ static const struct blk_mq_ops dm_mq_ops = {
 
 int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
 {
-	struct request_queue *q;
 	struct dm_target *immutable_tgt;
 	int err;
 
@@ -557,12 +556,10 @@ int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
 	if (err)
 		goto out_kfree_tag_set;
 
-	q = blk_mq_init_allocated_queue(md->tag_set, md->queue, true);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
+	err = blk_mq_init_allocated_queue(md->tag_set, md->queue);
+	if (err)
 		goto out_tag_set;
-	}
-
+	elevator_init_mq(md->queue);
 	return 0;
 
 out_tag_set:
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index bb950fc669ef..73750b2838d2 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -429,9 +429,8 @@ enum {
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
-struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q,
-						  bool elevator_init);
+int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
+		struct request_queue *q);
 struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
 						const struct blk_mq_ops *ops,
 						unsigned int queue_depth,
diff --git a/include/linux/elevator.h b/include/linux/elevator.h
index dcb2f9022c1d..783ecb3cb77a 100644
--- a/include/linux/elevator.h
+++ b/include/linux/elevator.h
@@ -120,6 +120,7 @@ extern void elv_merged_request(struct request_queue *, struct request *,
 extern bool elv_attempt_insert_merge(struct request_queue *, struct request *);
 extern struct request *elv_former_request(struct request_queue *, struct request *);
 extern struct request *elv_latter_request(struct request_queue *, struct request *);
+void elevator_init_mq(struct request_queue *q);
 
 /*
  * io scheduler registration
-- 
2.30.2

