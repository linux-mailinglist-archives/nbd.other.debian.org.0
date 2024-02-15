Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 57814855B88
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:22:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3B5DA20947; Thu, 15 Feb 2024 07:22:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:22:21 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 395B620C20
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NYaSmwXEh1qr for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9BD620C28
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1EnsEkvgD7HWr4nnx5YI4UIfs7PyaV58+s3ACjOhYUE=; b=SarH/SjFUdZkl+NMfFuvtM1/gX
	UxgaqqLDdaaKi6J3yAlssNsysQKCpaJLio6y5rmIQxCXUx4HmkJy/pgAgiJ0OECtELFptgJeLey2U
	HyfvPe2gmkG7LEOCw7PPCSEqv6Ugx2UK73l5AMnVl9gM2Q60K+fH/HW+E6UpImu4blbbisRj2zyEr
	iuV5RX0i28u6W4PZgvyPRLvFecWi0be54BmhcoLKNwWhy0kRooaTKZ+iFyKtfFOxDDpKsd119nXcO
	lz+12lcj2asO0Fnnn6nOeqodVydcC1VJMvzZJLSVSr4CWbDzsly6dRle6shwY+OiEdyHH/5xfiWCc
	1oef4Jww==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmH-0000000FATJ-1il1;
	Thu, 15 Feb 2024 07:03:25 +0000
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
Subject: [PATCH 07/17] rbd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:50 +0100
Message-Id: <20240215070300.2200308-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0KHRt2NODnH.A.-7.tubzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2732
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-8-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:22:21 +0000 (UTC)

Pass the limits rbd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 6b4f1898a722a3..26ff5cd2bf0abc 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4952,6 +4952,14 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	struct request_queue *q;
 	unsigned int objset_bytes =
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
+	struct queue_limits lim = {
+		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
+		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
+		.io_min			= rbd_dev->opts->alloc_size,
+		.io_opt			= rbd_dev->opts->alloc_size,
+		.max_segments		= USHRT_MAX,
+		.max_segment_size	= UINT_MAX,
+	};
 	int err;
 
 	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
@@ -4966,7 +4974,13 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	if (err)
 		return err;
 
-	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, NULL, rbd_dev);
+	if (rbd_dev->opts->trim) {
+		lim.discard_granularity = rbd_dev->opts->alloc_size;
+		lim.max_hw_discard_sectors = objset_bytes >> SECTOR_SHIFT;
+		lim.max_write_zeroes_sectors = objset_bytes >> SECTOR_SHIFT;
+	}
+
+	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, &lim, rbd_dev);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_tag_set;
@@ -4987,19 +5001,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
 
-	blk_queue_max_hw_sectors(q, objset_bytes >> SECTOR_SHIFT);
-	q->limits.max_sectors = queue_max_hw_sectors(q);
-	blk_queue_max_segments(q, USHRT_MAX);
-	blk_queue_max_segment_size(q, UINT_MAX);
-	blk_queue_io_min(q, rbd_dev->opts->alloc_size);
-	blk_queue_io_opt(q, rbd_dev->opts->alloc_size);
-
-	if (rbd_dev->opts->trim) {
-		q->limits.discard_granularity = rbd_dev->opts->alloc_size;
-		blk_queue_max_discard_sectors(q, objset_bytes >> SECTOR_SHIFT);
-		blk_queue_max_write_zeroes_sectors(q, objset_bytes >> SECTOR_SHIFT);
-	}
-
 	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
 
-- 
2.39.2

