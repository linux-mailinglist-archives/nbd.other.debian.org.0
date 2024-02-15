Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C876855B7F
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:21:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4236220943; Thu, 15 Feb 2024 07:21:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:21:26 2024
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
	by bendel.debian.org (Postfix) with ESMTP id C1B9620C26
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GYXi8eebWEFP for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 767332063B
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4fJVpifb0pDninviL6ZY7y1+xuTxMtXLHlTD8or8yks=; b=lfg/cCuLFSdOOMIr+fbwY4BD+6
	jKmtaE1fu3OCvm4a8D8b6oM02Dadh4IkbB6rRMMDgh9acpo5zy+z5xrYazIASRMNLuuzPoVqfQQ6O
	rRrPB6Crmd8rr1PMZB0khOJ/44EIktlnmAx30Cu5Lr+btKoMOnbxG1iTb1CGASKUI1/dLz4sjprn9
	022wdRBZJLPAMmJsCOt/ulmM2OHkFnRLWlY+rQi88EAufs1C4MC9eG87wMegoMvmEcycslL3v8Ri6
	MqaH7Ys3aeBTSBP2K0UAH2zcX56HXhGOrgKHIYHvCklKS0U39BSOPfeyIUo0DdL0opdKDxZZih6qP
	8yNZ+BSg==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm9-0000000FAPj-290B;
	Thu, 15 Feb 2024 07:03:18 +0000
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
Subject: [PATCH 04/17] mtip: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:47 +0100
Message-Id: <20240215070300.2200308-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4FC7TW4gIQH.A.6o.2tbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2728
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-5-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:21:26 +0000 (UTC)

Pass the few limits mtip imposes directly to blk_mq_alloc_disk instead
of setting them one at a time and drop the pointless setting of a io_min
that is equal to the physical block size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/mtip32xx/mtip32xx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index ac08dea73552f4..43a187609ef794 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3401,6 +3401,12 @@ static const struct blk_mq_ops mtip_mq_ops = {
  */
 static int mtip_block_initialize(struct driver_data *dd)
 {
+	struct queue_limits lim = {
+		.physical_block_size	= 4096,
+		.max_hw_sectors		= 0xffff,
+		.max_segments		= MTIP_MAX_SG,
+		.max_segment_size	= 0x400000,
+	};
 	int rv = 0, wait_for_rebuild = 0;
 	sector_t capacity;
 	unsigned int index = 0;
@@ -3431,7 +3437,7 @@ static int mtip_block_initialize(struct driver_data *dd)
 		goto block_queue_alloc_tag_error;
 	}
 
-	dd->disk = blk_mq_alloc_disk(&dd->tags, NULL, dd);
+	dd->disk = blk_mq_alloc_disk(&dd->tags, &lim, dd);
 	if (IS_ERR(dd->disk)) {
 		dev_err(&dd->pdev->dev,
 			"Unable to allocate request queue\n");
@@ -3481,12 +3487,7 @@ static int mtip_block_initialize(struct driver_data *dd)
 	/* Set device limits. */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, dd->queue);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, dd->queue);
-	blk_queue_max_segments(dd->queue, MTIP_MAX_SG);
-	blk_queue_physical_block_size(dd->queue, 4096);
-	blk_queue_max_hw_sectors(dd->queue, 0xffff);
-	blk_queue_max_segment_size(dd->queue, 0x400000);
 	dma_set_max_seg_size(&dd->pdev->dev, 0x400000);
-	blk_queue_io_min(dd->queue, 4096);
 
 	/* Set the capacity of the device in 512 byte sectors. */
 	if (!(mtip_hw_get_capacity(dd, &capacity))) {
-- 
2.39.2

