Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F151B398307
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8415206E4; Wed,  2 Jun 2021 07:31:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:31:29 2021
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
	by bendel.debian.org (Postfix) with ESMTP id A5019206CC
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:15:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iPmrvlwfsuby for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:15:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DC34E206C8
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KlBRFDn8CKBuz4Jtw5oxvJwFPJCrn3leZL7f/TB5v/I=; b=JAbKOuEt/ZwlI1Cb8jU8PIVTi0
	rWrP2Q0oyjZ1qHxdn5YfZWmZGCE1OX7t/Z5qHClzdMNkXAAV2MvEk5MtF+zy9GIwLRfySkORmJitv
	hBUNmjxZRc5StQgvgrScxkKXoprJTIDdzdZyS8U/8FI6Ub7l742n47gp+1BOs+WlJvaHsKwHFkDWB
	xBui56bbOzKQ99aHIVAIpMOWuKdRjPxfD/L6mOHl825ZMYqNbqTRQR2bdCKOIAofpqO2q95xIdQCk
	qchgx4WVGIXqbErN5FqxXen4FaqChWEu053VwmNbr8IDVXg22x1cC2laSwL86K80z+bhdU0MJo1y9
	XRk5+uaA==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKln-0025P8-FW; Wed, 02 Jun 2021 06:54:28 +0000
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
Subject: [PATCH 07/30] ms_block: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:22 +0300
Message-Id: <20210602065345.355274-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jteJPtVq5ZL.A.tJH.RPztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1178
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-8-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:31:29 +0000 (UTC)

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index 0bacf4268f83..dac258d12aca 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
 	if (msb->disk_id  < 0)
 		return msb->disk_id;
 
-	msb->disk = alloc_disk(0);
-	if (!msb->disk) {
-		rc = -ENOMEM;
+	rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
+				     BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
 		goto out_release_id;
-	}
 
-	msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
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
 
 	blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
 	blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
@@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
 	sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
 	msb->disk->fops = &msb_bdops;
 	msb->disk->private_data = msb;
-	msb->disk->queue = msb->queue;
 
 	capacity = msb->pages_in_block * msb->logical_block_count;
 	capacity *= (msb->page_size / 512);
@@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
 	dbg("Disk added");
 	return 0;
 
-out_put_disk:
-	put_disk(msb->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
 	mutex_lock(&msb_disk_lock);
 	idr_remove(&msb_disk_idr, msb->disk_id);
-- 
2.30.2

