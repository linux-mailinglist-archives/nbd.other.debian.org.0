Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1704E6E65
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 07:57:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9208F20471; Fri, 25 Mar 2022 06:57:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 06:57:31 2022
Old-Return-Path: <BATV+8af3a5752749cd19e826+6788+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2F0312029C
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 06:40:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.641 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rxuZgxT__tu4 for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 06:40:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E47082046A
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 06:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pDGhq6oYWM+hFQ1+Vu/seG4dCcDKNWyq7W0wufvJx9A=; b=OxiV4MCYGInZoy69XXEQfNE0+W
	/F33kM4N2Xt69TlJ+Trrie3AStvXkMJ1R0ngXd0F46GJ6g5JcV4ZIoapu0RY1Awv47XhEHlERxCHT
	H5xLWhJf1/jl5twbJBlq5JXm5k9NGk4GSSBxntpwhSurymVcoxDbIhZamwAWETfCacmsbgomnOYBi
	4NEv+BZsVsuVvl5w5swJXcEYplNbAYz+OLlrSimsRu/hRZfHOUtBOGp1MZasITLPmXYX8oD6dHqKz
	Pey82z+RRssTr4womPYzzMTxH3mIeVmn/8LfsSulhM8ecxGsbtyG3bivBkLoI8Tt//b582qWGIIAr
	2qelOHGQ==;
Received: from 089144194144.atnat0003.highway.a1.net ([89.144.194.144] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXdbw-001HIp-S8; Fri, 25 Mar 2022 06:39:49 +0000
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
Subject: [PATCH 04/14] block: add a disk_openers helper
Date: Fri, 25 Mar 2022 07:39:19 +0100
Message-Id: <20220325063929.1773899-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325063929.1773899-1-hch@lst.de>
References: <20220325063929.1773899-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JWnHYVHzdTC.A.xdH.bfWPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1784
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325063929.1773899-5-hch@lst.de
Resent-Date: Fri, 25 Mar 2022 06:57:31 +0000 (UTC)

Add a helper that returns the openers for a given gendisk to avoid having
drivers poke into disk->part0 to get at this information in a somewhat
cumbersome way.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/nbd.c           |  4 ++--
 drivers/block/zram/zram_drv.c |  4 ++--
 include/linux/blkdev.h        | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2f29da41fbc80..7473f3d4e1270 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1219,7 +1219,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 
 static void nbd_bdev_reset(struct nbd_device *nbd)
 {
-	if (nbd->disk->part0->bd_openers > 1)
+	if (disk_openers(nbd->disk) > 1)
 		return;
 	set_capacity(nbd->disk, 0);
 }
@@ -1579,7 +1579,7 @@ static void nbd_release(struct gendisk *disk, fmode_t mode)
 	struct nbd_device *nbd = disk->private_data;
 
 	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
-			disk->part0->bd_openers == 0)
+			disk_openers(disk) == 0)
 		nbd_disconnect_and_put(nbd);
 
 	nbd_config_put(nbd);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 863606f1722b1..2362385f782a9 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1800,7 +1800,7 @@ static ssize_t reset_store(struct device *dev,
 
 	mutex_lock(&disk->open_mutex);
 	/* Do not reset an active device or claimed device */
-	if (disk->part0->bd_openers || zram->claim) {
+	if (disk_openers(disk) || zram->claim) {
 		mutex_unlock(&disk->open_mutex);
 		return -EBUSY;
 	}
@@ -1990,7 +1990,7 @@ static int zram_remove(struct zram *zram)
 	bool claimed;
 
 	mutex_lock(&zram->disk->open_mutex);
-	if (zram->disk->part0->bd_openers) {
+	if (disk_openers(zram->disk)) {
 		mutex_unlock(&zram->disk->open_mutex);
 		return -EBUSY;
 	}
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index eb27312a1b8f3..9824ebc9b4d31 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -176,6 +176,21 @@ static inline bool disk_live(struct gendisk *disk)
 	return !inode_unhashed(disk->part0->bd_inode);
 }
 
+/**
+ * disk_openers - returns how many openers are there for a disk
+ * @disk: disk to check
+ *
+ * This returns the number of openers for a disk.  Note that this value is only
+ * stable if disk->open_mutex is held.
+ *
+ * Note: Due to a quirk in the block layer open code, each open partition is
+ * only counted once even if there are multiple openers.
+ */
+static inline unsigned int disk_openers(struct gendisk *disk)
+{
+	return disk->part0->bd_openers;
+}
+
 /*
  * The gendisk is refcounted by the part0 block_device, and the bd_device
  * therein is also used for device model presentation in sysfs.
-- 
2.30.2

