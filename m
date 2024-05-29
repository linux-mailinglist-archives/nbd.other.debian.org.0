Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 148378D2C64
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 07:22:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EEBA4204D8; Wed, 29 May 2024 05:22:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 05:22:53 2024
Old-Return-Path: <BATV+c55c297d46ee5715703b+7584+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,REMOVEDOT,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A60D020495
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 05:05:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.6 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3, REMOVEDOT=3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o0WHKt9Cq08H for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 05:05:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6BA0D20494
	for <nbd@other.debian.org>; Wed, 29 May 2024 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8d6ngVwHNTNauOwhnmSKDDZurLIjQvxFhyRamCIijqE=; b=ReWXkSxrT/T0XfXFgzP7fcQh8P
	LoBLaZcev4afPR23+iF5PXS7kCs2z2TUVpoIyd/78ykilQnjG3jxnGKaz2qygkpvtbwzRtjvrCAYl
	kRalvqMO0n637ZnM+ujlbGRx9Uu7J/K8mx82XsU4sJ6adxwSBGxzWOrKd2C7hHkoCEYhQW7+4GHs4
	8eb0wh5wj73qBWmxsrBOfDOpKI6TsU3lSvJljEqqgtLUrlfbSgX2/FMMZqnCGSthgaaxRI+ADIMzo
	LhS0RyV7JdhFep0OEvQhfZB6LNhKVpnMk+2X11OFk5auX0QSxcd9e8fvmb2iVW/2tkg3CnDFmOfdP
	YoUBvdAw==;
Received: from 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBVO-00000002pk9-3paf;
	Wed, 29 May 2024 05:05:43 +0000
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
	linux-scsi@vger.kernel.org
Subject: [PATCH 12/12] block: add special APIs for run-time disabling of discard and friends
Date: Wed, 29 May 2024 07:04:14 +0200
Message-ID: <20240529050507.1392041-13-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lHPI8rUdkGN.A.2AhN.turVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2823
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240529050507.1392041-13-hch@lst.de
Resent-Date: Wed, 29 May 2024 05:22:53 +0000 (UTC)

A few drivers optimistically try to support discard, write zeroes and
secure erase and disable the features from the I/O completion handler
if the hardware can't support them.  This disable can't be done using
the atomic queue limits API because the I/O completion handlers can't
take sleeping locks or freezer the queue.  Keep the existing clearing
of the relevant field to zero, but replace the old blk_queue_max_*
APIs with new disable APIs that force the value to 0.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c   |  5 ++---
 block/blk-settings.c         | 41 ------------------------------------
 drivers/block/xen-blkfront.c |  4 ++--
 drivers/scsi/sd.c            |  4 ++--
 include/linux/blkdev.h       | 28 ++++++++++++++++++------
 5 files changed, 28 insertions(+), 54 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index a79a3b7c33a647..7eae1519300fbd 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -475,10 +475,9 @@ static void ubd_handler(void)
 				struct request_queue *q = io_req->req->q;
 
 				if (req_op(io_req->req) == REQ_OP_DISCARD)
-					blk_queue_max_discard_sectors(q, 0);
+					blk_queue_disable_discard(q);
 				if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)
-					blk_queue_max_write_zeroes_sectors(q,
-							0);
+					blk_queue_disable_write_zeroes(q);
 			}
 			blk_mq_end_request(io_req->req, io_req->error);
 			kfree(io_req);
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 0b038729608f4b..996f247fc98e80 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -293,47 +293,6 @@ int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
 }
 EXPORT_SYMBOL_GPL(queue_limits_set);
 
