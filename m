Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A33DFA06E1C
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 07:15:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 87734205BE; Thu,  9 Jan 2025 06:15:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 06:15:57 2025
Old-Return-Path: <BATV+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F2F820594
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 05:58:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Rl69XrilIGf1 for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 05:58:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B4B46205BB
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 05:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=L1KYitiaLtdyne71sYKztm9FqgieLzzoa0AoCbHbX38=; b=b6F1VeDrf3hOocBAKDwPfAhuYc
	Q1NtSz/vy3f/6qMYaPJaD1TdOocGRXyCy4vx2IaYoeb/ZT/rHiQtAGnueX/4m00IIroYgVcK9+ita
	KsaiV+xbJjQE2E/qYNUqMQ+EmAKF6jssXpYuZq310lSz9Ij7QZgLg3fwUBmKXRmd2DUn3nRBmroUy
	GMG6y+lvYANPCJN2r3G5QldQUSTgGsyj44rztOJzD7wcg8duUYfY1/6/nJIwsHNTW/dg/l+YMo2hV
	V3dqXV9K6lBPj+OPRJUcE6iWCIzofIhjxuh3wFI/xToDS53IubhtZPbQgPLtVhfVV1naQMcnC8gyQ
	bc55TwWA==;
Received: from 2a02-8389-2341-5b80-ddeb-cdec-70b9-e2f0.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:ddeb:cdec:70b9:e2f0] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlYp-0000000ArG4-3Hi1;
	Thu, 09 Jan 2025 05:58:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH 04/11] block: don't update BLK_FEAT_POLL in __blk_mq_update_nr_hw_queues
Date: Thu,  9 Jan 2025 06:57:25 +0100
Message-ID: <20250109055810.1402918-5-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109055810.1402918-1-hch@lst.de>
References: <20250109055810.1402918-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bz_MkuD6LyK.A.0GhN.dm2fnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3308
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250109055810.1402918-5-hch@lst.de
Resent-Date: Thu,  9 Jan 2025 06:15:57 +0000 (UTC)

When __blk_mq_update_nr_hw_queues changes the number of tag sets, it
might have to disable poll queues.  Currently it does so by adjusting
the BLK_FEAT_POLL, which is a bit against the intent of features that
describe hardware / driver capabilities, but more importantly causes
nasty lock order problems with the broadly held freeze when updating the
number of hardware queues and the limits lock.  Fix this by leaving
BLK_FEAT_POLL alone, and instead check for the number of poll queues in
the bio submission and poll handlers.  While this adds extra work to the
fast path, the variables are in cache lines used by these operations
anyway, so it should be cheap enough.

Fixes: 8023e144f9d6 ("block: move the poll flag to queue_limits")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-core.c  |  7 +++----
 block/blk-mq.c    | 26 +++++---------------------
 block/blk-mq.h    |  6 ++++++
 block/blk-sysfs.c |  9 ++++++++-
 4 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 6309b3f5a89d..32fb28a6372c 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -951,14 +951,13 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
 	 */
 	if (!percpu_ref_tryget(&q->q_usage_counter))
 		return 0;
-	if (!(q->limits.features & BLK_FEAT_POLL)) {
-		ret = 0;
-	} else if (queue_is_mq(q)) {
+	if (queue_is_mq(q)) {
 		ret = blk_mq_poll(q, cookie, iob, flags);
 	} else {
 		struct gendisk *disk = q->disk;
 
-		if (disk && disk->fops->poll_bio)
+		if ((q->limits.features & BLK_FEAT_POLL) && disk &&
+		    disk->fops->poll_bio)
 			ret = disk->fops->poll_bio(bio, iob, flags);
 	}
 	blk_queue_exit(q);
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 02c9232a8fff..655dcc16db76 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3105,8 +3105,7 @@ void blk_mq_submit_bio(struct bio *bio)
 		goto queue_exit;
 	}
 
