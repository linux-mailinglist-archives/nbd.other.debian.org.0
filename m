Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC4855B98
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:24:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 18DA320972; Thu, 15 Feb 2024 07:24:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:24:48 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 27F0220C20
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:04:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3nMe7eE0okVK for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:04:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9F9EF2064B
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DxnmyhvZU++vGdnpFDaWSOJPifrXzsFw9sqifAG0cKk=; b=dLSqTAzCge/kq2H3GTm9MjkFri
	jGHQbIk6cz5uv75+PS/A15N81GEKAjG5g+xrjMyawhj5oNAmf59NzkMmmCwxamu9L9nHIr2AYka3N
	TdCIQsiEVH6CiPJkKei7DjrUCNx7jG335JtrHMD0nELIowXd5ZL97DhesyZiJk5usrPAbN4R0o8J8
	pL6sCqUfDQwGYvstGV910BbdhGTgjUQZprDDPA2+w7xpHHbSKhRVaLhjtjfgd4K+DHiKoe7nwe+R4
	dXDRZ9p0GDE/h+8EuKlik0q9sJEIAsoQagv4UVDxwIvWp53xVXIcYVFgNEsYHx6gljyE0uYwZoloD
	5LElJpbQ==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVme-0000000FAoN-2DEF;
	Thu, 15 Feb 2024 07:03:49 +0000
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
Subject: [PATCH 15/17] scm_blk: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:58 +0100
Message-Id: <20240215070300.2200308-16-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pROro2dQvVB.A.S_B._wbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2742
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-16-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:24:48 +0000 (UTC)

Pass the few limits scm_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/scm_blk.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index d05b2e2799a47a..9f6fdd0daa74eb 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -435,10 +435,17 @@ static const struct blk_mq_ops scm_mq_ops = {
 
 int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 {
-	unsigned int devindex, nr_max_blk;
+	struct queue_limits lim = {
+		.logical_block_size	= 1 << 12,
+	};
+	unsigned int devindex;
 	struct request_queue *rq;
 	int len, ret;
 
+	lim.max_segments = min(scmdev->nr_max_block,
+		(unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
+	lim.max_hw_sectors = lim.max_segments << 3; /* 8 * 512 = blk_size */
+
 	devindex = atomic_inc_return(&nr_devices) - 1;
 	/* scma..scmz + scmaa..scmzz */
 	if (devindex > 701) {
@@ -462,18 +469,12 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	if (ret)
 		goto out;
 
-	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, NULL, scmdev);
+	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, &lim, scmdev);
 	if (IS_ERR(bdev->gendisk)) {
 		ret = PTR_ERR(bdev->gendisk);
 		goto out_tag;
 	}
 	rq = bdev->rq = bdev->gendisk->queue;
-	nr_max_blk = min(scmdev->nr_max_block,
-			 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
-
-	blk_queue_logical_block_size(rq, 1 << 12);
-	blk_queue_max_hw_sectors(rq, nr_max_blk << 3); /* 8 * 512 = blk_size */
-	blk_queue_max_segments(rq, nr_max_blk);
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
 
-- 
2.39.2