-/**
- * blk_queue_max_discard_sectors - set max sectors for a single discard
- * @q:  the request queue for the device
- * @max_discard_sectors: maximum number of sectors to discard
- **/
-void blk_queue_max_discard_sectors(struct request_queue *q,
-		unsigned int max_discard_sectors)
-{
-	struct queue_limits *lim = &q->limits;
-
-	lim->max_hw_discard_sectors = max_discard_sectors;
-	lim->max_discard_sectors =
-		min(max_discard_sectors, lim->max_user_discard_sectors);
-}
-EXPORT_SYMBOL(blk_queue_max_discard_sectors);
-
-/**
- * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
- * @q:  the request queue for the device
- * @max_sectors: maximum number of sectors to secure_erase
- **/
-void blk_queue_max_secure_erase_sectors(struct request_queue *q,
-		unsigned int max_sectors)
-{
-	q->limits.max_secure_erase_sectors = max_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_secure_erase_sectors);
-
-/**
- * blk_queue_max_write_zeroes_sectors - set max sectors for a single
- *                                      write zeroes
- * @q:  the request queue for the device
- * @max_write_zeroes_sectors: maximum number of sectors to write per command
- **/
-void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
-		unsigned int max_write_zeroes_sectors)
-{
-	q->limits.max_write_zeroes_sectors = max_write_zeroes_sectors;
-}
-EXPORT_SYMBOL(blk_queue_max_write_zeroes_sectors);
-
 void disk_update_readahead(struct gendisk *disk)
 {
 	blk_apply_bdi_limits(disk->bdi, &disk->queue->limits);
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index fd7c0ff2139cee..9b4ec3e4908cce 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1605,8 +1605,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
 				blkif_req(req)->error = BLK_STS_NOTSUPP;
 				info->feature_discard = 0;
 				info->feature_secdiscard = 0;
-				blk_queue_max_discard_sectors(rq, 0);
-				blk_queue_max_secure_erase_sectors(rq, 0);
+				blk_queue_disable_discard(rq);
+				blk_queue_disable_secure_erase(rq);
 			}
 			break;
 		case BLKIF_OP_FLUSH_DISKCACHE:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 03e67936b27928..56fd523b3987a5 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -837,7 +837,7 @@ static unsigned char sd_setup_protect_cmnd(struct scsi_cmnd *scmd,
 static void sd_disable_discard(struct scsi_disk *sdkp)
 {
 	sdkp->provisioning_mode = SD_LBP_DISABLE;
-	blk_queue_max_discard_sectors(sdkp->disk->queue, 0);
+	blk_queue_disable_discard(sdkp->disk->queue);
 }
 
 static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
@@ -1019,7 +1019,7 @@ static void sd_disable_write_same(struct scsi_disk *sdkp)
 {
 	sdkp->device->no_write_same = 1;
 	sdkp->max_ws_blocks = 0;
-	blk_queue_max_write_zeroes_sectors(sdkp->disk->queue, 0);
+	blk_queue_disable_write_zeroes(sdkp->disk->queue);
 }
 
 static void sd_config_write_same(struct scsi_disk *sdkp,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index bee71deb8ca066..b83441da12456a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -923,15 +923,31 @@ static inline void queue_limits_cancel_update(struct request_queue *q)
 	mutex_unlock(&q->limits_lock);
 }
 
+/*
+ * These helpers are for drivers that have sloppy feature negotiation and might
+ * have to disable DISCARD, WRITE_ZEROES or SECURE_DISCARD from the I/O
+ * completion handler when the device returned an indicator that the respective
+ * feature is not actually supported.  They are racy and the driver needs to
+ * cope with that.  Try to avoid this scheme if you can.
+ */
+static inline void blk_queue_disable_discard(struct request_queue *q)
+{
+	q->limits.max_discard_sectors = 0;
+}
+
+static inline void blk_queue_disable_secure_erase(struct request_queue *q)
+{
+	q->limits.max_secure_erase_sectors = 0;
+}
+
+static inline void blk_queue_disable_write_zeroes(struct request_queue *q)
+{
+	q->limits.max_write_zeroes_sectors = 0;
+}
+
 /*
  * Access functions for manipulating queue properties
  */
-void blk_queue_max_secure_erase_sectors(struct request_queue *q,
-		unsigned int max_sectors);
-extern void blk_queue_max_discard_sectors(struct request_queue *q,
-		unsigned int max_discard_sectors);
-extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
-		unsigned int max_write_same_sectors);
 void disk_update_readahead(struct gendisk *disk);
 extern void blk_limits_io_min(struct queue_limits *limits, unsigned int min);
 extern void blk_limits_io_opt(struct queue_limits *limits, unsigned int opt);
-- 
2.43.0

