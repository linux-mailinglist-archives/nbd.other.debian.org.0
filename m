Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F1855B94
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:24:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 910B720963; Thu, 15 Feb 2024 07:24:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:24:20 2024
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
	by bendel.debian.org (Postfix) with ESMTP id F22C82063B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ad7wzPW89Cbe for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1FD7720C20
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yX6TjNZwV1r6foMr2Mx/pYjlb9HSFWyCxKJgPy+mgfc=; b=FWUf/NVIFJnkymZUE6OitjMEpo
	AvDOHoneczJ504a36JzctCYDJ6mM6seqiBlAhDExxgchaMNUS25aGtexiLTgFcTpH8lZVhlStA8fX
	zzOg/lXiSu4RxVzwSPzqOWyqyw8sZJPPXnh+Hd97psAyjK06nz2UMcNSLsLka6AzVZ1M9HwCtTH2d
	HVptIRWFaXYvoz6775vrfiv0hvfK2gwQAkDbkdEK9o6r1IBprFP64ryujWSKzVWejsKlpCw244aam
	UoBXCaWT3vNX9BWmPfA46Lm9dK4NASkbvvYhxT459Vj68MXCfCVnLKYkEMRcCn9HHLl6er//nOsoh
	BuATTlHA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmY-0000000FAis-2CQX;
	Thu, 15 Feb 2024 07:03:43 +0000
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
Subject: [PATCH 13/17] mtd_blkdevs: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:56 +0100
Message-Id: <20240215070300.2200308-14-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <np9BF2NhDuE.A.f1B.kwbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2740
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-14-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:24:20 +0000 (UTC)

Pass the few limits mtd_blkdevs imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index b8878a2457afa7..3caa0717d46c01 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -277,6 +277,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 {
 	struct mtd_blktrans_ops *tr = new->tr;
 	struct mtd_blktrans_dev *d;
+	struct queue_limits lim = { };
 	int last_devnum = -1;
 	struct gendisk *gd;
 	int ret;
@@ -331,9 +332,13 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 			BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
 	if (ret)
 		goto out_kfree_tag_set;
+	
+	lim.logical_block_size = tr->blksize;
+	if (tr->discard)
+		lim.max_hw_discard_sectors = UINT_MAX;
 
 	/* Create gendisk */
-	gd = blk_mq_alloc_disk(new->tag_set, NULL, new);
+	gd = blk_mq_alloc_disk(new->tag_set, &lim, new);
 	if (IS_ERR(gd)) {
 		ret = PTR_ERR(gd);
 		goto out_free_tag_set;
@@ -371,14 +376,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (tr->flush)
 		blk_queue_write_cache(new->rq, true, false);
 
-	blk_queue_logical_block_size(new->rq, tr->blksize);
-
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, new->rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
 
-	if (tr->discard)
-		blk_queue_max_discard_sectors(new->rq, UINT_MAX);
-
 	gd->queue = new->rq;
 
 	if (new->readonly)
-- 
2.39.2

