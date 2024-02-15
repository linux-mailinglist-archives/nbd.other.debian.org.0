Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A581855B8F
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:23:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DD7CB2095A; Thu, 15 Feb 2024 07:23:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:23:36 2024
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
	by bendel.debian.org (Postfix) with ESMTP id C8DF520C20
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IMhac0jVDq55 for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F137420C21
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yJHDSn6WPvm2hiPcnkw4M8SzhD1N4VSQZfg0CpuJ6q8=; b=Eg7EtnBSYRZyyqfX2b3btVHrNp
	Yhjo3OArJmpd6JThmMl/nN1Nl4qCSEdnqyUmYfRcNrt80HwB/MmMaZI5YxLf0AfkSa8+Rg+C3KMPd
	oGRl/veA4sqC0fKq+KADMTcCn7Joc1kjoKmsvncZN53lvUUXS891sY1j3S7Xo2CCyqnc8rMekpKbS
	IbOkJ0NMfPGUQrsI70jrZczz9BKgFFF1VXk6MYrS4q4jUVI8YLfBHUvt2AKNnZGkiJtzCVZerLTQv
	MoIA4hwgQn5jWGVsNXIQlJ9ba/+ZaSVKyE3/zQc59h+1LbWkIFNe/XOaVdkovfQss/tuAguj75OAq
	hyOtAHaw==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmK-0000000FAUd-0tPX;
	Thu, 15 Feb 2024 07:03:28 +0000
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
Subject: [PATCH 08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:51 +0100
Message-Id: <20240215070300.2200308-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HY9Lq3IuBoB.A.GYB.4vbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2737
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-9-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:23:36 +0000 (UTC)

Pass the limits rnbd-clt imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

While at it don't set an explicit number of discard segments, as 1 is
the default (which most drivers rely on).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-clt.c | 64 ++++++++++++++---------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index d51be4f2df61a3..b7ffe03c61606d 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1329,43 +1329,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
 	}
 }
 
-static void setup_request_queue(struct rnbd_clt_dev *dev,
-				struct rnbd_msg_open_rsp *rsp)
-{
-	blk_queue_logical_block_size(dev->queue,
-				     le16_to_cpu(rsp->logical_block_size));
-	blk_queue_physical_block_size(dev->queue,
-				      le16_to_cpu(rsp->physical_block_size));
-	blk_queue_max_hw_sectors(dev->queue,
-				 dev->sess->max_io_size / SECTOR_SIZE);
-
-	/*
-	 * we don't support discards to "discontiguous" segments
-	 * in on request
-	 */
-	blk_queue_max_discard_segments(dev->queue, 1);
-
-	blk_queue_max_discard_sectors(dev->queue,
-				      le32_to_cpu(rsp->max_discard_sectors));
-	dev->queue->limits.discard_granularity =
-					le32_to_cpu(rsp->discard_granularity);
-	dev->queue->limits.discard_alignment =
-					le32_to_cpu(rsp->discard_alignment);
-	if (le16_to_cpu(rsp->secure_discard))
-		blk_queue_max_secure_erase_sectors(dev->queue,
-					le32_to_cpu(rsp->max_discard_sectors));
-	blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
-	blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
-	blk_queue_max_segments(dev->queue, dev->sess->max_segments);
-	blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
-	blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
-	blk_queue_write_cache(dev->queue,
-			      !!(rsp->cache_policy & RNBD_WRITEBACK),
-			      !!(rsp->cache_policy & RNBD_FUA));
-	blk_queue_max_write_zeroes_sectors(dev->queue,
-					   le32_to_cpu(rsp->max_write_zeroes_sectors));
-}
-
 static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev,
 				   struct rnbd_msg_open_rsp *rsp, int idx)
 {
@@ -1403,18 +1366,41 @@ static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev,
 static int rnbd_client_setup_device(struct rnbd_clt_dev *dev,
 				    struct rnbd_msg_open_rsp *rsp)
 {
+	struct queue_limits lim = {
+		.logical_block_size	= le16_to_cpu(rsp->logical_block_size),
+		.physical_block_size	= le16_to_cpu(rsp->physical_block_size),
+		.io_opt			= dev->sess->max_io_size,
+		.max_hw_sectors		= dev->sess->max_io_size / SECTOR_SIZE,
+		.max_hw_discard_sectors	= le32_to_cpu(rsp->max_discard_sectors),
+		.discard_granularity	= le32_to_cpu(rsp->discard_granularity),
+		.discard_alignment	= le32_to_cpu(rsp->discard_alignment),
+		.max_segments		= dev->sess->max_segments,
+		.virt_boundary_mask	= SZ_4K - 1,
+		.max_write_zeroes_sectors =
+			le32_to_cpu(rsp->max_write_zeroes_sectors),
+	};
 	int idx = dev->clt_device_id;
 
 	dev->size = le64_to_cpu(rsp->nsectors) *
 			le16_to_cpu(rsp->logical_block_size);
 
-	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, NULL, dev);
+	if (rsp->secure_discard) {
+		lim.max_secure_erase_sectors =
+			le32_to_cpu(rsp->max_discard_sectors);
+	}
+
+	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, &lim, dev);
 	if (IS_ERR(dev->gd))
 		return PTR_ERR(dev->gd);
 	dev->queue = dev->gd->queue;
 	rnbd_init_mq_hw_queues(dev);
 
-	setup_request_queue(dev, rsp);
+	blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
+	blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
+	blk_queue_write_cache(dev->queue,
+			      !!(rsp->cache_policy & RNBD_WRITEBACK),
+			      !!(rsp->cache_policy & RNBD_FUA));
+
 	return rnbd_clt_setup_gen_disk(dev, rsp, idx);
 }
 
-- 
2.39.2

