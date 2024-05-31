Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 992508D5C3D
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 10:07:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7F33020583; Fri, 31 May 2024 08:07:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 08:07:00 2024
Old-Return-Path: <BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 006EB20550
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 07:49:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GUJQ-fR1pBDh for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 07:49:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 87C0E20569
	for <nbd@other.debian.org>; Fri, 31 May 2024 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Hmvd8CugAGeadU1twTfeSXY4eccQybGsIHGkHL/IkB0=; b=my2INQcFxeQCNvgjmcsLc6Fb75
	+EFy+S+L2zWGIt2g4BBPXT+zKxxSbEKSxb3tBRS+43v7OGTOfpAaW1jjrvVXj8p6heokqg/3QgPvL
	cgEBbCQix9cOwyUKFuYg+h5o9MEKJotPtCESJKIwP3xUkAsfSsX/y9a+v4vJDSw3AsL5pT6hLH7Lu
	GuIXPs5ZW+9cBS0QF0sROYtRVuRTwsPOFFLgXpIrSa2T3CEX1IdFPbiV5seheDqGCLuYFDc6Yd5EF
	vffvu0LIjnfyd9A6B8PL+fYm3X9czzdyrgWKqx6Sa5+9qR0j+vzU7k6HmdEMljdnNzNPqRFDODR5A
	UiRrYXYA==;
Received: from 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCx0P-00000009XZp-47jk;
	Fri, 31 May 2024 07:48:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 04/14] block: take io_opt and io_min into account for max_sectors
Date: Fri, 31 May 2024 09:47:59 +0200
Message-ID: <20240531074837.1648501-5-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hgjXV1LjLpB.A.lSWJ.kUYWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2861
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531074837.1648501-5-hch@lst.de
Resent-Date: Fri, 31 May 2024 08:07:00 +0000 (UTC)

The soft max_sectors limit is normally capped by the hardware limits and
an arbitrary upper limit enforced by the kernel, but can be modified by
the user.  A few drivers want to increase this limit (nbd, rbd) or
adjust it up or down based on hardware capabilities (sd).

Change blk_validate_limits to default max_sectors to the optimal I/O
size, or upgrade it to the preferred minimal I/O size if that is
larger than the kernel default if no optimal I/O size is provided based
on the logic in the SD driver.

This keeps the existing kernel default for drivers that do not provide
an io_opt or very big io_min value, but picks a much more useful
default for those who provide these hints, and allows to remove the
hacks to set the user max_sectors limit in nbd, rbd and sd.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-settings.c |  7 +++++++
 drivers/block/nbd.c  |  2 +-
 drivers/block/rbd.c  |  1 -
 drivers/scsi/sd.c    | 29 +++++------------------------
 4 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index effeb9a639bb45..a49abdb3554834 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -153,6 +153,13 @@ static int blk_validate_limits(struct queue_limits *lim)
 		if (lim->max_user_sectors < PAGE_SIZE / SECTOR_SIZE)
 			return -EINVAL;
 		lim->max_sectors = min(max_hw_sectors, lim->max_user_sectors);
+	} else if (lim->io_opt) {
+		lim->max_sectors =
+			min(max_hw_sectors, lim->io_opt >> SECTOR_SHIFT);
+	} else if (lim->io_min &&
+		   lim->io_min > (BLK_DEF_MAX_SECTORS_CAP << SECTOR_SHIFT)) {
+		lim->max_sectors =
+			min(max_hw_sectors, lim->io_min >> SECTOR_SHIFT);
 	} else {
 		lim->max_sectors = min(max_hw_sectors, BLK_DEF_MAX_SECTORS_CAP);
 	}
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 22a79a62cc4eab..ad887d614d5b3f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1808,7 +1808,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 {
 	struct queue_limits lim = {
 		.max_hw_sectors		= 65536,
-		.max_user_sectors	= 256,
+		.io_opt			= 256 << SECTOR_SHIFT,
 		.max_segments		= USHRT_MAX,
 		.max_segment_size	= UINT_MAX,
 	};
diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 46dc487ccc17eb..22ad704f81d8b9 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4954,7 +4954,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
 	struct queue_limits lim = {
 		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
-		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
 		.io_opt			= objset_bytes,
 		.io_min			= rbd_dev->opts->alloc_size,
 		.max_segments		= USHRT_MAX,
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index f6c822c9cbd2d3..3dff9150ce11e2 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3593,7 +3593,7 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	struct request_queue *q = sdkp->disk->queue;
 	sector_t old_capacity = sdkp->capacity;
 	unsigned char *buffer;
-	unsigned int dev_max, rw_max;
+	unsigned int dev_max;
 
 	SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
 				      "sd_revalidate_disk\n"));
@@ -3675,34 +3675,15 @@ static int sd_revalidate_disk(struct gendisk *disk)
 	else
 		blk_queue_io_min(sdkp->disk->queue, 0);
 
-	if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
-		q->limits.io_opt = logical_to_bytes(sdp, sdkp->opt_xfer_blocks);
-		rw_max = logical_to_sectors(sdp, sdkp->opt_xfer_blocks);
-	} else {
-		q->limits.io_opt = 0;
-		rw_max = min_not_zero(logical_to_sectors(sdp, dev_max),
-				      (sector_t)BLK_DEF_MAX_SECTORS_CAP);
-	}
-
 	/*
 	 * Limit default to SCSI host optimal sector limit if set. There may be
 	 * an impact on performance for when the size of a request exceeds this
 	 * host limit.
 	 */
-	rw_max = min_not_zero(rw_max, sdp->host->opt_sectors);
-
-	/* Do not exceed controller limit */
-	rw_max = min(rw_max, queue_max_hw_sectors(q));
-
-	/*
-	 * Only update max_sectors if previously unset or if the current value
-	 * exceeds the capabilities of the hardware.
-	 */
-	if (sdkp->first_scan ||
-	    q->limits.max_sectors > q->limits.max_dev_sectors ||
-	    q->limits.max_sectors > q->limits.max_hw_sectors) {
-		q->limits.max_sectors = rw_max;
-		q->limits.max_user_sectors = rw_max;
+	q->limits.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
+	if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
+		q->limits.io_opt = min_not_zero(q->limits.io_opt,
+				logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
 	}
 
 	sdkp->first_scan = 0;
-- 
2.43.0

