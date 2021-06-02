Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 776053983AC
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:57:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 46EA3206E6; Wed,  2 Jun 2021 07:57:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:57:21 2021
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
	by bendel.debian.org (Postfix) with ESMTP id E249C206C1
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:40:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DPTD9hQ4xkV0 for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:40:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9967B206E5
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qi7AU80Oz7hj4K5BUy3Hu3UJMfMiprlsOMq1LlDbVww=; b=wfnn0CGP9teCIUigpA0cLAiCEG
	XaYeXRoQvQOrEfJFcuxKu18rxlCj9kAVnqYvA6ffbosWHxomIXQsSArr+ftwbguMp5SU3M9/bmk0L
	bqzQ8XiTRZ6QBfzP4K/UHsKW47GVQnDBFuGf6p23+3crdLQ2ThNz4kvRi6KgNmbzK/nin+yjIgWxz
	6kQGuIL3DvYz9Jv29HP0rZaCMuA/qvMMWQpgEREhwRn38bXZiX53OXpalBkps4hZhmquoC2R0dNpO
	luUD0oRku7pr6gfgS8FYvxXuSkXea92js4/YEKQkinqriGTLqiSIzKawm91/GTGJJNVz/av0Gu21E
	TAsHH4GQ==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKm6-0025Ys-7i; Wed, 02 Jun 2021 06:54:47 +0000
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
Subject: [PATCH 11/30] swim3: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:26 +0300
Message-Id: <20210602065345.355274-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XM4hhW1AZSL.A.2jG.hnztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1194
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-12-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:57:21 +0000 (UTC)

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/swim3.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index a515d0c1d2cb..965af0a3e95b 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1202,30 +1202,27 @@ static int swim3_attach(struct macio_dev *mdev,
 			return rc;
 	}
 
-	disk = alloc_disk(1);
-	if (disk == NULL) {
-		rc = -ENOMEM;
-		goto out_unregister;
-	}
-
 	fs = &floppy_states[floppy_count];
 	memset(fs, 0, sizeof(*fs));
 
-	disk->queue = blk_mq_init_sq_queue(&fs->tag_set, &swim3_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(disk->queue)) {
-		rc = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		goto out_put_disk;
+	rc = blk_mq_alloc_sq_tag_set(&fs->tag_set, &swim3_mq_ops, 2,
+			BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
+		goto out_unregister;
+
+	disk = blk_mq_alloc_disk(&fs->tag_set, fs);
+	if (IS_ERR(disk)) {
+		rc = PTR_ERR(disk);
+		goto out_free_tag_set;
 	}
-	disk->queue->queuedata = fs;
 
 	rc = swim3_add_device(mdev, floppy_count);
 	if (rc)
-		goto out_cleanup_queue;
+		goto out_cleanup_disk;
 
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = floppy_count;
+	disk->minors = 1;
 	disk->fops = &floppy_fops;
 	disk->private_data = fs;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
@@ -1237,12 +1234,10 @@ static int swim3_attach(struct macio_dev *mdev,
 	disks[floppy_count++] = disk;
 	return 0;
 
-out_cleanup_queue:
-	blk_cleanup_queue(disk->queue);
-	disk->queue = NULL;
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
+out_free_tag_set:
 	blk_mq_free_tag_set(&fs->tag_set);
-out_put_disk:
-	put_disk(disk);
 out_unregister:
 	if (floppy_count == 0)
 		unregister_blkdev(FLOPPY_MAJOR, "fd");
-- 
2.30.2

