Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D8961855B8C
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:23:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE36420950; Thu, 15 Feb 2024 07:23:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:23:08 2024
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
	by bendel.debian.org (Postfix) with ESMTP id B407820C24
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gx5OVLJgj6yb for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7C94320C26
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Od2gUUs5DLG3Gw+tTDh1Q5WwgEseXZXNxX3GosZewcY=; b=l9p86yy3wVCNRe2LlsM+yFEfE/
	xLNLqunPqG/jtWWbCC31cdh1G5Hvkcmvb+VpFIrc6FhQsmGgsdU+nCPUar6582teIfZEXj9DnCib1
	3xeyZy0r3BbFIr+qM7NueuszQj+sJ5LEAtAAu+1M/2G/s9KqMOROR0Sp+FELuUV+sL2uHLGW+S8Uu
	QQSYgljbmyBT2gNIqZMJoEatZUpBsUp1I0cr3GCOw96g6CVjks3bX/x92WLGycaL1x7rtoZzRZQw8
	+cbBENE2nsv+Z6tqI8d1ZKaPELihRqUGK1qsw07TRzqgH1NWP1z31U9atE2/EtRVlxBOoPmlDGCj3
	szSf5Skw==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmN-0000000FAY2-0VaO;
	Thu, 15 Feb 2024 07:03:31 +0000
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
Subject: [PATCH 09/17] sunvdc: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:52 +0100
Message-Id: <20240215070300.2200308-10-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eH2DZA-TsxB.A.vNB.cvbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2735
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-10-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:23:08 +0000 (UTC)

Pass the few limits sunvdc imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sunvdc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index a1f74dd1eae5d5..c99dd6698977ea 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -784,6 +784,14 @@ static const struct blk_mq_ops vdc_mq_ops = {
 
 static int probe_disk(struct vdc_port *port)
 {
+	struct queue_limits lim = {
+		.physical_block_size		= port->vdisk_phys_blksz,
+		.max_hw_sectors			= port->max_xfer_size,
+		/* Each segment in a request is up to an aligned page in size. */
+		.seg_boundary_mask		= PAGE_SIZE - 1,
+		.max_segment_size		= PAGE_SIZE,
+		.max_segments			= port->ring_cookies,
+	};
 	struct request_queue *q;
 	struct gendisk *g;
 	int err;
@@ -824,7 +832,7 @@ static int probe_disk(struct vdc_port *port)
 	if (err)
 		return err;
 
-	g = blk_mq_alloc_disk(&port->tag_set, NULL, port);
+	g = blk_mq_alloc_disk(&port->tag_set, &lim, port);
 	if (IS_ERR(g)) {
 		printk(KERN_ERR PFX "%s: Could not allocate gendisk.\n",
 		       port->vio.name);
@@ -835,12 +843,6 @@ static int probe_disk(struct vdc_port *port)
 	port->disk = g;
 	q = g->queue;
 
-	/* Each segment in a request is up to an aligned page in size. */
-	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
-	blk_queue_max_segment_size(q, PAGE_SIZE);
-
-	blk_queue_max_segments(q, port->ring_cookies);
-	blk_queue_max_hw_sectors(q, port->max_xfer_size);
 	g->major = vdc_major;
 	g->first_minor = port->vio.vdev->dev_no << PARTITION_SHIFT;
 	g->minors = 1 << PARTITION_SHIFT;
@@ -872,8 +874,6 @@ static int probe_disk(struct vdc_port *port)
 		}
 	}
 
-	blk_queue_physical_block_size(q, port->vdisk_phys_blksz);
-
 	pr_info(PFX "%s: %u sectors (%u MB) protocol %d.%d\n",
 	       g->disk_name,
 	       port->vdisk_size, (port->vdisk_size >> (20 - 9)),
-- 
2.39.2

