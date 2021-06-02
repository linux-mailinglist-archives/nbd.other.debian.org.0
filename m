Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1905398301
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C8424206D5; Wed,  2 Jun 2021 07:30:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:30:33 2021
Old-Return-Path: <BATV+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 686D5206C5
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:14:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id k-Ai2bEFuXOY for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:14:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A4B9D2060A
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=itoIfl0lOn3PjkK+CaoYHstG5XDmIyS+X3zd0fvSPIM=; b=bhWE2wpHQl41sfsjCXEfpYjcLR
	nmreDYw+q1yPr6HX9B86hwxNp6nZ2Tnhh1KaILqMkYW4Y4qsc6sKDqxr3JfzzlCVpsVZXiDriGbCZ
	Y1kvrYb+ETid8liK1mxwid55k+FW8rcCy2J/MzUAKhHFJvh0OOcWM1xAYYJAYTp672FlIPmWSCfDL
	9pyoh9N5A4twK5q+oFZXZitHcqLsuWTjWUamSh8+v0dco1JdyeSUI/QOzHpsSeMo4cK+uUWipczTX
	1iuWGBvi4yeyTjSdFkWeQcxOVqoNke9pcbsxonDqFmJouTDXz2rxwn7JoK4aW4Gp3nNoPkisDeRe8
	L9x0B1Og==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlc-0025MH-2X; Wed, 02 Jun 2021 06:54:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 05/30] pcd: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:20 +0300
Message-Id: <20210602065345.355274-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PsIyGyGmKz.A.Y9G.ZOztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1173
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-6-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:30:33 +0000 (UTC)

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/paride/pcd.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index 70da8b86ce58..f9cdd11f02f5 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -309,21 +309,19 @@ static void pcd_init_units(void)
 
 	pcd_drive_count = 0;
 	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		struct gendisk *disk = alloc_disk(1);
+		struct gendisk *disk;
 
-		if (!disk)
+		if (blk_mq_alloc_sq_tag_set(&cd->tag_set, &pcd_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE))
 			continue;
 
-		disk->queue = blk_mq_init_sq_queue(&cd->tag_set, &pcd_mq_ops,
-						   1, BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(disk->queue)) {
-			disk->queue = NULL;
-			put_disk(disk);
+		disk = blk_mq_alloc_disk(&cd->tag_set, cd);
+		if (IS_ERR(disk)) {
+			blk_mq_free_tag_set(&cd->tag_set);
 			continue;
 		}
 
 		INIT_LIST_HEAD(&cd->rq_list);
-		disk->queue->queuedata = cd;
 		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
 		cd->disk = disk;
 		cd->pi = &cd->pia;
@@ -343,6 +341,7 @@ static void pcd_init_units(void)
 		cd->info.mask = 0;
 		disk->major = major;
 		disk->first_minor = unit;
+		disk->minors = 1;
 		strcpy(disk->disk_name, cd->name);	/* umm... */
 		disk->fops = &pcd_bdops;
 		disk->flags = GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE;
@@ -759,10 +758,8 @@ static int pcd_detect(void)
 	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
 		if (!cd->disk)
 			continue;
-		blk_cleanup_queue(cd->disk->queue);
-		cd->disk->queue = NULL;
+		blk_cleanup_disk(cd->disk);
 		blk_mq_free_tag_set(&cd->tag_set);
-		put_disk(cd->disk);
 	}
 	pi_unregister_driver(par_drv);
 	return -1;
-- 
2.30.2

