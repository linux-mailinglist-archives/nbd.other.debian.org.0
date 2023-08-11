Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E1778C09
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:27:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1AC242063F; Fri, 11 Aug 2023 10:27:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:27:03 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 50284205CD
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6KEHPS4YMRYF for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B89B520613
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=S8LxUOl9S56sj1DsOn3uC49nZqQheJn1S7aYKJA11jg=; b=fkOly2mevOW8hIE5cZNxMEgxAl
	jN6B8K2TnBXJ8+UG2oXVDPYt/7z8mT1oNY7M4UBN1MAmjJbXwiRZfA5EL4bpbIfJImCXkL9e4jf97
	hLKjI/XcUu413tNdv9CaTSwn3136xufGGEn1EAcqtjyVSllB6WhXcecnMFuRjgTxymUbahUSnnACC
	mcmLMnHD0UdZC53BIV5n2+8XL253m6UyyaBJ4052PplSHfakO56gbBkrYSY3NCztQqTDD7Y9XrazO
	xGva8bUJGNwe5LUFB9yglCgtfhrX09dLKnDW+Kigzy3CMvtM+rajG/g0gD/Wjr2QlkrpkMQmFsm2t
	+wPdtZTw==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4g-00A5jn-1A;
	Fri, 11 Aug 2023 10:08:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 08/17] block: simplify the disk_force_media_change interface
Date: Fri, 11 Aug 2023 12:08:19 +0200
Message-Id: <20230811100828.1897174-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qBos6aw6MkD.A.YBB.3zg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2609
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-9-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:27:03 +0000 (UTC)

Hard code the events to DISK_EVENT_MEDIA_CHANGE as that is the only
useful use case, and drop the superfluous return value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/disk-events.c    | 15 ++++-----------
 drivers/block/loop.c   |  6 +++---
 include/linux/blkdev.h |  2 +-
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/block/disk-events.c b/block/disk-events.c
index 0cfac464e6d120..6189b819b2352e 100644
--- a/block/disk-events.c
+++ b/block/disk-events.c
@@ -294,25 +294,18 @@ EXPORT_SYMBOL(disk_check_media_change);
  * @disk: the disk which will raise the event
  * @events: the events to raise
  *
- * Generate uevents for the disk. If DISK_EVENT_MEDIA_CHANGE is present,
- * attempt to free all dentries and inodes and invalidates all block
+ * Should be called when the media changes for @disk.  Generates a uevent
+ * and attempts to free all dentries and inodes and invalidates all block
  * device page cache entries in that case.
- *
- * Returns %true if DISK_EVENT_MEDIA_CHANGE was raised, or %false if not.
  */
-bool disk_force_media_change(struct gendisk *disk, unsigned int events)
+void disk_force_media_change(struct gendisk *disk)
 {
-	disk_event_uevent(disk, events);
-
-	if (!(events & DISK_EVENT_MEDIA_CHANGE))
-		return false;
-
+	disk_event_uevent(disk, DISK_EVENT_MEDIA_CHANGE);
 	inc_diskseq(disk);
 	if (__invalidate_device(disk->part0, true))
 		pr_warn("VFS: busy inodes on changed media %s\n",
 			disk->disk_name);
 	set_bit(GD_NEED_PART_SCAN, &disk->state);
-	return true;
 }
 EXPORT_SYMBOL_GPL(disk_force_media_change);
 
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 37511d2b2caf7d..705a0effa7d890 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -603,7 +603,7 @@ static int loop_change_fd(struct loop_device *lo, struct block_device *bdev,
 		goto out_err;
 
 	/* and ... switch */
-	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
+	disk_force_media_change(lo->lo_disk);
 	blk_mq_freeze_queue(lo->lo_queue);
 	mapping_set_gfp_mask(old_file->f_mapping, lo->old_gfp_mask);
 	lo->lo_backing_file = file;
@@ -1067,7 +1067,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	/* suppress uevents while reconfiguring the device */
 	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 1);
 
-	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
+	disk_force_media_change(lo->lo_disk);
 	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
@@ -1171,7 +1171,7 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	if (!release)
 		blk_mq_unfreeze_queue(lo->lo_queue);
 
-	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
+	disk_force_media_change(lo->lo_disk);
 
 	if (lo->lo_flags & LO_FLAGS_PARTSCAN) {
 		int err;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 83262702eea71a..c8eab6effc2267 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -750,7 +750,7 @@ static inline int bdev_read_only(struct block_device *bdev)
 }
 
 bool set_capacity_and_notify(struct gendisk *disk, sector_t size);
-bool disk_force_media_change(struct gendisk *disk, unsigned int events);
+void disk_force_media_change(struct gendisk *disk);
 
 void add_disk_randomness(struct gendisk *disk) __latent_entropy;
 void rand_initialize_disk(struct gendisk *disk);
-- 
2.39.2

