Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72239834F
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7794E206E6; Wed,  2 Jun 2021 07:42:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:42:21 2021
Old-Return-Path: <BATV+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E1872206C7
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:26:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.97 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D56nWDQCWCWY for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:26:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 28FD9206B9
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VrhBOXpqbc1/w6Vz4TvYYyGic8czOTYvar2owBC0Nao=; b=M0oF4rS9JAR1tnscAYGs3Ny4Aw
	R0M734kT6ibhdEiE624YEKsyPPj2YIu9zEGz0wkFfjwV4WFPnIh+1qyKDWdZ3z8EzlkVFGAb8Dcf7
	3V8VbExj8uNId3jTIdf48776+H/+fLIW8cknoNSzbxVEsD1AHyQD0KcKh763iNg2evMPCysdTxB14
	ax5A/5pAgqFYu/FRgKYessRM0Gxr+BcwAdKdzvnS3J8oKCUIv74U/fN2dbR6gw8G1XrC9oJZoC90l
	B8UJw9Kz7LkEpdXWVakEj3I01Qm/fH4nuPfSRHY69/phvcTpV74SAlSbAP7u3gkCl0yYJXtqgKgJ3
	bYIwaHtg==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKls-0025R4-W9; Wed, 02 Jun 2021 06:54:33 +0000
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
Subject: [PATCH 08/30] mspro: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:23 +0300
Message-Id: <20210602065345.355274-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xqHArOER-rF.A.XuC.dZztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1183
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-9-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:42:21 +0000 (UTC)

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/mspro_block.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index cf7fe0d58ee7..22778d0e24f5 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1205,21 +1205,17 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	if (disk_id < 0)
 		return disk_id;
 
-	msb->disk = alloc_disk(1 << MSPRO_BLOCK_PART_SHIFT);
-	if (!msb->disk) {
-		rc = -ENOMEM;
+	rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &mspro_mq_ops, 2,
+				     BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
 		goto out_release_id;
-	}
 
-	msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &mspro_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(msb->queue)) {
-		rc = PTR_ERR(msb->queue);
-		msb->queue = NULL;
-		goto out_put_disk;
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
+	if (IS_ERR(msb->disk)) {
+		rc = PTR_ERR(msb->disk);
+		goto out_free_tag_set;
 	}
-
-	msb->queue->queuedata = card;
+	msb->queue = msb->disk->queue;
 
 	blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
 	blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
@@ -1228,10 +1224,10 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	msb->disk->major = major;
 	msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
+	msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
 	msb->disk->fops = &ms_block_bdops;
 	msb->usage_count = 1;
 	msb->disk->private_data = msb;
-	msb->disk->queue = msb->queue;
 
 	sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
 
@@ -1247,8 +1243,8 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	msb->active = 1;
 	return 0;
 
-out_put_disk:
-	put_disk(msb->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
 	mutex_lock(&mspro_block_disk_lock);
 	idr_remove(&mspro_block_disk_idr, disk_id);
-- 
2.30.2

