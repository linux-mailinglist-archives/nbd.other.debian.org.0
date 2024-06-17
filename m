Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B490A565
	for <lists+nbd@lfdr.de>; Mon, 17 Jun 2024 08:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 42FAC20FCD; Mon, 17 Jun 2024 06:23:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 17 06:23:17 2024
Old-Return-Path: <BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5E7712118C
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 Jun 2024 06:06:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rWkLzsGBdURW for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 Jun 2024 06:06:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DC91521188
	for <nbd@other.debian.org>; Mon, 17 Jun 2024 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Ehwi9XwmCWVOUn2mUiA9tAgE4ehpoZw+qtTIhW3bZ98=; b=b5fuAR9TpDmNCNYT10KjVNVORL
	bhlzMRDqbc+gBpQCMf6xKCzaCmt81etF37Hfc5GNaF+0Z28NBjv3vPGGuIk0Xyt6kTEE+NWbGeZyZ
	h6Q/t7+7IbfjYXP/wOi6yFmM/Aljo7LuWZejVUJJbH+B4KzYBh42aNhJ1xQxtuTsR8htCxIZdw4ig
	e/dc4UJumZkiGeO2ijwxW0xoScDAwbsnVI/3mm4hsHagmG67EpCXpTQtwwznBA4GBXM0HSRKedrwi
	t/TMBViLWu9lh4AmI0TQMwSzBaVPIx9UgQuB8lyYpIaamAqcXrWYoFio8OG8eE2Rrj/s4+u6fInAv
	0AhJ0xvA==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5VD-00000009IVS-3gIx;
	Mon, 17 Jun 2024 06:06:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 10/26] nbd: move setting the cache control flags to __nbd_set_size
Date: Mon, 17 Jun 2024 08:04:37 +0200
Message-ID: <20240617060532.127975-11-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SxQtGOTQyUO.A.LsWD.VZ9bmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3023
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240617060532.127975-11-hch@lst.de
Resent-Date: Mon, 17 Jun 2024 06:23:17 +0000 (UTC)

Move setting the cache control flags in nbd in preparation for moving
these flags into the queue_limits structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/block/nbd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ad887d614d5b3f..44b8c671921e5c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -342,6 +342,12 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		lim.max_hw_discard_sectors = UINT_MAX;
 	else
 		lim.max_hw_discard_sectors = 0;
+	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH))
+		blk_queue_write_cache(nbd->disk->queue, false, false);
+	else if (nbd->config->flags & NBD_FLAG_SEND_FUA)
+		blk_queue_write_cache(nbd->disk->queue, true, true);
+	else
+		blk_queue_write_cache(nbd->disk->queue, true, false);
 	lim.logical_block_size = blksize;
 	lim.physical_block_size = blksize;
 	error = queue_limits_commit_update(nbd->disk->queue, &lim);
@@ -1286,19 +1292,10 @@ static void nbd_bdev_reset(struct nbd_device *nbd)
 
 static void nbd_parse_flags(struct nbd_device *nbd)
 {
-	struct nbd_config *config = nbd->config;
-	if (config->flags & NBD_FLAG_READ_ONLY)
+	if (nbd->config->flags & NBD_FLAG_READ_ONLY)
 		set_disk_ro(nbd->disk, true);
 	else
 		set_disk_ro(nbd->disk, false);
-	if (config->flags & NBD_FLAG_SEND_FLUSH) {
-		if (config->flags & NBD_FLAG_SEND_FUA)
-			blk_queue_write_cache(nbd->disk->queue, true, true);
-		else
-			blk_queue_write_cache(nbd->disk->queue, true, false);
-	}
-	else
-		blk_queue_write_cache(nbd->disk->queue, false, false);
 }
 
 static void send_disconnects(struct nbd_device *nbd)
-- 
2.43.0

