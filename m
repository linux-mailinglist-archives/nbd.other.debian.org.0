Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AED9F4E5FF8
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 09:10:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 899452025B; Thu, 24 Mar 2022 08:10:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 08:10:04 2022
Old-Return-Path: <BATV+3868aa8635b3ec16ad0d+6787+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A5113202CA
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 07:51:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gofiC9EXN-OB for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 07:51:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D44EF202D4
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=L9NaivrQAjx/PYKJJ2AOWN4vKDzcb3bJ3lmGJecxp6w=; b=Ccgm+ESyXllZTbEnchfQK9Ua+1
	HIiY0y+Cy4ugaKwrGa9uJKnDq7xI456jg96CnwvC/6dQDWc/vpWxpmpQsYQnyKCO3q3RpHr4pNFxh
	S8Uo1jGRxDopE0fcaq1KSPwcE3263amxWBK+Xk2hZjnKaKLuz1PGj+o6JwUojTwLW8Nl2emNjM7oH
	+ofWgijuZ0Dd/zWF+yKAgTlP4CGawmcp8yhZg/0s642A80oTimBMe++kkSS0cx2XepjdzKYaCXMbb
	SDa5t7rQ6jcs8Uz/fALs5qZ/jDVZSBcQc4ri431SlIpEpM8m4kYnlFdGj2OP2oiMzY183WNV52sv9
	NBHuOPlw==;
Received: from [2001:4bb8:19a:b822:f71:16c0:5841:924e] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIFp-00FzVH-Oj; Thu, 24 Mar 2022 07:51:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 05/13] block: turn bdev->bd_openers into an atomic_t
Date: Thu, 24 Mar 2022 08:51:11 +0100
Message-Id: <20220324075119.1556334-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220324075119.1556334-1-hch@lst.de>
References: <20220324075119.1556334-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YLheBKyYCpI.A.4yG.cdCPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1756
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324075119.1556334-6-hch@lst.de
Resent-Date: Thu, 24 Mar 2022 08:10:04 +0000 (UTC)

All manipulation of bd_openers is under disk->open_mutex and will remain
so for the foreseeable future.  But at least one place reads it without
the lock (blkdev_get) and there are more to be added.  So make sure the
compiler does not do turn the increments and decrements into non-atomic
sequences by using an atomic_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c              | 16 ++++++++--------
 block/partitions/core.c   |  2 +-
 include/linux/blk_types.h |  2 +-
 include/linux/blkdev.h    |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 13de871fa8169..7bf88e591aaf3 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -673,17 +673,17 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
 		}
 	}
 
-	if (!bdev->bd_openers)
+	if (!atomic_read(&bdev->bd_openers))
 		set_init_blocksize(bdev);
 	if (test_bit(GD_NEED_PART_SCAN, &disk->state))
 		bdev_disk_changed(disk, false);
-	bdev->bd_openers++;
+	atomic_inc(&bdev->bd_openers);
 	return 0;
 }
 
 static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
 {
-	if (!--bdev->bd_openers)
+	if (atomic_dec_and_test(&bdev->bd_openers))
 		blkdev_flush_mapping(bdev);
 	if (bdev->bd_disk->fops->release)
 		bdev->bd_disk->fops->release(bdev->bd_disk, mode);
@@ -694,7 +694,7 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
 	struct gendisk *disk = part->bd_disk;
 	int ret;
 
-	if (part->bd_openers)
+	if (atomic_read(&part->bd_openers))
 		goto done;
 
 	ret = blkdev_get_whole(bdev_whole(part), mode);
@@ -708,7 +708,7 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
 	disk->open_partitions++;
 	set_init_blocksize(part);
 done:
-	part->bd_openers++;
+	atomic_inc(&part->bd_openers);
 	return 0;
 
 out_blkdev_put:
@@ -720,7 +720,7 @@ static void blkdev_put_part(struct block_device *part, fmode_t mode)
 {
 	struct block_device *whole = bdev_whole(part);
 
-	if (--part->bd_openers)
+	if (!atomic_dec_and_test(&part->bd_openers))
 		return;
 	blkdev_flush_mapping(part);
 	whole->bd_disk->open_partitions--;
@@ -899,7 +899,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (bdev->bd_openers == 1)
+	if (atomic_read(&bdev->bd_openers) == 1)
 		sync_blockdev(bdev);
 
 	mutex_lock(&disk->open_mutex);
@@ -1044,7 +1044,7 @@ void sync_bdevs(bool wait)
 		bdev = I_BDEV(inode);
 
 		mutex_lock(&bdev->bd_disk->open_mutex);
-		if (!bdev->bd_openers) {
+		if (!atomic_read(&bdev->bd_openers)) {
 			; /* skip */
 		} else if (wait) {
 			/*
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 2ef8dfa1e5c85..373ed748dcf26 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -486,7 +486,7 @@ int bdev_del_partition(struct gendisk *disk, int partno)
 		goto out_unlock;
 
 	ret = -EBUSY;
-	if (part->bd_openers)
+	if (atomic_read(&part->bd_openers))
 		goto out_unlock;
 
 	delete_partition(part);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 0c3563b45fe90..b1ced43ed0d3f 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -44,7 +44,7 @@ struct block_device {
 	unsigned long		bd_stamp;
 	bool			bd_read_only;	/* read-only policy */
 	dev_t			bd_dev;
-	int			bd_openers;
+	atomic_t		bd_openers;
 	struct inode *		bd_inode;	/* will die */
 	struct super_block *	bd_super;
 	void *			bd_claiming;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 9824ebc9b4d31..6b7c5af1d01df 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -188,7 +188,7 @@ static inline bool disk_live(struct gendisk *disk)
  */
 static inline unsigned int disk_openers(struct gendisk *disk)
 {
-	return disk->part0->bd_openers;
+	return atomic_read(&disk->part0->bd_openers);
 }
 
 /*
-- 
2.30.2

