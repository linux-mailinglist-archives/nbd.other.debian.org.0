Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D808855B8D
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:23:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 744FA20955; Thu, 15 Feb 2024 07:23:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:23:22 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 2F6562064B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FcZ3s7CR0WWE for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 35BEB2063B
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7iRPP0Y2sQPPXepK66WXjtmMtqZPIO8zH2dnYYQNfr0=; b=i3XHwKJcfIcKJoCvBoRZOESgzz
	Xm/uYgt9/6UmS8XkN7/iD0tSMZYJiLloFlL+IUOG02AQcQBjVPo6uancUZFrwPZxyPoyKhyhRYHX4
	dyO2MBJHiBwkrJN76c/aesm9VXKEV/3OzbFlnLigrYoC4XPgJ3Sdd3JAA/agPG+9aLhkv2tqRa2+F
	4XEMXcrvLEyaeOqPmaFV05tpeqE5N0THHlx0N77s5+R36hwEdcYLKcrBaPdx8aWxjV83dU5q3V4XU
	VdiyLklI4XlLYcv0/QtTuG0a6sgApGShZXYdP23Ss8BL70M1g8h5wGt7OuUIv5+3qX7H+d7R5RhFd
	4/7A/KPQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmP-0000000FAb7-3OYC;
	Thu, 15 Feb 2024 07:03:34 +0000
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
Subject: [PATCH 10/17] gdrom: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:53 +0100
Message-Id: <20240215070300.2200308-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4YH07SHRRSJ.A.dSB.qvbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2736
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-11-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:23:22 +0000 (UTC)

Pass the few limits gdrom imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/cdrom/gdrom.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 1d044779f5e42a..9398beeb5d1e89 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -724,11 +724,6 @@ static void probe_gdrom_setupdisk(void)
 
 static int probe_gdrom_setupqueue(void)
 {
-	blk_queue_logical_block_size(gd.gdrom_rq, GDROM_HARD_SECTOR);
-	/* using DMA so memory will need to be contiguous */
-	blk_queue_max_segments(gd.gdrom_rq, 1);
-	/* set a large max size to get most from DMA */
-	blk_queue_max_segment_size(gd.gdrom_rq, 0x40000);
 	gd.disk->queue = gd.gdrom_rq;
 	return gdrom_init_dma_mode();
 }
@@ -743,6 +738,13 @@ static const struct blk_mq_ops gdrom_mq_ops = {
  */
 static int probe_gdrom(struct platform_device *devptr)
 {
+	struct queue_limits lim = {
+		.logical_block_size		= GDROM_HARD_SECTOR,
+		/* using DMA so memory will need to be contiguous */
+		.max_segments			= 1,
+		/* set a large max size to get most from DMA */
+		.max_segment_size		= 0x40000,
+	};
 	int err;
 
 	/*
@@ -778,7 +780,7 @@ static int probe_gdrom(struct platform_device *devptr)
 	if (err)
 		goto probe_fail_free_cd_info;
 
-	gd.disk = blk_mq_alloc_disk(&gd.tag_set, NULL, NULL);
+	gd.disk = blk_mq_alloc_disk(&gd.tag_set, &lim, NULL);
 	if (IS_ERR(gd.disk)) {
 		err = PTR_ERR(gd.disk);
 		goto probe_fail_free_tag_set;
-- 
2.39.2

