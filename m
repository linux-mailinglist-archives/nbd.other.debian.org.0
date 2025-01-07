Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1899A03834
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 07:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C85FF206EA; Tue,  7 Jan 2025 06:54:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 06:54:45 2025
Old-Return-Path: <BATV+ca79fa4415f544dfc9f5+7807+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6E54820598
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 06:31:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kw8ZTWhHDm4M for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 06:31:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1701D20684
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 06:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=td9hXTRm3bIkt4nDSZFirDvnCCVcnWUnxIQRddOHupE=; b=n2iN6rsN9kQji3Ytgvqk1+j8fv
	APZ4d715CYM4l44UrYft9K7Ei3RG2I4aKt7azWRNqHWJqJ7TyKa/kMV2ai8bjW2C3W1LaJT1/9h7m
	VRdtd8VGpNL4sLB6JC7jG0/dHbYcNe/Uz/+DLAgnwXxRCUA2YZFO97LZIAGlhdfpA80EqKIiFiNvo
	jgoXbYGP+XdSPQD1KAZUtaCGf4CTB2YtdKElxDAJO1i+Myzj5+KQO+P20l17KxTeJ0yjIdH6GGKOL
	DOx+UqJHcYywf8VJV8aHSzt5BeLgN3oO779GENncgJbxph92Y6Jnq9ljGT9TpfekXax6okmUhuFjK
	kAg9vjdQ==;
Received: from 2a02-8389-2341-5b80-d467-d75d-35bf-0eb6.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d467:d75d:35bf:eb6] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tV37j-00000003ds7-1Qz0;
	Tue, 07 Jan 2025 06:31:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 3/8] block: don't update BLK_FEAT_POLL in __blk_mq_update_nr_hw_queues
Date: Tue,  7 Jan 2025 07:30:35 +0100
Message-ID: <20250107063120.1011593-4-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107063120.1011593-1-hch@lst.de>
References: <20250107063120.1011593-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ohe0yS6upAC.A.kk1E.1-MfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3238
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107063120.1011593-4-hch@lst.de
Resent-Date: Tue,  7 Jan 2025 06:54:45 +0000 (UTC)

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
---
 block/blk-core.c | 17 ++++++++++++++---
 block/blk-mq.c   | 17 +----------------
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 666efe8fa202..bd5bec843d37 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -753,6 +753,18 @@ static blk_status_t blk_validate_atomic_write_op_size(struct request_queue *q,
 	return BLK_STS_OK;
 }
 
+static bool bdev_can_poll(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (!(q->limits.features & BLK_FEAT_POLL))
+		return false;
+
+	if (queue_is_mq(q))
+		return q->tag_set->map[HCTX_TYPE_POLL].nr_queues;
+	return true;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -805,8 +817,7 @@ void submit_bio_noacct(struct bio *bio)
 		}
 	}
 
-	if (!(q->limits.features & BLK_FEAT_POLL) &&
-			(bio->bi_opf & REQ_POLLED)) {
+	if ((bio->bi_opf & REQ_POLLED) && !bdev_can_poll(bdev)) {
 		bio_clear_polled(bio);
 		goto not_supported;
 	}
@@ -935,7 +946,7 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
 		return 0;
 
 	q = bdev_get_queue(bdev);
-	if (cookie == BLK_QC_T_NONE || !(q->limits.features & BLK_FEAT_POLL))
+	if (cookie == BLK_QC_T_NONE || !bdev_can_poll(bdev))
 		return 0;
 
 	blk_flush_plug(current->plug, false);
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 2e6132f778fd..f795d81b6b38 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4320,12 +4320,6 @@ void blk_mq_release(struct request_queue *q)
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
@@ -4336,7 +4330,7 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
 	if (!lim)
 		lim = &default_lim;
 	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
-	if (blk_mq_can_poll(set))
+	if (set->nr_maps > HCTX_TYPE_POLL)
 		lim->features |= BLK_FEAT_POLL;
 
 	q = blk_alloc_queue(lim, set->numa_node);
@@ -5024,8 +5018,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 fallback:
 	blk_mq_update_queue_map(set);
 	list_for_each_entry(q, &set->tag_list, tag_set_list) {
-		struct queue_limits lim;
-
 		blk_mq_realloc_hw_ctxs(set, q);
 
 		if (q->nr_hw_queues != set->nr_hw_queues) {
@@ -5039,13 +5031,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
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
 
-- 
2.45.2

