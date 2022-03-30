Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E34EBA53
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:46:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BF78921545; Wed, 30 Mar 2022 05:46:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:46:05 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 8CCE620143
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:29:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8nN6L3_e1Y2A for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:29:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 75AD72153F
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YCJXVBgO4Vme3TigeREWDcq2buieOFc+drbNrCfzycA=; b=HTdGenJ2/2/t9PASAUxjdjoGhz
	xa+jWufQq4GuIA4V61vyLxOHFcWXZY3F53RwBaOBlmQ+lo5f/ud9DRIXAtupjBLV/ak8T2ya7gI0B
	0s21iHztcXD957U7yj2CiT1bP/Ww+i6eVRzdEmqUS9EBpI+2r62oBGZ+MhWOk9kfHgi7Ke0OQjXdO
	bI1FhezpC8KnvH9Dk+2fM56EvrYdLWwMTB6i8P6y6achHBuJ50YbMakqp+SwMdY3OlcPfKojkHmd+
	fZK7ZEFzDAIBpyJYaUseYhNk8fOrT/tJrSNqZ7beLh6e3+48snlln0rNj4AW6va69by98XpTnDsHD
	28VwiDVA==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQtn-00ELGd-PP; Wed, 30 Mar 2022 05:29:40 +0000
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
Subject: [PATCH 05/15] block: turn bdev->bd_openers into an atomic_t
Date: Wed, 30 Mar 2022 07:29:07 +0200
Message-Id: <20220330052917.2566582-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yNxX34Uz0kJ.A.Jx.d6-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1828
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-6-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:46:05 +0000 (UTC)

All manipulation of bd_openers is under disk->open_mutex and will remain
so for the foreseeable future.  But at least one place reads it without
the lock (blkdev_get) and there are more to be added.  So make sure the
compiler does not do turn the increments and decrements into non-atomic
sequences by using an atomic_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
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
index dd0763a1c6740..5fdda716620e6 100644
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
index 1abd5a56a5c99..3b11625825d3f 100644
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

