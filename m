Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EA200855B93
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:24:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CCE592096A; Thu, 15 Feb 2024 07:24:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:24:06 2024
Old-Return-Path: <BATV+a252b21bd4a653ddb6e6+7480+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9B1732064B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gCtWfBzAdC72 for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2E7BA2063B
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=A4Pldf4zCAjd/e064ywZumh2zeW/Xf3dYRaxsI8nRSk=; b=NUB+VGQjHfTC0Z6RtBD6J/Jo4J
	WkRPC6Y7A8JlADZy2AlpoFuMX+K5K8aPCz1Ca7otIp2kvoOzBB5uCzCHwZrg99Ry/qa0rR8rNT3P8
	kqbiEanEhb759WeNljXX5VTjIZRDhImcQHIvx6MY+30OIzK6fhjysuhg0wQg5BEoAfEpDzLvN/j32
	gdQztuNkNHEdHTM54UkJNIwqmIiah1z8P8rSz9Jwjvr1QjJ9xOJCSvnrQX0jTK9tIaGFzkIoF4Yof
	qzpAZy4RL0GGMPNiTqX1Ns0KMLw4pvvv8jxtTsLeGWhAKZGDVe7q0xMxFnOLfJf/Mi8mxC4A87ZuK
	m1hcCuGA==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmV-0000000FAgD-1jEO;
	Thu, 15 Feb 2024 07:03:40 +0000
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
Subject: [PATCH 12/17] mspro_block: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:55 +0100
Message-Id: <20240215070300.2200308-13-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ROFj5e0DZMO.A.KvB.WwbzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2739
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-13-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:24:06 +0000 (UTC)

Pass the few limits mspro_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/mspro_block.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index db0e2a42ca3c32..49accfdc89d616 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1103,6 +1103,12 @@ static const struct blk_mq_ops mspro_mq_ops = {
 static int mspro_block_init_disk(struct memstick_dev *card)
 {
 	struct mspro_block_data *msb = memstick_get_drvdata(card);
+	struct queue_limits lim = {
+		.logical_block_size	= msb->page_size,
+		.max_hw_sectors		= MSPRO_BLOCK_MAX_PAGES,
+		.max_segments		= MSPRO_BLOCK_MAX_SEGS,
+		.max_segment_size	= MSPRO_BLOCK_MAX_PAGES * msb->page_size,
+	};
 	struct mspro_devinfo *dev_info = NULL;
 	struct mspro_sys_info *sys_info = NULL;
 	struct mspro_sys_attr *s_attr = NULL;
@@ -1138,18 +1144,13 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	if (rc)
 		goto out_release_id;
 
-	msb->disk = blk_mq_alloc_disk(&msb->tag_set, NULL, card);
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, &lim, card);
 	if (IS_ERR(msb->disk)) {
 		rc = PTR_ERR(msb->disk);
 		goto out_free_tag_set;
 	}
 	msb->queue = msb->disk->queue;
 
-	blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
-	blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
-	blk_queue_max_segment_size(msb->queue,
-				   MSPRO_BLOCK_MAX_PAGES * msb->page_size);
-
 	msb->disk->major = major;
 	msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
 	msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
@@ -1158,8 +1159,6 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
 
-	blk_queue_logical_block_size(msb->queue, msb->page_size);
-
 	capacity = be16_to_cpu(sys_info->user_block_count);
 	capacity *= be16_to_cpu(sys_info->block_size);
 	capacity *= msb->page_size >> 9;
-- 
2.39.2

