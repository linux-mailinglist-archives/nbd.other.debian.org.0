Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BCE855B92
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:23:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D903A20967; Thu, 15 Feb 2024 07:23:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:23:50 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 0F3A12064B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7jSEGse_rL9h for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 15E832063B
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7HW9nW/6R1po4TKLgzFygXD/FnydtoezUdFVDwul6Gg=; b=RygLJ0VFhu19BJnN/mrXhVxIZ/
	+m5eiwoXuNIsoMu1yUIpSCyzrmw9irbsK19WBIfx2LiNAd6OLOEBeE9hq95/IDZJfcBEMpMXtdDVQ
	aXLLlvAWAh3a5MvnkR/w/L4RyQDguW7wmUrbfrxvFaoRS3Ytvqqcu5NwYXIokLnUJYVERo0rjfWxQ
	bVfSlLVadoNBQg9wEaBIGgt8Odv3IB18yERFr7L3slrop+EU6HAcjjIR+XreyhBNO1vyataXnKkGe
	aeMNbhCGoqQxW4U4VVIbPXSvNwzRIXSNzrFav2B+686ZZcovDrnqQqox00jXS/5kUH0xcWW5yiWDP
	cfgOflHQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmS-0000000FAdC-1wnt;
	Thu, 15 Feb 2024 07:03:37 +0000
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
Subject: [PATCH 11/17] ms_block: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:54 +0100
Message-Id: <20240215070300.2200308-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0ohbX93_V7H.A.KgB.GwbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2738
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-12-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:23:50 +0000 (UTC)

Pass the few limits ms_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/ms_block.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index d3277c901d16bb..47a314a4eb6faf 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2078,6 +2078,12 @@ static const struct blk_mq_ops msb_mq_ops = {
 static int msb_init_disk(struct memstick_dev *card)
 {
 	struct msb_data *msb = memstick_get_drvdata(card);
+	struct queue_limits lim = {
+		.logical_block_size	= msb->page_size,
+		.max_hw_sectors		= MS_BLOCK_MAX_PAGES,
+		.max_segments		= MS_BLOCK_MAX_SEGS,
+		.max_segment_size	= MS_BLOCK_MAX_PAGES * msb->page_size,
+	};
 	int rc;
 	unsigned long capacity;
 
@@ -2093,19 +2099,13 @@ static int msb_init_disk(struct memstick_dev *card)
 	if (rc)
 		goto out_release_id;
 
-	msb->disk = blk_mq_alloc_disk(&msb->tag_set, NULL, card);
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, &lim, card);
 	if (IS_ERR(msb->disk)) {
 		rc = PTR_ERR(msb->disk);
 		goto out_free_tag_set;
 	}
 	msb->queue = msb->disk->queue;
 
-	blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
-	blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
-	blk_queue_max_segment_size(msb->queue,
-				   MS_BLOCK_MAX_PAGES * msb->page_size);
-	blk_queue_logical_block_size(msb->queue, msb->page_size);
-
 	sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
 	msb->disk->fops = &msb_bdops;
 	msb->disk->private_data = msb;
-- 
2.39.2