-	if ((bio->bi_opf & REQ_POLLED) &&
-	    !(q->limits.features & BLK_FEAT_POLL)) {
+	if ((bio->bi_opf & REQ_POLLED) && !blk_mq_can_poll(q)) {
 		bio->bi_status = BLK_STS_NOTSUPP;
 		bio_endio(bio);
 		goto queue_exit;
@@ -4328,12 +4327,6 @@ void blk_mq_release(struct request_queue *q)
 	blk_mq_sysfs_deinit(q);
 }
 
-static bool blk_mq_can_poll(struct blk_mq_tag_set *set)
-{
-	return set->nr_maps > HCTX_TYPE_POLL &&
-		set->map[HCTX_TYPE_POLL].nr_queues;
-}
-
 struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 		struct queue_limits *lim, void *queuedata)
 {
@@ -4344,7 +4337,7 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 	if (!lim)
 		lim = &default_lim;
 	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
-	if (blk_mq_can_poll(set))
+	if (set->nr_maps > HCTX_TYPE_POLL)
 		lim->features |= BLK_FEAT_POLL;
 
 	q = blk_alloc_queue(lim, set->numa_node);
@@ -5032,8 +5025,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 fallback:
 	blk_mq_update_queue_map(set);
 	list_for_each_entry(q, &set->tag_list, tag_set_list) {
-		struct queue_limits lim;
-
 		blk_mq_realloc_hw_ctxs(set, q);
 
 		if (q->nr_hw_queues != set->nr_hw_queues) {
@@ -5047,13 +5038,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 			set->nr_hw_queues = prev_nr_hw_queues;
 			goto fallback;
 		}
-		lim = queue_limits_start_update(q);
-		if (blk_mq_can_poll(set))
-			lim.features |= BLK_FEAT_POLL;
-		else
-			lim.features &= ~BLK_FEAT_POLL;
-		if (queue_limits_commit_update(q, &lim) < 0)
-			pr_warn("updating the poll flag failed\n");
 		blk_mq_map_swqueue(q);
 	}
 
@@ -5113,9 +5097,9 @@ static int blk_hctx_poll(struct request_queue *q, struct blk_mq_hw_ctx *hctx,
 int blk_mq_poll(struct request_queue *q, blk_qc_t cookie,
 		struct io_comp_batch *iob, unsigned int flags)
 {
-	struct blk_mq_hw_ctx *hctx = xa_load(&q->hctx_table, cookie);
-
-	return blk_hctx_poll(q, hctx, iob, flags);
+	if (!blk_mq_can_poll(q))
+		return 0;
+	return blk_hctx_poll(q, xa_load(&q->hctx_table, cookie), iob, flags);
 }
 
 int blk_rq_poll(struct request *rq, struct io_comp_batch *iob,
diff --git a/block/blk-mq.h b/block/blk-mq.h
index c872bbbe6411..44979e92b79f 100644
--- a/block/blk-mq.h
+++ b/block/blk-mq.h
@@ -448,4 +448,10 @@ do {								\
 #define blk_mq_run_dispatch_ops(q, dispatch_ops)		\
 	__blk_mq_run_dispatch_ops(q, true, dispatch_ops)	\
 
+static inline bool blk_mq_can_poll(struct request_queue *q)
+{
+	return (q->limits.features & BLK_FEAT_POLL) &&
+		q->tag_set->map[HCTX_TYPE_POLL].nr_queues;
+}
+
 #endif
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 767598e719ab..e9f1c82b2f3e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -245,10 +245,17 @@ static ssize_t queue_##_name##_show(struct gendisk *disk, char *page)	\
 		!!(disk->queue->limits.features & _feature));		\
 }
 
-QUEUE_SYSFS_FEATURE_SHOW(poll, BLK_FEAT_POLL);
 QUEUE_SYSFS_FEATURE_SHOW(fua, BLK_FEAT_FUA);
 QUEUE_SYSFS_FEATURE_SHOW(dax, BLK_FEAT_DAX);
 
+static ssize_t queue_poll_show(struct gendisk *disk, char *page)
+{
+	if (queue_is_mq(disk->queue))
+		return sysfs_emit(page, "%u\n", blk_mq_can_poll(disk->queue));
+	return sysfs_emit(page, "%u\n",
+		!!(disk->queue->limits.features & BLK_FEAT_POLL));
+}
+
 static ssize_t queue_zoned_show(struct gendisk *disk, char *page)
 {
 	if (blk_queue_is_zoned(disk->queue))
-- 
2.45.2

