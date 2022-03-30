Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE654EBA4C
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:45:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C29FE2153F; Wed, 30 Mar 2022 05:45:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:45:21 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 95B6A21541
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:29:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tvmCwseVeatP for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:29:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7607D20143
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DDP0HPj6K7Sy805ftOyLrgXZ6H2ZFEDnovzc8W3ZFbI=; b=It+3nQv7bamYXP7V+ozXXGjGaq
	LKGJNH0ncaxFKTpjy7dE6e4+VAL1C2Kx1jeNpPV8W691+0zavoj+bsA7bKppRJZYchdwB4fEg4cMt
	lebJfdpQ7CCndQoQvUhEVZoHNJ6lvcyquOYzgEVkxjyKn/mcD5eM1sHjnzXzbIrIye3NtHSBPqHXG
	rXtNCgs/yRtIsukTPVTyBosWJCAo9qajcVhET6uupboZnVY6e7UanPVkrjI+6DTVhJKyU54U5vPdH
	5TK+cr9ryNfpnItGMTfmYDXAbpJYFlL+pkoj5iM2Dj6tmIT7tUf6ldBFPImf7RAeIM3lkmvM3m8BS
	i78SGQxw==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQtc-00ELBs-9M; Wed, 30 Mar 2022 05:29:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 02/15] zram: cleanup reset_store
Date: Wed, 30 Mar 2022 07:29:04 +0200
Message-Id: <20220330052917.2566582-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pNhnHQJ2NyB.A.wn.x5-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1824
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-3-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:45:21 +0000 (UTC)

Use a local variable for the gendisk instead of the part0 block_device,
as the gendisk is what this function actually operates on.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/zram/zram_drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index e9474b02012de..fd83fad59beb1 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1786,7 +1786,7 @@ static ssize_t reset_store(struct device *dev,
 	int ret;
 	unsigned short do_reset;
 	struct zram *zram;
-	struct block_device *bdev;
+	struct gendisk *disk;
 
 	ret = kstrtou16(buf, 10, &do_reset);
 	if (ret)
@@ -1796,26 +1796,26 @@ static ssize_t reset_store(struct device *dev,
 		return -EINVAL;
 
 	zram = dev_to_zram(dev);
-	bdev = zram->disk->part0;
+	disk = zram->disk;
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
+	mutex_lock(&disk->open_mutex);
 	/* Do not reset an active device or claimed device */
-	if (bdev->bd_openers || zram->claim) {
-		mutex_unlock(&bdev->bd_disk->open_mutex);
+	if (disk->part0->bd_openers || zram->claim) {
+		mutex_unlock(&disk->open_mutex);
 		return -EBUSY;
 	}
 
 	/* From now on, anyone can't open /dev/zram[0-9] */
 	zram->claim = true;
-	mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_unlock(&disk->open_mutex);
 
 	/* Make sure all the pending I/O are finished */
-	sync_blockdev(bdev);
+	sync_blockdev(disk->part0);
 	zram_reset_device(zram);
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
+	mutex_lock(&disk->open_mutex);
 	zram->claim = false;
-	mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_unlock(&disk->open_mutex);
 
 	return len;
 }
-- 
2.30.2

