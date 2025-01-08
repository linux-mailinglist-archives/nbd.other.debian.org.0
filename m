Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A517A0573B
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 10:43:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D06A206EA; Wed,  8 Jan 2025 09:43:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 09:43:58 2025
Old-Return-Path: <BATV+9e166f3f48dee24ac321+7808+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4FEAD206D7
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 09:26:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hfJyG2CDIy64 for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 09:26:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CA36920651
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ih4jy9VAjfow7y1Oqz5GnPF863ZTdoZ8wHnqGjtKptU=; b=oPpanfBpZy77Vp8w0f/0q1ke7c
	etVQTYocniWuKqKFfnwdfms394BnL8sX36/XCEVMxndlstdR3KmA1NzzdH3vqHfXp3g9R9687fNYv
	hAegrfobbDHr+X6sQks75oQcyvsI7d5qtSjtGyFdBw08qSQQM+iEjFAXgCLAD1zRM/YgNchPvCTe/
	de8WT2TXhrJjjMt7mwuPS5oJGdgbGcoC4TFNr7woAijIP0VfpUZeglTNOK0usqQlRaYrXD70bWpkd
	NxoFB7Lq/oPloKzoeHyQd+UbGigxyJ/9aBZQVbkKaT1K4scQaGKU2Pv61I3pa7BQ6/GQ+wAzG1fCh
	L0hLdmeA==;
Received: from 2a02-8389-2341-5b80-e44b-b36a-6403-8f06.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:e44b:b36a:6403:8f06] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSK5-00000007lrR-3WXp;
	Wed, 08 Jan 2025 09:26:00 +0000
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
Subject: [PATCH 09/10] loop: refactor queue limits updates
Date: Wed,  8 Jan 2025 10:25:06 +0100
Message-ID: <20250108092520.1325324-10-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108092520.1325324-1-hch@lst.de>
References: <20250108092520.1325324-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NLaDJggYTOI.A.Oe9N.ejkfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3279
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250108092520.1325324-10-hch@lst.de
Resent-Date: Wed,  8 Jan 2025 09:43:58 +0000 (UTC)

Replace loop_reconfigure_limits with a slightly less encompassing
loop_update_limits that expects the aller to acquire and commit the
queue limits to prepare for sorting out the freeze vs limits lock
ordering.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 836a53eef4b4..560d6d5879d6 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -977,12 +977,12 @@ static unsigned int loop_default_blocksize(struct loop_device *lo,
 	return SECTOR_SIZE;
 }
 
-static int loop_reconfigure_limits(struct loop_device *lo, unsigned int bsize)
+static void loop_update_limits(struct loop_device *lo, struct queue_limits *lim,
+		unsigned int bsize)
 {
 	struct file *file = lo->lo_backing_file;
 	struct inode *inode = file->f_mapping->host;
 	struct block_device *backing_bdev = NULL;
-	struct queue_limits lim;
 	u32 granularity = 0, max_discard_sectors = 0;
 
 	if (S_ISBLK(inode->i_mode))
@@ -995,22 +995,20 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned int bsize)
 
 	loop_get_discard_config(lo, &granularity, &max_discard_sectors);
 
-	lim = queue_limits_start_update(lo->lo_queue);
-	lim.logical_block_size = bsize;
-	lim.physical_block_size = bsize;
-	lim.io_min = bsize;
-	lim.features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_ROTATIONAL);
+	lim->logical_block_size = bsize;
+	lim->physical_block_size = bsize;
+	lim->io_min = bsize;
+	lim->features &= ~(BLK_FEAT_WRITE_CACHE | BLK_FEAT_ROTATIONAL);
 	if (file->f_op->fsync && !(lo->lo_flags & LO_FLAGS_READ_ONLY))
-		lim.features |= BLK_FEAT_WRITE_CACHE;
+		lim->features |= BLK_FEAT_WRITE_CACHE;
 	if (backing_bdev && !bdev_nonrot(backing_bdev))
-		lim.features |= BLK_FEAT_ROTATIONAL;
-	lim.max_hw_discard_sectors = max_discard_sectors;
-	lim.max_write_zeroes_sectors = max_discard_sectors;
+		lim->features |= BLK_FEAT_ROTATIONAL;
+	lim->max_hw_discard_sectors = max_discard_sectors;
+	lim->max_write_zeroes_sectors = max_discard_sectors;
 	if (max_discard_sectors)
-		lim.discard_granularity = granularity;
+		lim->discard_granularity = granularity;
 	else
-		lim.discard_granularity = 0;
-	return queue_limits_commit_update(lo->lo_queue, &lim);
+		lim->discard_granularity = 0;
 }
 
 static int loop_configure(struct loop_device *lo, blk_mode_t mode,
@@ -1019,6 +1017,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 {
 	struct file *file = fget(config->fd);
 	struct address_space *mapping;
+	struct queue_limits lim;
 	int error;
 	loff_t size;
 	bool partscan;
@@ -1090,7 +1089,9 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	lo->old_gfp_mask = mapping_gfp_mask(mapping);
 	mapping_set_gfp_mask(mapping, lo->old_gfp_mask & ~(__GFP_IO|__GFP_FS));
 
-	error = loop_reconfigure_limits(lo, config->block_size);
+	lim = queue_limits_start_update(lo->lo_queue);
+	loop_update_limits(lo, &lim, config->block_size);
+	error = queue_limits_commit_update(lo->lo_queue, &lim);
 	if (error)
 		goto out_unlock;
 
@@ -1458,6 +1459,7 @@ static int loop_set_dio(struct loop_device *lo, unsigned long arg)
 
 static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 {
+	struct queue_limits lim;
 	int err = 0;
 
 	if (lo->lo_state != Lo_bound)
@@ -1470,7 +1472,9 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	invalidate_bdev(lo->lo_device);
 
 	blk_mq_freeze_queue(lo->lo_queue);
-	err = loop_reconfigure_limits(lo, arg);
+	lim = queue_limits_start_update(lo->lo_queue);
+	loop_update_limits(lo, &lim, arg);
+	err = queue_limits_commit_update(lo->lo_queue, &lim);
 	loop_update_dio(lo);
 	blk_mq_unfreeze_queue(lo->lo_queue);
 
-- 
2.45.2

