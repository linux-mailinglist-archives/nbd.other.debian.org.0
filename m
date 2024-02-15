Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224C855B89
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:22:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6444F204B6; Thu, 15 Feb 2024 07:22:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:22:35 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 84A1F20C28
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pFRYH7sv8DIf for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2638F20C22
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=fO86to3JpnoSw+kPoKux0mH6/s9bHY6TbVb09I4Zy+8=; b=vEZCMLqrk2MiK4sOPPGSUgw+PB
	TbZ+7r9cMOJymMW2o6DAG3hPHUQl/60B2dRNTETu+jaI1BgsT4WiSbex2/NkFoatvWym+EnOQI8f3
	plXhf9/KUxypZ1kC64pGRm2FA20QQQKcxlDCCNlKBZzObX/n3dFqrnhY7X1mSkPorueMSVVgGNqES
	jF5FfR2kBpOWflVY/gNiERWOpOiSRsg6mXiD9/Lva7M2banofRHyWEdEJkCBv1pUuehkHfcusZuMH
	se7GUKwxqI0xbRu4YG40rJJsHmXSNRNaoYHzce+1lyEPHY5ZFRluZQwrhdpt1FmuybY7eObdYXgeZ
	wbEkVFjg==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmC-0000000FAQx-0hfK;
	Thu, 15 Feb 2024 07:03:20 +0000
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
Subject: [PATCH 05/17] nbd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:48 +0100
Message-Id: <20240215070300.2200308-6-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sW_tdgr8gdO.A.WDB.7ubzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2733
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-6-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:22:35 +0000 (UTC)

Pass the few limits nbd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 30ae3cc12e7787..1038311462d083 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1783,6 +1783,12 @@ static const struct blk_mq_ops nbd_mq_ops = {
 
 static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 {
+	struct queue_limits lim = {
+		.max_hw_sectors		= 65536,
+		.max_user_sectors	= 256,
+		.max_segments		= USHRT_MAX,
+		.max_segment_size	= UINT_MAX,
+	};
 	struct nbd_device *nbd;
 	struct gendisk *disk;
 	int err = -ENOMEM;
@@ -1823,7 +1829,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	if (err < 0)
 		goto out_free_tags;
 
-	disk = blk_mq_alloc_disk(&nbd->tag_set, NULL, NULL);
+	disk = blk_mq_alloc_disk(&nbd->tag_set, &lim, NULL);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_free_idr;
@@ -1843,11 +1849,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	 * Tell the block layer that we are not a rotational device
 	 */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
-	blk_queue_max_discard_sectors(disk->queue, 0);
-	blk_queue_max_segment_size(disk->queue, UINT_MAX);
-	blk_queue_max_segments(disk->queue, USHRT_MAX);
-	blk_queue_max_hw_sectors(disk->queue, 65536);
-	disk->queue->limits.max_sectors = 256;
 
 	mutex_init(&nbd->config_lock);
 	refcount_set(&nbd->config_refs, 0);
-- 
2.39.2

