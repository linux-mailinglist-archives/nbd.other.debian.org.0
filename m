Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC9A06E1B
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 07:15:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 94681205C0; Thu,  9 Jan 2025 06:15:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 06:15:45 2025
Old-Return-Path: <BATV+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9FC6920594
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 05:58:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SSSG8gVhtZNl for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 05:58:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A29AD205BB
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Bbwf1z/EyA9VDPM7cCNiN9DK6U/nUAnzEdDfat2CVGo=; b=bfpYZOwlb0NM2sLbHM5kFiZj02
	hRS3+AFJ/WCC173+vOiAsuO4Euq2NrqRXL965r/HR7NIoA145W5LRYVZyt9juQDrFtO1s/uhRbdKC
	VEhcCrLPs+1/5ULljVoQS2xnyXyT9iwgUvnzFxWINim/EMmyPg12zrnIUyxlzPY46yuBClDZAi8uz
	cktoNpUiuw1ijhZOs6FAU+wC1V2Pc3HXnLslHhw/MFEiT571Pnl0tfzqaUbwsieqcc7dZYFNuWGOi
	bLAkUbFZd8RzKXnxVnNPMQlS022zb9v7TzIPhcuLukDZqdAiSBCa82/PRicdku1jbu6wJUycBP+pE
	b9Z47NHA==;
Received: from 2a02-8389-2341-5b80-ddeb-cdec-70b9-e2f0.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:ddeb:cdec:70b9:e2f0] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlYm-0000000ArEU-12Jk;
	Thu, 09 Jan 2025 05:58:24 +0000
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
Subject: [PATCH 03/11] block: check BLK_FEAT_POLL under q_usage_count
Date: Thu,  9 Jan 2025 06:57:24 +0100
Message-ID: <20250109055810.1402918-4-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109055810.1402918-1-hch@lst.de>
References: <20250109055810.1402918-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uETNDfRabhH.A.AEhN.Rm2fnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3307
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250109055810.1402918-4-hch@lst.de
Resent-Date: Thu,  9 Jan 2025 06:15:45 +0000 (UTC)

Otherwise feature reconfiguration can race with I/O submission.

Also drop the bio_clear_polled in the error path, as the flag does not
matter for instant error completions, it is a left over from when we
allowed polled I/O to proceed unpolled in this case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 22 ++++++++++++----------
 block/blk-mq.c   | 12 ++++++++++--
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 666efe8fa202..6309b3f5a89d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -629,8 +629,14 @@ static void __submit_bio(struct bio *bio)
 		blk_mq_submit_bio(bio);
 	} else if (likely(bio_queue_enter(bio) == 0)) {
 		struct gendisk *disk = bio->bi_bdev->bd_disk;
-
-		disk->fops->submit_bio(bio);
+	
+		if ((bio->bi_opf & REQ_POLLED) &&
+		    !(disk->queue->limits.features & BLK_FEAT_POLL)) {
+			bio->bi_status = BLK_STS_NOTSUPP;
+			bio_endio(bio);
+		} else {
+			disk->fops->submit_bio(bio);
+		}
 		blk_queue_exit(disk->queue);
 	}
 
@@ -805,12 +811,6 @@ void submit_bio_noacct(struct bio *bio)
 		}
 	}
 
-	if (!(q->limits.features & BLK_FEAT_POLL) &&
-			(bio->bi_opf & REQ_POLLED)) {
-		bio_clear_polled(bio);
-		goto not_supported;
-	}
-
 	switch (bio_op(bio)) {
 	case REQ_OP_READ:
 		break;
@@ -935,7 +935,7 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
 		return 0;
 
 	q = bdev_get_queue(bdev);
-	if (cookie == BLK_QC_T_NONE || !(q->limits.features & BLK_FEAT_POLL))
+	if (cookie == BLK_QC_T_NONE)
 		return 0;
 
 	blk_flush_plug(current->plug, false);
@@ -951,7 +951,9 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
 	 */
 	if (!percpu_ref_tryget(&q->q_usage_counter))
 		return 0;
-	if (queue_is_mq(q)) {
+	if (!(q->limits.features & BLK_FEAT_POLL)) {
+		ret = 0;
+	} else if (queue_is_mq(q)) {
 		ret = blk_mq_poll(q, cookie, iob, flags);
 	} else {
 		struct gendisk *disk = q->disk;
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 2e6132f778fd..02c9232a8fff 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3096,14 +3096,22 @@ void blk_mq_submit_bio(struct bio *bio)
 	}
 
 	/*
-	 * Device reconfiguration may change logical block size, so alignment
-	 * check has to be done with queue usage counter held
+	 * Device reconfiguration may change logical block size or reduce the
+	 * number of poll queues, so the checks for alignment and poll support
+	 * have to be done with queue usage counter held.
 	 */
 	if (unlikely(bio_unaligned(bio, q))) {
 		bio_io_error(bio);
 		goto queue_exit;
 	}
 
+	if ((bio->bi_opf & REQ_POLLED) &&
+	    !(q->limits.features & BLK_FEAT_POLL)) {
+		bio->bi_status = BLK_STS_NOTSUPP;
+		bio_endio(bio);
+		goto queue_exit;
+	}
+
 	bio = __bio_split_to_limits(bio, &q->limits, &nr_segs);
 	if (!bio)
 		goto queue_exit;
-- 
2.45.2

