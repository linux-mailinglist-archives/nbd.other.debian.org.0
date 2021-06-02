Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20F3983E5
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 10:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F3EE20663; Wed,  2 Jun 2021 08:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 08:12:09 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 3F48F20654
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:54:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oY_bugo06bLp for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:54:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8723420626
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5ce2JiRw1Xfew42Ze/lpHvPyVGAKQBeRUdFT9myuT9Y=; b=D3gIVkolzefyEuZRqpxqbTjD1/
	me+j80WuDmIEDCJoCJJi3EaA6ZCyWCHg/zV//LKDbuT47z7Uv/x4kG2fPmshfH/L7rjbpzOatrjCm
	ARVjVeFvQjsO3HUvF2D9OqnaTSbbV853xQhgkz8ti5uaY4uAnMmLFziTNlF8DV+PTEuHXC3T5Pive
	LO7ao7bFh4VNXvbPzkbKc4TXiRq98YZ/TLJxnVtZ5DgjQkmVu3QKesdVOoc5Nq3l6loa9nnM9JqI4
	k1sn5uw5l5Y+eo2X4wE+smW+Tw3NfDakiaWjXDN2Xlkt/Jo9eltYtyzKb8C/e2tK4DiSGkIBOzcFb
	t7mn9Egw==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKmA-0025cC-BJ; Wed, 02 Jun 2021 06:54:50 +0000
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
Subject: [PATCH 12/30] swim: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:27 +0300
Message-Id: <20210602065345.355274-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <h8WSgA8P57K.A.yVD.Z1ztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1196
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-13-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 08:12:09 +0000 (UTC)

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/swim.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 2917b21f48ff..7ccc8d2a41bc 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -800,23 +800,20 @@ static int swim_floppy_init(struct swim_priv *swd)
 	spin_lock_init(&swd->lock);
 
 	for (drive = 0; drive < swd->floppy_count; drive++) {
-		struct request_queue *q;
-
-		swd->unit[drive].disk = alloc_disk(1);
-		if (swd->unit[drive].disk == NULL) {
-			err = -ENOMEM;
+		err = blk_mq_alloc_sq_tag_set(&swd->unit[drive].tag_set,
+				&swim_mq_ops, 2, BLK_MQ_F_SHOULD_MERGE);
+		if (err)
 			goto exit_put_disks;
-		}
 
-		q = blk_mq_init_sq_queue(&swd->unit[drive].tag_set, &swim_mq_ops,
-						2, BLK_MQ_F_SHOULD_MERGE);
-		if (IS_ERR(q)) {
-			err = PTR_ERR(q);
+		swd->unit[drive].disk =
+			blk_mq_alloc_disk(&swd->unit[drive].tag_set,
+					  &swd->unit[drive]);
+		if (IS_ERR(swd->unit[drive].disk)) {
+			blk_mq_free_tag_set(&swd->unit[drive].tag_set);
+			err = PTR_ERR(swd->unit[drive].disk);
 			goto exit_put_disks;
 		}
 
-		swd->unit[drive].disk->queue = q;
-		swd->unit[drive].disk->queue->queuedata = &swd->unit[drive];
 		swd->unit[drive].swd = swd;
 	}
 
@@ -824,6 +821,7 @@ static int swim_floppy_init(struct swim_priv *swd)
 		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
 		swd->unit[drive].disk->major = FLOPPY_MAJOR;
 		swd->unit[drive].disk->first_minor = drive;
+		swd->unit[drive].disk->minors = 1;
 		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
 		swd->unit[drive].disk->fops = &floppy_fops;
 		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -839,14 +837,10 @@ static int swim_floppy_init(struct swim_priv *swd)
 	do {
 		struct gendisk *disk = swd->unit[drive].disk;
 
-		if (disk) {
-			if (disk->queue) {
-				blk_cleanup_queue(disk->queue);
-				disk->queue = NULL;
-			}
-			blk_mq_free_tag_set(&swd->unit[drive].tag_set);
-			put_disk(disk);
-		}
+		if (!disk)
+			continue;
+		blk_cleanup_disk(disk);
+		blk_mq_free_tag_set(&swd->unit[drive].tag_set);
 	} while (drive--);
 	return err;
 }
-- 
2.30.2

