Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A7855B9C
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:25:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1E8052097A; Thu, 15 Feb 2024 07:25:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:25:17 2024
Old-Return-Path: <BATV+a252b21bd4a653ddb6e6+7480+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E234920C21
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:04:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6twMAPmzNIwt for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:04:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5693620C20
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7zD6VNIMLe8KoSh7gVdIiJrNbBye7jElCrfKkAhqhTI=; b=KN3/XCI3b6fOPBsb1lELc6oe0a
	5yuAUaO7VaKwFt9kikY3dhB6k6QJUjh2QET/EjuUlLYCSDO9IjzfBuPH94mLwIvZr0bmuMC07slsL
	CXzVdYl73n/QGhFa4fx+t3yYVIik/cKcxxPexydK5T3l6PPGtegAEJRceGyBl70VYqaH4OL5klF2W
	f1vwotsgh/9iFnvRN6AQfTrgx6OiFFYkddSreUxo/Rd7e402zHMj58aR4ou5GamLVX6Wju/rOSYct
	57r0zjiVZD+bE+aXkRcfRozVQGxSJIM39/lWcv6NU6erSmexFIwaPIHHfosojGS4mwmG7W7xC7WRM
	pO8t9tkQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmk-0000000FAup-2ONv;
	Thu, 15 Feb 2024 07:03:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:03:00 +0100
Message-Id: <20240215070300.2200308-18-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oIUx3G_P1qM.A.dKC.dxbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2744
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-18-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:25:17 +0000 (UTC)

Pass the queue limit set at initialization time directly to
blk_mq_alloc_disk instead of updating it right after the allocation.

This requires refactoring the code a bit so that what was mmc_setup_queue
before also allocates the gendisk now and actually sets all limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mmc/core/queue.c | 97 +++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 45 deletions(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 67ad186d132a69..2ae60d208cdf1e 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned short sg_len, gfp_t gfp)
 	return sg;
 }
 
-static void mmc_queue_setup_discard(struct request_queue *q,
-				    struct mmc_card *card)
+static void mmc_queue_setup_discard(struct mmc_card *card,
+		struct queue_limits *lim)
 {
 	unsigned max_discard;
 
@@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 	if (!max_discard)
 		return;
 
-	blk_queue_max_discard_sectors(q, max_discard);
-	q->limits.discard_granularity = card->pref_erase << 9;
-	/* granularity must not be greater than max. discard */
-	if (card->pref_erase > max_discard)
-		q->limits.discard_granularity = SECTOR_SIZE;
+	lim->max_hw_discard_sectors = max_discard;
 	if (mmc_can_secure_erase_trim(card))
-		blk_queue_max_secure_erase_sectors(q, max_discard);
+		lim->max_secure_erase_sectors = max_discard;
 	if (mmc_can_trim(card) && card->erased_byte == 0)
-		blk_queue_max_write_zeroes_sectors(q, max_discard);
+		lim->max_write_zeroes_sectors = max_discard;
+
+	/* granularity must not be greater than max. discard */
+	if (card->pref_erase > max_discard)
+		lim->discard_granularity = SECTOR_SIZE;
+	else
+		lim->discard_granularity = card->pref_erase << 9;
 }
 
 static unsigned short mmc_get_max_segments(struct mmc_host *host)
@@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops = {
 	.timeout	= mmc_mq_timed_out,
 };
 
-static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
+static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
+		struct mmc_card *card)
 {
 	struct mmc_host *host = card->host;
-	unsigned block_size = 512;
+	struct queue_limits lim = { };
+	struct gendisk *disk;
 
-	blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
 	if (mmc_can_erase(card))
-		mmc_queue_setup_discard(mq->queue, card);
+		mmc_queue_setup_discard(card, &lim);
 
 	if (!mmc_dev(host)->dma_mask || !*mmc_dev(host)->dma_mask)
-		blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
-	blk_queue_max_hw_sectors(mq->queue,
-		min(host->max_blk_count, host->max_req_size / 512));
-	if (host->can_dma_map_merge)
-		WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
-							mmc_dev(host)),
-		     "merging was advertised but not possible");
-	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
-
-	if (mmc_card_mmc(card) && card->ext_csd.data_sector_size) {
-		block_size = card->ext_csd.data_sector_size;
-		WARN_ON(block_size != 512 && block_size != 4096);
-	}
+		lim.bounce = BLK_BOUNCE_HIGH;
+
+	lim.max_hw_sectors = min(host->max_blk_count, host->max_req_size / 512);
+
+	if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
+		lim.logical_block_size = card->ext_csd.data_sector_size;
+	else
+		lim.logical_block_size = 512;
+
+	WARN_ON_ONCE(lim.logical_block_size != 512 &&
+		     lim.logical_block_size != 4096);
 
-	blk_queue_logical_block_size(mq->queue, block_size);
 	/*
-	 * After blk_queue_can_use_dma_map_merging() was called with succeed,
-	 * since it calls blk_queue_virt_boundary(), the mmc should not call
-	 * both blk_queue_max_segment_size().
+	 * Setting a virt_boundary implicity sets a max_segment_size, so try
+	 * to set the hardware one here.
 	 */
-	if (!host->can_dma_map_merge)
-		blk_queue_max_segment_size(mq->queue,
-			round_down(host->max_seg_size, block_size));
+	if (host->can_dma_map_merge) {
+		lim.virt_boundary_mask = dma_get_merge_boundary(mmc_dev(host));
+		lim.max_segments = MMC_DMA_MAP_MERGE_SEGMENTS;
+	} else {
+		lim.max_segment_size =
+			round_down(host->max_seg_size, lim.logical_block_size);
+		lim.max_segments = host->max_segs;
+	}
+
+	disk = blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
+	if (IS_ERR(disk))
+		return disk;
+	mq->queue = disk->queue;
+
+	if (mmc_host_is_spi(host) && host->use_spi_crc)
+		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
+	blk_queue_rq_timeout(mq->queue, 60 * HZ);
+
+	blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
+	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
 
 	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
 
@@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 	init_waitqueue_head(&mq->wait);
 
 	mmc_crypto_setup_queue(mq->queue, host);
+	return disk;
 }
 
 static inline bool mmc_merge_capable(struct mmc_host *host)
@@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 		return ERR_PTR(ret);
 		
 
-	disk = blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
-	if (IS_ERR(disk)) {
+	disk = mmc_alloc_disk(mq, card);
+	if (IS_ERR(disk))
 		blk_mq_free_tag_set(&mq->tag_set);
-		return disk;
-	}
-	mq->queue = disk->queue;
-
-	if (mmc_host_is_spi(host) && host->use_spi_crc)
-		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
-	blk_queue_rq_timeout(mq->queue, 60 * HZ);
-
-	mmc_setup_queue(mq, card);
 	return disk;
 }
 
-- 
2.39.2

